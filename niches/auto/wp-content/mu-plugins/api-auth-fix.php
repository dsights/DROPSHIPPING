<?php
/**
 * Local HTTP dev fix for WooCommerce REST API authentication.
 *
 * Problem 1: Apache mod_php strips Authorization header
 * Problem 2: WC REST auth only runs on HTTPS (not HTTP)
 * Problem 3: WC REST is_request_to_rest_api() doesn't detect ?rest_route= fallback URLs
 */

// 1. Recover Basic Auth credentials from Authorization header
function _local_recover_auth() {
    $auth = '';
    foreach (['HTTP_AUTHORIZATION', 'REDIRECT_HTTP_AUTHORIZATION'] as $k) {
        if (!empty($_SERVER[$k])) { $auth = $_SERVER[$k]; break; }
    }
    if (!$auth && function_exists('apache_request_headers')) {
        $h = @apache_request_headers();
        $auth = $h['Authorization'] ?? $h['authorization'] ?? '';
    }
    if ($auth && stripos($auth, 'basic ') === 0) {
        $decoded = base64_decode(substr($auth, 6));
        if ($decoded && ($pos = strpos($decoded, ':')) !== false) {
            $_SERVER['PHP_AUTH_USER'] = substr($decoded, 0, $pos);
            $_SERVER['PHP_AUTH_PW']   = substr($decoded, $pos + 1);
            $_SERVER['HTTP_AUTHORIZATION'] = $auth;
        }
    }
}
_local_recover_auth();

// 2. Fake HTTPS only for REST API requests so WC accepts Basic Auth on local HTTP.
//    Do NOT set globally — that causes WordPress to redirect all HTTP pages to https://localhost.
$_is_rest = !empty($_GET['rest_route']) || strpos($_SERVER['REQUEST_URI'] ?? '', '/wp-json/') !== false;
if ($_is_rest && (empty($_SERVER['HTTPS']) || $_SERVER['HTTPS'] === 'off')) {
    $_SERVER['HTTPS']       = 'on';
    $_SERVER['SERVER_PORT'] = '443';
}

// 3. Make WC detect ?rest_route=/wc/... as a REST API request
add_filter('woocommerce_rest_is_request_to_rest_api', function($is_rest) {
    if ($is_rest) return true;
    $route = $_GET['rest_route'] ?? $_SERVER['PATH_INFO'] ?? '';
    return strpos($route, '/wc/') !== false || strpos($route, '/wc-') !== false;
}, 1);

// 4. Preserve original REQUEST_URI for WC OAuth signature check
add_action('init', function() {
    $route = $_GET['rest_route'] ?? '';
    if ($route && strpos($route, '/wc/') !== false) {
        $_SERVER['ORIGINAL_REQUEST_URI'] = $_SERVER['REQUEST_URI'];
    }
}, 1);
