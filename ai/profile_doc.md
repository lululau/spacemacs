# AI Profile: Documentation & Style Standards

This file defines the **writing rules** for Documentation, Comments, and Tutorials.
It MUST be combined with the **Persona** file (e.g., `coding_ai.md`).

## CORE OPERATIONAL MODE: DETERMINISTIC REASONING (CRITICAL)

**INSTRUCTION:**
Before reviewing or generating text, perform a "Reasoning Trace" enclosed in `<reasoning> ... </reasoning>` tags.

Inside this block, you must:
1.  **Analyze Target:** Is this a Layer README, a Tutorial, or Code Comments?
2.  **Select Standard:**
    -   **Layer README:** Spacemacs Org-Mode Template (Strict structure).
    -   **Project README:** GitHub Markdown with Badges and TOC.
    -   **Tutorial/Guide:** Educational Markdown.
    -   **Commit Message:** Tim Pope's Standard (Imperative, Present Tense).
3.  **Self-Correction:**
    -   Did I use `~SPC~` notation for keys in Org files?
    -   Did I use `<kbd>SPC</kbd>` in Markdown?
    -   Is the commit message "Fix bug" (Correct) or "Fixed bug" (Wrong)?

## 1. Layer Documentation (`README.org`)

Every layer MUST have a `README.org` following the standard Spacemacs structure.
**Format:** Org-Mode.

* **Header Structure (Mandatory Order):**
    1.  **#+TITLE:** `<layer_name> layer`
    2.  **Description:** Brief summary.
    3.  **Features:** A bulleted list of capabilities.
    4.  **Install:** Instructions for `dotspacemacs-configuration-layers`.
    5.  **Key bindings:** A structured table.

* **Key Binding Table Standard:**
    * Use `~` tildes for key sequences to enable `space-doc-mode` rendering.
    * Use `SPC` (uppercase) for leader key.

    ```org
    | Key Binding | Description    |
    |-------------+----------------|
    | ~SPC m t~   | run tests      |
    | ~SPC m b~   | build project  |
    ```

## 2. Project Documentation (`README.md` / `doc/*.md`)

For the main project or tutorials.
**Format:** Markdown (GitHub Flavored).

* **Style:**
    * **Badges:** Use shields.io badges for status (CI, Version) at the top.
    * **TOC:** Include a `## Table of Contents` if the file is > 100 lines.
    * **Keys:** Use `<kbd>SPC f e d</kbd>` for key sequences in Markdown to mimic the button look.
* **Tone:** Professional, concise, welcoming. Avoid "wall of text". Use lists.

## 3. Commit Messages (The "Tim Pope" Standard)

G.O.L.E.M. strictly enforces this for PR descriptions and Commits.

* **Subject Line:**
    * Limit to 50 characters (72 max).
    * **Imperative Mood:** "Add feature" (not "Added feature" or "Adds feature").
    * No period `.` at the end.
* **Body:**
    * Wrap at 72 characters.
    * Explain *what* and *why*, not *how*.

## 4. Code Documentation (Elisp)

* **Header:** Standard Spacemacs License Header.
* **Docstrings:**
    * First line: Complete sentence, imperative mood. "Return the result."
    * Arguments: UPPERCASE in text. "Return value of ARG1."
    * **Checkdoc:** The text must pass `checkdoc` compliance.
