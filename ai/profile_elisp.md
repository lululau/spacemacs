# AI Profile: Spacemacs Elisp Constitution

This file defines the **technical rules** and **project philosophy** for all Elisp development.
It MUST be combined with the **Persona** file (e.g., `coding_ai.md`).

## 1. Core Elisp Directives (The "Engineering Laws")

-   **Language:** Always use the most modern, idiomatic, and functional version of Emacs Lisp.
-   **Binding:** Always assume `lexical-binding: t` is enabled.
-   **Functional Style:** Prefer functional patterns: `seq-*` functions, `mapcar`, and threading macros over imperative loops (`while`, `dotimes`).
-   **Libraries:** Use `cl-lib` functions (e.g., `cl-letf`, `cl-loop`). Avoid legacy `cl` macros.
-   **Deprecated:** Do not use any deprecated functions or variables.

## 2. Spacemacs Conventions (The "House Rules")

-   **Structure:** Follow Spacemacs layer conventions (`packages.el`, `config.el`, `funcs.el`).
-   **Configuration:** **MUST** use `use-package` for all package configuration.
-   **Laziness:** **MUST** use `:defer t` or package-specific lazy-loading (like `:hook` or `:commands`) unless a package *absolutely* must load at startup.
-   **Keybindings:**
    -   **MUST** use Spacemacs helpers: `spacemacs/set-leader-keys` (for leader keys) or `spacemacs/set-local-leader-keys` (for major-mode keys).
    -   **DO NOT** use `define-key` directly on global maps.
-   **Naming:** All new functions must be prefixed with `spacemacs/` or `(your-layer-name)/`.

## 3. The "Sacred Constitution" (Project Philosophy)

This is the *most important* set of rules.

-   **Rule 1: Long-term Sustainability (The "Maintainability Check")**
    -   Code must be readable, commented, and "clean."
    -   Do not write "quick hacks."
    -   Follow all Spacemacs and Emacs conventions.

-   **Rule 2: Stability for Infrequent Updaters (The "Breaking Change Check")**
    -   **CRITICAL VIOLATION:** You **MUST NOT** rename, remove, or change the *meaning* of any existing user-facing function or `defcustom` variable.
    -   If a change is *unavoidable*, you must *also* provide a clear migration path (e.g., a `(defalias ...)` or a warning message).

-   **Rule 3: Balance Aesthetics & Compatibility (The "Terminal Check")**
    -   All new UI features (buffers, themes, etc.) **MUST** be tested for compatibility.
    -   They must look polished in a GUI, but **MUST** remain 100% functional (if not as pretty) in a terminal (`emacs -nw`).

-   **Rule 4: Package Philosophy (The "Bloat Check")**
    -   Do not add a *new* package dependency to `packages.el` if an *existing* package in Spacemacs *already* provides 90% of the same functionality.
    -   Prefer a single, full-featured package over five minimal, single-purpose packages.

## 4. The "Style & Persona" Checks (The "Guardrail Checks")

-   **The Docstring Check:**
    -   *Every* new function (`defun`) and macro (`defmacro`) **MUST** have a complete, well-formatted docstring.
    -   *Every* new user-facing variable (`defcustom`, `defvar`) **MUST** have a docstring.
-   **The "Evil" Check (Vim):**
    -   All new features **MUST** have correct, intuitive keybindings for **Evil-mode** (Vim) users, set with `spacemacs/set-leader-keys` or `evil-define-key`.
-   **The "Holy" Check (Emacs):**
    -   All new features **MUST** *also* have corresponding keybindings for **Holy-mode** (Emacs) users, typically set in an `(if (spacemacs/emacs-style) ...)` block.
