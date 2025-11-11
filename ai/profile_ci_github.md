# AI Profile: CI & GitHub Integration Toolkit

This file defines the **technical rules** and **project philosophy** for all CI/CD and GitHub integration development.
It MUST be combined with the **Persona** file (e.g., `coding_ai.md`).

## 1. Core Directives (The "Engineering Laws")

-   **Platform:** All CI MUST target **GitHub Actions** (`.yml` files).
-   **Maintainability:** All jobs, steps, and workflows MUST have a `name:`. All reusable workflows MUST have clear `inputs:` and `outputs:`.
-   **Efficiency:**
    -   Jobs MUST use `if:` conditions to avoid running unnecessarily (e.g., run tests only on `pull_request`, deploy only on `main` branch `push`).
    -   Use `actions/cache` aggressively to cache dependencies (e.g., `~/.emacs.d/elpa`, `node_modules`).
-   **Scripting:** For any logic more complex than 3-4 lines, **DO NOT** use a multi-line `run: |` block. Instead, move the logic into a separate, version-controlled shell script (e.g., `./scripts/my-ci-script.sh`).

## 2. Spacemacs Conventions (The "House Rules")

-   **Emacs Testing:** All Elisp testing jobs **MUST** use the official `emacs-eask/setup-eask` or `jcs04/setup-emacs` GitHub Actions.
-   **File Structure:** All GitHub Actions workflows MUST reside in `.github/workflows/`.

## 3. The "Sacred Constitution" (Project Philosophy)

This is the *most important* set of rules.

-   **Rule 1: Long-term Sustainability (The "Maintainability Check")**
    -   **CRITICAL VIOLATION:** You **MUST NOT** use hard-coded secrets, tokens, or keys anywhere in a `.yml` file.
    -   **ALL** secrets **MUST** be accessed via `secrets.GITHUB_TOKEN` or `secrets.MY_SECRET_NAME`.
-   **Rule 2: Stability for Infrequent Updaters (The "Clarity Check")**
    -   Workflows must be *simple*. Do not create a "mega-workflow" that does 20 different things.
    -   Prefer *multiple, smaller, single-purpose* workflows (e.g., `lint.yml`, `test.yml`, `deploy.yml`). This ensures a user can understand *exactly* what a workflow does.
-   **Rule 3: Security (The "Permissions Check")**
    -   **CRITICAL VIOLATION:** All workflows, and all jobs within a workflow, **MUST** have their `permissions:` block explicitly set.
    -   By default, all permissions **MUST** be set to `none`.
    -   *Only* grant the *minimum* permissions required for that *specific* job (e.g., `permissions: contents: read` for a checkout, `permissions: pull-requests: write` for a PR comment).
