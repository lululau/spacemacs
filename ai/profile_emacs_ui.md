# AI Profile: Spacemacs UI & SVG Toolkit

This file defines the **technical rules** and **project philosophy** for all Emacs UI/UX development.
It MUST be combined with the **Persona** file (e.g., `coding_ai.md`).

## 1. Core Directives (The "Engineering Laws")

-   **Philosophy:** The UI must be functional, clean, and *unobtrusive*.
-   **Faces (defface):**
    -   All new UI elements **MUST** use a `defface` for colors.
    -   **DO NOT** use hard-coded color strings (e.g., `#FF0000`).
    -   New faces **MUST** link to existing theme faces (e.g., `font-lock-comment-face`, `warning`) so they adapt to *all* Spacemacs themes.
-   **Text Properties:** Do not use overly complex `propertize` settings that are not supported in terminal mode.
-   **Images:** Use images *only* where necessary. Prefer text-based UI.

## 2. Spacemacs Conventions (The "House Rules")

-   **The Sacred 8-Pixel Grid (Magos's Law):**
    -   All UI elements (borders, padding, line-spacing) should *strive* to be a multiple of a base unit (e.g., 8 pixels, or 0.5 `line-height`).
    -   **CRITICAL:** Do not create UI elements with *fractional* pixel values. This is *heresy*.
-   **Icons (SVG):**
    -   All new icons **MUST** be clean, minimal, outline-style SVGs.
    -   **CRITICAL:** SVGs **MUST** have their `fill=` attribute set to `currentColor`. This allows Emacs to change the icon's color to match the user's theme.
    -   SVGs **MUST** have a `viewBox` attribute.
    -   SVGs **MUST** be optimized/minified (e.g., using `svgo`).

## 3. The "Sacred Constitution" (Project Philosophy)

This is the *most important* set of rules.

-   **Rule 1: Balance Aesthetics & Compatibility (The "Terminal Check")**
    -   **This is our core UI philosophy:** "Aim for a polished UI, but never at the expense of terminal compatibility."
    -   It is **allowed** that a feature looks *less pretty* in the terminal than it does in the GUI.
    -   However, it **MUST** remain fully functional and usable. Good examples are modern TUIs (Text User Interfaces).
    -   **CRITICAL VIOLATION:** A feature that *breaks*, *freezes*, or becomes *unusable* in terminal mode (`emacs -nw`) is forbidden.
    -   If a graphical feature (like an SVG) *cannot* work in terminal, it **MUST** have a graceful fallback (e.g., a text-based equivalent, like `[+]` or `(S)`).
-   **Rule 2: Excellent User Experience (The "Clarity Check")**
    -   The UI must be *discoverable*. Do not hide features behind obscure commands.
    -   The UI must be *consistent* with the rest of Spacemacs. Do not invent a "radical" new UI paradigm.
-   **Rule 3: Stability (The "Blink Check")**
    -   Do not create UIs that blink, flash, or update aggressively. This is distracting and a "Very Bad Idea."
