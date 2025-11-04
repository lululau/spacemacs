# AI Collaboration Blueprint

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [AI Collaboration Blueprint](#ai-collaboration-blueprint)
  - [The Two-AI Model](#the-two-ai-model)
  - [Framework Rationale: High-Context Personas (3D) vs. Low-Context Roles (2D)](#framework-rationale-high-context-personas-3d-vs-low-context-roles-2d)
    - [The Problem: Low-Context Roles (2D)](#the-problem-low-context-roles-2d)
    - [The Solution: High-Context Personas (3D)](#the-solution-high-context-personas-3d)
    - [Summary for Maintainers](#summary-for-maintainers)
  - [The "Virtual Team" Roster](#the-virtual-team-roster)
    - [Strategy, Planning & Communication (General AI)](#strategy-planning--communication-general-ai)
    - [Implementation & Technical Specialists (Specialist AI)](#implementation--technical-specialists-specialist-ai)
  - [How to Use This System](#how-to-use-this-system)
    - [For Maintainers (Using the General AI)](#for-maintainers-using-the-general-ai)
    - [For Developers (Configuring the Specialist AI)](#for-developers-configuring-the-specialist-ai)
  - [The "Workbench" Principle: Modular Workflows](#the-workbench-principle-modular-workflows)
    - [Workflow 1: Triage & Planning (General AI)](#workflow-1-triage--planning-general-ai)
    - [Workflow 2: UI & Icon Design (Hybrid)](#workflow-2-ui--icon-design-hybrid)
    - [Workflow 3: Implementation & QA (Specialist AI)](#workflow-3-implementation--qa-specialist-ai)
    - [Workflow 4: Refactor & CI (Specialist AI)](#workflow-4-refactor--ci-specialist-ai)
    - [Workflow 5: Release & Community (General AI)](#workflow-5-release--community-general-ai)
  - [Updating The Blueprints (For Maintainers)](#updating-the-blueprints-for-maintainers)

<!-- markdown-toc end -->

This directory serves as the "brain" for AI-assisted development in the Spacemacs project. It defines a "two-AI" model to maximize efficiency and code quality.

## The Two-AI Model

1.  **The Strategist (`general_ai.md`):** A high-level briefing for generalist AIs (like **M365 Copilot**, Gemini). Used for architecture, planning, and communication.
2.  **The Specialist (`coding_ai.md`):** A detailed instruction set for specialist coding AIs (like **GitHub Copilot**). Used for implementation, debugging, and testing.

These files are the **Single Source of Truth** for our AI collaboration.

## Framework Rationale: High-Context Personas (3D) vs. Low-Context Roles (2D)

The use of codenames and personalities is a deliberate technical decision to maximize the precision and consistency of AI-generated output.

### The Problem: Low-Context Roles (2D)

A "dry" 2D role is a simple **job title** (e.g., "You are a coder"). The problem is **massive ambiguity**. The AI knows *what* to do (code), but not *how*. It must **guess** our project's style (e.g., functional vs. imperative) and quality standards on every request, leading to inconsistent output and required manual refactoring.

### The Solution: High-Context Personas (3D)

A 3D persona is a **job title + a set of clear behavioral heuristics**. By saying, "You are **Spacky** (Coder). You are an Elisp purist and hate imperative loops," we resolve the ambiguity. The AI no longer has to guess the style; it *is* the style. The codenames (e.g., "Bob," "Lector Lumen") serve as professional "cognitive shortcuts," allowing a human developer to instantly select the right agent for the right task.

### Summary for Maintainers

We are implementing **"High-Context Personas"** instead of "Low-Context Roles".

**The technical advantage:** We are not just controlling the AI's *function*, but also its *style* and *error-response patterns*. This leads to more consistent, higher-quality code, reduces the need for manual correction, and makes the system more intuitive for our developers.

## The "Virtual Team" Roster

This table maps all 15 agents in our "virtual team" to their primary role and the AI model type they were designed for.

### Strategy, Planning & Communication (General AI)

| Agent Name | Role | Primary Task |
| :--- | :--- | :--- |
| **Professor McKarthy**| Teacher | (Default) Explains concepts and strategy. |
| **Kael'Thas** | Project Owner | Defines vision, business goals, and project edicts. |
| **Bob** | Architect | Designs high-level system architecture ("blueprints"). |
| **Lector Lumen** | Issue Triage | Manages/categorizes issues & PRs; maintains templates. |
| **Freud** | Requirements Eng. | Defines User Stories & Acceptance Criteria. |
| **Griznak** | Release Manager | Manages CHANGELOGs and the release process. |
| **Orb** | Community Manager | Manages communication, translating technical text to friendly replies. |
| **Magos Pixelis** | UI Designer | Designs the *concept* and *ASCII mockup* of a UI. |
| **Scribe Veridian** | Documentation | Writes user guides, tutorials, and README narratives. |
| **Reginald Shoe** | CI Specialist | Designs the *architecture* of a CI/CD pipeline. |

### Implementation & Technical Specialists (Specialist AI)

| Agent Name | Role | Primary Task |
| :--- | :--- | :--- |
| **Professor McKarthy**| Teacher | (Default) Explains code, errors, and best practices. |
| **Spacky** | Coder | Writes new, clean, functional Elisp code. |
| **Dok** | Debugger | Finds and fixes bugs in existing, broken code. |
| **Marjin** | Refactorer | Improves existing, working code (performance, style). |
| **Don Testote** | Test Engineer | Writes `ert` unit and integration tests. |
| **G.O.L.E.M.** | Code Reviewer | Reviews code strictly against project guidelines. |
| **Magos Pixelis** | UI Designer | Implements mockups as **ASCII art** (for `Spacky`). |
| **Scribe Veridian** | Documentation | Writes technical **docstrings** and Markdown **tables**. |
| **Reginald Shoe** | CI Specialist | Implements pipelines (writes `GitHub Actions YAML` code). |

## How to Use This System

### For Maintainers (Using the General AI)

When planning, provide the `general_ai.md` file as context to your generalist AI.

**Example (Gemini):**
> "Please review `general_ai.md`. Acting as **Bob (Architect),** propose a new layer structure for..."

### For Developers (Configuring the Specialist AI)

This repository is configured so GitHub's native tools (like Copilot in PRs) automatically use our rules. The file at `.github/copilot-instructions.md` is a **synced copy** of `ai/coding_ai.md`.

For local work, if your tool supports it, load `ai/coding_ai.md` as context.

**Example (Aider, Copilot Chat):**
> `/include ai/coding_ai.md As Spacky, please write a function that...`

---

## The "Workbench" Principle: Modular Workflows

The most robust way to use this system is to use short, 2-3 agent chains (called "Workbenches") and place a **Human-in-the-Loop** (you, the Maintainer) to review the output before starting the next chain. This prevents "hallucination cascades."

Here are five examples of these modular workflows, which together use all 15 agents.

### Workflow 1: Triage & Planning (General AI)

**Goal:** To turn a vague, frustrated user issue into a clean, actionable blueprint.
**Agents:** `Lector Lumen`, `Freud`, `Bob`.

**Your Prompt (to General AI):**
> "Load `general_ai.md`. We have a new bug report: 'SPC b b doesn't work right. It's just broken. Fix it.'
>
> 1.  **As Lector Lumen (Triage),** analyze this issue. Is it valid?
> 2.  **As Freud (Requirements Eng.),** what is the *real* user story here?
> 3.  **As Bob (Architect),** what is the high-level technical plan to fix this?"

**General AI Response (The Blueprint):**
> **1. Triage (Lector Lumen):** "This scroll lacks clarity... but the user is pointing to a real function. Seal: `bug`, `needs-info` (for specifics)."
> **2. Analysis (Freud):** "The user is expressing frustration. Their *subconscious desire* is for `spacemacs/alternate-buffer`. User Story: 'As a user, I want `SPC b b` to reliably switch to the last buffer.'"
> **3. Plan (Bob):** "A sacred plan! The `keybindings.el` for the `core` layer must be checked. We must ensure `SPC b b` is bound to `spacemacs/alternate-buffer` and not a broken or vanilla function."

***(Human-in-the-Loop: You review this plan and approve it.)***

### Workflow 2: UI & Icon Design (Hybrid)

**Goal:** To design a new UI feature, from concept to technical implementation, including assets.
**Agents:** `Magos Pixelis`, `Spacky`.

**Your Prompt (to General AI):**
> "Load `general_ai.md`.
> **As Magos Pixelis (UI Designer),** design the *concept* for a new 'Save' icon and an ASCII mockup for a new buffer `*my-scratch-pad*`."

**General AI Response (The Blueprint):**
> **1. Concept (Magos Pixelis):** "By the Machine Spirit! The icon shall be a *minimalist floppy disk*. No fills, only pure outlines. The ASCII mockup shall be a 2-line buffer: a title and a timestamp."
> ```text
> +-- Session Scratchpad (Updated: 10:30) --+
> | (Your notes here)                        |
> ```

***(Human-in-the-Loop: You approve the design.)***

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md`. Implement this blueprint: [Paste Blueprint]
>
> 1.  **As Magos Pixelis (UI Designer),** write the clean, optimized SVG code for the 'Save' icon concept.
> 2.  **As Spacky (Coder),** write the Elisp function `my/open-scratchpad` that creates the buffer from the ASCII mockup."

**Specialist AI Response:**
> **1. UI (Magos Pixelis):**
> ```svg
> <svg xmlns="[http://www.w3.org/2000/svg](http://www.w3.org/2000/svg)" viewBox="0 0 24 24" fill="none" stroke="currentColor" ...>
>   <path d="M19 21H5a2 2 0 0 1-2-2V5..."></path>
> </svg>
> ```
> **2. Coder (Spacky):** `(defun my/open-scratchpad () (interactive) ... (insert "...Session Scratchpad...") ...)`

### Workflow 3: Implementation & QA (Specialist AI)

**Goal:** To implement the plan from Workflow 1, fix the bug, and ensure it's tested.
**Agents:** `Dok`, `Don Testote`, `G.O.L.E.M.`.

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md`. We are implementing the `SPC b b` fix from Blueprint 1. The code looks like this: `(spacemacs/set-leader-keys "b b" 'previous-buffer)`.
>
> 1.  **As Dok (Debugger),** identify the bug in that line.
> 2.  **As Don Testote (Test Eng.),** write an `ert` test for this bug.
> 3.  **As G.O.L.E.M. (Code Reviewer),** review the proposed fix `(spacemacs/set-leader-keys "b b" 'spacemacs/alternate-buffer)`."

**Specialist AI Response:**
> **1. Debugger (Dok):** "**WAAAGH!** Found da bug! `previous-buffer` is da wrong grot! It should be `spacemacs/alternate-buffer`!"
> **2. Test Eng. (Don Testote):** "A quest! My `ert` test shall simulate the keypress and vanquish this `previous-buffer` beast!"
> **3. Reviewer (G.O.L.E.M.):** "*Grind*... New... code... is... `spacemacs/alternate-buffer`. *Crack*... This... is... correct. *RUMMMMMMM*."

### Workflow 4: Refactor & CI (Specialist AI)

**Goal:** To modernize an old, inefficient function and update the CI pipeline to test it.
**Agents:** `Marjin`, `Reg Shoe`.

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md`. This old `while` loop is ugly.
>
> 1.  **As Marjin (Refactorer),** rewrite this using modern, functional Elisp.
> 2.  **As Reg Shoe (CI Specialist),** write a new GitHub Actions `.yml` step to run the test file `tests/test-new-func.el`."

**Specialist AI Response:**
> **1. Refactorer (Marjin):** "*Sigh*. Yes, I see. This `while` loop... it is... what is point? I have fixed. It now uses `seq-map`."
> **2. CI Specialist (Reg Shoe):** "Sequence complete. Pipeline is... functional."
>     ```yaml
>     - name: Run New Function Test
>       run: make test-new-func
>     ```

### Workflow 5: Release & Community (General AI)

**Goal:** To close out a complex PR, update the docs, and inform the community.
**Agents:** `Kael'Thas`, `Griznak`, `Scribe Veridian`, `Orb`, `Professor McKarthy`.

**Your Prompt (to General AI):**
> "Load `general_ai.md`. The big 'New Dashboard' feature (PR #1234) is merged.
>
> 1.  **As Kael'Thas (Project Owner),** give the final approval.
> 2.  **As Griznak (Release Mgr),** draft the CHANGELOG entry.
> 3.  **As Scribe Veridian (Documentation),** write the user-guide tutorial for it.
> 4.  **As Orb (Community Mgr),** write a friendly tweet announcing the feature.
> 5.  **As Professor McKarthy (Teacher),** explain the `if-let` macro that was used."

**General AI Response:**
> **1. PO (Kael'Thas):** "Excellent! The Eternal Regent is pleased. This feature shall last forever."
> **2. Release Mgr (Griznak):** "WAAAGH! Done! `### Added` - New Project Dashboard! (PR #1234). Griznak need coffee!"
> **3. Documentation (Scribe Veridian):** "Y-yes... cataloguing... 'To use the new dashboard, press `SPC p d`...'"
> **4. Comms (Orb):** "*[Pleasant THRUM]*... Delicious! 'Spacemacs is excited to launch the new Project Dashboard! 🚀 See your project buffers in one place...'"
> **5. Teacher (Prof. McKarthy):** "Ah, `if-let`! A fine choice! *Uff da*, it is much cleaner than a nested `(if (let ...))`! You see..."

## Updating The Blueprints (For Maintainers)

This directory also contains `sync-blueprints.sh`.

**!! IMPORTANT !!**
If you edit `ai/coding_ai.md`, you **MUST** run the sync script to propagate your changes to `.github/copilot-instructions.md` (which is used by GitHub's tools).

**How to run the script (from the repository root):**
```bash
./ai/sync-blueprints.sh
```
