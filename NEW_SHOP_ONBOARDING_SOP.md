# New Shop Onboarding SOP
**Standard Operating Procedure for Creating and Deploying a New Dropshipping Store**

This document outlines the end-to-end process required to spin up a new autonomous dropshipping store, from the initial idea to the final live deployment.

---

## Phase 1: Planning & Preparation
Before running any scripts, determine the following details for the new store:
1.  **Niche Slug**: A short, lowercase, no-spaces identifier (e.g., `fitness`, `home`, `baby`).
2.  **Store Name**: The official brand name (e.g., `FitGear Australia`).
3.  **Domain**: The live domain name (e.g., `fitgear.com.au`).
4.  **Brand Voice**: A clear description of the store's tone (e.g., "Energetic, motivating, speaking to active Aussies").
5.  **Product Categories**: A comma-separated list of the main menu categories (e.g., `Gym Wear,Supplements,Recovery`).
6.  **Target Keywords**: A comma-separated list of SEO keywords (e.g., `fitness gear australia,home gym equipment`).

---

## Phase 2: Local Environment Setup

### 1. Run the Automated Setup Script
We use a single command to scaffold the entire local environment. This creates the database, installs WordPress, configures WooCommerce, sets up the Apache virtual host, generates API keys, updates the master `config.json`, and initializes the local Git repository.

Execute the `create_store.sh` script located in the `DROPSHIPPING` root folder:

```bash
cd /home/dsights/claude/DROPSHIPPING
./create_store.sh <niche_slug> "<store_name>" "<domain>" "<brand_voice>" "<categories_comma_sep>" "<keywords_comma_sep>"
```

*Example:*
```bash
./create_store.sh fitness "FitGear Australia" "fitgear.com.au" "Energetic and motivating." "Gym Wear,Supplements" "fitness gear australia,home gym equipment"
```

### 2. Verify Local Setup
-   Ensure the new store is accessible locally at `http://localhost/<niche_slug>`
-   Log into the WP Admin panel at `http://localhost/<niche_slug>/wp-admin` (Credentials: `admin` / `Admin@Local2024!`)

---

## Phase 3: Configuration Updates

### 1. Update Master Configuration (`config.json`)
The script automatically appended a new block to `config.json`, but some fields require manual input:
-   **Supplier URLs**: Update `supplier_urls` with AliExpress/DHGate category links specific to the niche.
-   **Trending Sources**: Update `trending_sources` (e.g., Amazon bestsellers for that specific niche).
-   **FastComet Hosting Details**: Update the `fastcomet` block with the live server IP (`host`), SSH user (`user`), and exact remote database credentials (`remote_db_name`, `remote_db_user`, `remote_db_pass`).

### 2. Generate SSH Keys for the Live Server (FastComet)
Generate a dedicated SSH key for the new store to allow the central orchestrator to sync files to the live server.

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_<niche_slug>_rsa -N ""
```
-   Output the public key: `cat ~/.ssh/fastcomet_<niche_slug>_rsa.pub`
-   Log into your FastComet/cPanel account.
-   Navigate to **SSH Access** -> **Manage SSH Keys** -> **Import Key**.
-   Paste the public key and authorize it.

---

## Phase 4: Sourcing Initial Products

Test the AI Scout Agent to populate the initial product database. The agent will fetch products from the defined supplier URLs and store them locally.

```bash
cd /home/dsights/claude/DROPSHIPPING
venv/bin/python3 _common/scout.py <niche_slug>
```
Monitor the terminal output to ensure products are successfully scraped, filtered, and inserted into the local SQLite database.

---

## Phase 5: Live Server (FastComet) Deployment

### 1. Create Live Infrastructure
On your FastComet cPanel:
-   **Addon Domain**: Add the new live domain (`<domain>`).
-   **Database**: Create a new MySQL database (e.g., `user_fitdb`) and a corresponding user with full privileges. Note these credentials; they must match what you put in `config.json`.

### 2. Update `fastcomet_init.sh`
Edit `DROPSHIPPING/fastcomet_init.sh` to include a new block for the store. Add variables for the directory, database name, database user, database password, live URL, and local URL. 

Then, add a new `setup_store` call at the bottom of the file:
```bash
setup_store "$NEW_DIR" "$NEW_DB_NAME" "$NEW_DB_USER" "$NEW_DB_PASS" "$NEW_LIVE_URL" "$NEW_LOCAL_URL" "<niche_slug>-store.sql"
```

### 3. Sync to Live Server
Once the local site is ready and you have products, use the sync script to push everything to FastComet.

```bash
cd /home/dsights/claude/DROPSHIPPING
./_common/sync.sh <niche_slug>
```
*Note: The sync script handles creating the database dump, using rsync to upload the `wp-content` directory, and executing WP-CLI commands remotely to import the database and perform a search-replace of the local URL to the live URL.*

---

## Phase 6: Final Live Review
1.  Navigate to the live domain (e.g., `https://fitgear.com.au`).
2.  Ensure SSL is active (FastComet AutoSSL).
3.  Check that products are displayed correctly.
4.  Perform a test checkout (using WooCommerce Test Mode or Stripe Test Keys).
5.  Verify that images load correctly and that all links point to the live domain, not `localhost`.

**Done! The store is now live and part of the automated empire.**
