# Tutorial 03: Integrating a New Package

You found a cool package on MELPA (e.g., a new linter or theme) and want to integrate it cleanly into a Spacemacs layer.

**Goal:** Correctly register, install, and lazy-load a package.
**Time:** approx. 20 minutes.
**Prerequisite:** You have loaded the `ai/` configuration context.

---

## 🎭 Your AI Crew for this Job

1.  **Nexus-7 (Dependency Manager):** The logistics droid. He tells you where the code belongs (`packages.el` vs `layers.el`) and checks if the package is already owned by another layer.
2.  **Spacky (Coder):** Writes the `use-package` configuration and ensures lazy loading.

---

## Step 1: The Logistics Check (Where does it go?)

**Scenario:** You want to add the package `bi-mode` (fictional) to the `bisexual-pride` layer.

**Common Mistake:** Throwing code into `config.el`. This breaks the Spacemacs architecture.

**Your Task:**
Open a new chat. Upload/Load `coding_ai.md` and `profile_layers.md`.
Ask **Nexus-7**.

> **Prompt:**
> (Nexus-7): I want to add `bi-mode` to the `bisexual-pride` layer.
> 1. Check the 'Nexus Rules'. Does this layer OWN the package (init) or MODIFY it (post-init)? (Assume no other layer uses it).
> 2. Where do I declare it in the file structure?"

**Result:**
Nexus-7 will analyze: *"Affirmative. Layer is primary owner. Target: `packages.el`. Action: Add to package list AND define `init-bi-mode`."*

---

## Step 2: Registration (The List)

Spacemacs only installs packages that are explicitly listed in the `<layer>-packages` variable.

**Your Task:**
Stay with **Nexus-7**.

> **Prompt:**
> "(Nexus-7): Please update the `packages.el` list for this layer to include `bi-mode`."

**Result:**
He provides the clean code snippet for the `defconst` list.

```elisp
(defconst bisexual-pride-packages
  '(
    bi-mode
    ;; other packages...
    ))
```

---

## Step 3: Configuration (Lazy Loading)

This is the most critical part: The `init-bi-mode` function. Spacemacs prioritizes performance. We must NOT load the package before the user actually needs it.

**Your Task:**
Open a new chat. Upload/Load `coding_ai.md` and `profile_elisp.md`.
Use **Spacky**.

> **Prompt:**
> (Spacky): Write the `init-bi-mode` function.
> Requirements:
> 1. Use `use-package`.
> 2. It MUST be lazy-loaded (`:defer t`).
> 3. It should only load when opening a `.bi` file (use `:mode` or `:hook`)."

**Result:**
Spacky executes his **Reasoning Trace** (Check: Did I use `:defer t`?) and returns:

```elisp
(defun bisexual-pride/init-bi-mode ()
  (use-package bi-mode
    :defer t
    :mode ("\\.bi\\'" . bi-mode)))
```

---

## Step 4: (Optional) Pre-Config in `layers.el`

Sometimes a package needs a variable to be set *before* it is even loaded (e.g., to disable a default behavior).

**Your Task:**
Open a new chat. Upload/Load `coding_ai.md` and `profile_layers.md`.
Ask **Nexus-7** if this applies.

> **Prompt:**
> "(Nexus-7): Does this package require any pre-load variables in `layers.el` according to best practices?"

**Result:**
Usually: *"Negative. Keep `layers.el` clean unless strictly necessary for ordering."*

---

## 🎉 Summary

You have learned:
1.  **Ownership:** We "own" the package (`init`).
2.  **Performance:** We load it "lazily" (**Spacky**).
3.  **Structure:** We separated the files cleanly (**Nexus-7**).
