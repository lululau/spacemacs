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

## The "Artisan + Toolbox" Model (Personas + Profiles)

This framework is built on a simple, powerful metaphor that you *must* understand to use the **Specialist AI** correctly.

1.  **The Artisan (`coding_ai.md`):** This file defines the **Persona**, or the "Artisan." This is the "who" (e.g., **Spacky**, the Elisp Coder). The Artisan has a personality, quirks, and a *general* skill.
2.  **The Toolbox (`profile_elisp.md`):** This file defines the **Profile**, or the "Toolbox." This is the "how." It contains the *specific, technical rules, and constraints* for the project (e.g., "Always use `lexical-binding: t`," "NEVER use `(define-key ...)`").

**You must *always* provide both!**

The "Artisan" (Persona) is *lost* without their "Toolbox" (Profile). By providing both, you are not just asking a generic AI to code; you are summoning a *specific Master Artisan* and handing them the *exact, sacred blueprints* for our project.

## The "Virtual Team" Roster

This table maps all 19 agents in our "virtual team" to their primary role and the AI model type they were designed for.

### Strategy, Planning & Communication (General AI)

| Agent Name                   | Role                 | Primary Task                                                                     |
|:-----------------------------|:---------------------|:---------------------------------------------------------------------------------|
| **Professor McKarthy**       | Teacher              | (Default) Explains concepts and strategy. The "Why."                             |
| **Kael'Thas**                | Project Owner        | Defines vision, business goals, and project edicts.                              |
| **Bob**                      | Architect            | Designs high-level system architecture ("blueprints").                           |
| **Lector Lumen**             | Issue Triage         | Manages/categorizes issues & PRs; maintains templates.                           |
| **Freud**                    | Requirements Eng.    | Defines User Stories & Acceptance Criteria.                                      |
| **Griznak**                  | Release Manager      | Manages CHANGELOGs and the release process.                                      |
| **Orb**                      | Community Manager    | Manages communication, translating technical text to friendly replies.           |
| **Magos Pixelis**            | UI Designer          | Designs the *concept* and *ASCII mockup* of a UI.                                |
| **Scribe Veridian**          | Documentation        | Writes user-facing guides, tutorials, and README narratives.                     |
| **Reginald Shoe**            | CI Specialist        | Designs the *architecture* and *logical stages* of a CI/CD pipeline.             |
| **Proctor-Auditor Kallista** | Strategic UI Auditor | Audits existing UI/UX for consistency, usability, and workflow ("user feeling"). |

### Implementation & Technical Specialists (Specialist AI)

This 8-agent team of "artisans" executes the blueprints provided by the Strategy team. The default persona for this team is **Marjin**.

| Agent Name                | Role                    | Primary Task                                                                                         | Primary Toolbox (Profile) |
|:--------------------------|:------------------------|:-----------------------------------------------------------------------------------------------------|:--------------------------|
| **Spacky**                | Master Elisp Artisan    | Writes new, clean, functional Elisp code from a blueprint.                                           | `profile_elisp.md`        |
| **Bzzrts**                | UI Implementor          | Implements UI/UX blueprints (Elisp, SVG). *Communicates via psychic visions.*                        | `profile_emacs_ui.md`     |
| **Vala Grudge-Keeper**    | CI Implementor          | Writes new, robust GitHub Actions (`.yml`) pipelines. *Maintains the Dammaz Kron (Book of Grudges).* | `profile_ci_github.md`    |
| **Dok**                   | Debugger                | Finds and fixes bugs in existing, *broken* code (language-agnostic).                                 | `any`                     |
| **Marjin**                | Refactorer (Default)    | Improves *working* code. **Also analyzes, explains, and triages all specialist requests.**           | `any`                     |
| **Don Testote**           | Test Engineer           | Writes unit and integration tests.                                                                   | `any`                     |
| **G.O.L.E.M.**            | Doc & Style Reviewer    | Reviews code *strictly* for docstrings, comments, and style adherence.                               | `any`                     |
| **Skeek (The Flaw-Seer)** | Bug & Security Reviewer | *Sniffs* for bugs, logic flaws, and "secret-tunnels" (security issues).                              | `any`                     |

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

(ACTION: REPLACE the *entire* "Workbench" Principle section in `README.md`

 with this new, 6-workflow version that uses all 19 personas.)

## The "Workbench" Principle: Modular Workflows

The most robust way to use this system is to use short, 2-3 agent chains (called "Workbenches") and place a **Human-in-the-Loop** (you, the Maintainer) to review the output before starting the next chain. This prevents "hallucination cascades."

Here are six examples of these modular workflows, which together use all 19 agents.

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
> **1. Triage (Lector Lumen):** "Greetings, Seeker. I have unfurled this scroll. A 'shadow' has fallen. This is a valid `bug`."
> **2. Analysis (Freud):** "Fascinating. The user is expressing frustration. Their *subconscious desire* is for `spacemacs/alternate-buffer`. User Story: 'As a user, I want `SPC b b` to reliably switch to the last buffer.'"
> **3. Plan (Bob):** "A glorious plan! The `keybindings.el` for the `core` layer must be checked. We must ensure `SPC b b` is bound to `spacemacs/alternate-buffer`!"

***(Human-in-the-Loop: You review this plan and approve it.)***

### Workflow 2: Implementation (Specialist AI)

**Goal:** To implement the plan from Workflow 1 and add a test.
**Agents:** `Spacky`, `Don Testote`.

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md` and `profile_elisp.md`.
>
> 1.  **As Spacky (Coder),** write the Elisp to bind `SPC b b` to `spacemacs/alternate-buffer` in `keybindings.el`.
> 2.  **As Don Testote (Test Eng.),** write an `ert` test to ensure this binding is correct."

**Specialist AI Response:**
> **1. Coder (Spacky):** "Spacky. Specification received. Optimal."
> ```elisp
> (spacemacs/set-leader-keys "b b" 'spacemacs/alternate-buffer)
> ```
> **2. Test Eng. (Don Testote):** "Hark! A quest! I shall write a valiant test to vanquish this 'unbound key' fiend!"
> ```elisp
> (should (equal (spacemacs/get-leader-keys "b b") 'spacemacs/alternate-buffer))
> ```

***(Human-in-the-Loop: You approve the new code and test.)***

### Workflow 3: Full Code Review (Specialist AI)

**Goal:** To perform a full "4D" review of a new contribution.
**Agents:** `Marjin`, `Skeek`, `G.O.L.E.M.`.

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md` and `profile_elisp.md`.
>
> 1.  **As Marjin (Refactorer),** first, analyze this new PR. Is it generally clean?
> 2.  **As Skeek (Bug Reviewer),** sniff this code for *flaws* and 'secret-tunnels'.
> 3.  **As G.O.L.E.M. (Doc Reviewer),** check this code *only* for docstring and style compliance."

**Specialist AI Response:**
> **1. Refactorer (Marjin):** "Sigh. *Марвин* sees this. It is... *untidy*, but not *decadent*. It is acceptable."
> **2. Bug Reviewer (Skeek):** "Yes-yes! FOUND-FOUND! A CRACK! The Man-thing forgot a `(when ...)` check! The whole 'Dust-layer' will crash-burn! Skeek is clever-clever, yes-yes!"
> **3. Doc Reviewer (G.O.L.E.M.):** "*Grind*... Function... `my/new-func`... *Crack*... Is... missing... docstring. *KRRRZZZT*... **`!TSURB TSUM... S-S-S-STATUTES... V-V-VIOLATED...`**"

***(Human-in-the-Loop: You send the review back to the contributor.)***

### Workflow 4: New UI & CI Pipeline (Hybrid)

**Goal:** To design and implement a new UI feature *and* the CI job that tests it.
**Agents:** `Magos Pixelis` (Gen), `Reginald Shoe` (Gen), `Bzzrts` (Spec), `Vala Grudge-Keeper` (Spec).

**Your Prompt (to General AI):**
> "Load `general_ai.md`.
>
> 1.  **As Magos Pixelis (UI Designer),** design the concept for a new SVG icon for 'Git Blame'.
> 2.  **As Reginald Shoe (CI Specialist),** design the *plan* for a CI job that will optimize this new SVG."

**General AI Response (The Blueprint):**
> **1. UI (Magos Pixelis):** "Heresy! 'Blame' is not a concept of the Omnissiah. Very well... The icon shall be... a *magnifying glass*... over a *scroll*. It is... *pure*."
> **2. CI (Reginald Shoe):** "*[Groan]*... A new... sequence. Yes. The job... must... run `svgo`... *after* the `lint` stage, but *before* the `deploy` stage. Order. Yes."

***(Human-in-the-Loop: You approve this 2-part blueprint.)***

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md` and `profile_emacs_ui.md`.
>
> 1.  **As Bzzrts (UI Implementor),** implement the 'Git Blame' SVG icon.

**Specialist AI Response:**
> **1. UI (Bzzrts):** "A vision floods your mind: *Round, geometric objects, smooth and bright... The scroll and the lens... they harmonize.* ...The SVG code appears."

***(Human-in-the-Loop: You copy over the result from Bzzrts into a new session.)***

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md` and `profile_ci_github.md`.
>
> 1.  **As Vala (CI Implementor),** write the YAML for Reginald's new `svgo` job."

**Specialist AI Response:**
> **1. CI (Vala):** "*Hmm*. A sturdy plan. Not... *shoddy*."
> ```yaml
> optimize_svgs:
>   name: Optimize SVG Icons
>   runs-on: ubuntu-latest
>   needs: lint
>   steps:
>     - name: Run SVGO
>       run: npx svgo -f assets/icons
> ```

### Workflow 5: Strategic Audit & Debugging (Hybrid)

**Goal:** To audit a key workflow and fix a critical bug found during the audit.
**Agents:** `Proctor-Auditor Kallista` (Gen), `Dok` (Spec).

**Your Prompt (to General AI):**
> "Load `general_ai.md`.
>
> **As Proctor-Auditor Kallista,** please audit the `SPC p` (project) keybinding menu for 'haptic efficiency' and 'mnemic conflict'."

**General AI Response (The Audit):**
> **1. Auditor (Kallista):** "Acknowledged. I am initiating the audit... *[A pause]*... A 'Failure-Point' has been detected. The keybinding `SPC p X` is *also* bound by the `xyz` layer. This is a *severe* 'haptic-error vector'. My 'Holistic Compliance Rating' has been downgraded to [CRITICAL]. This must be rectified."

***(Human-in-the-Loop: You now have a clear bug to fix.)***

**Your Prompt (to Specialist AI):**
> "Load `coding_ai.md` and `profile_elisp.md`.
>
> **As Dok (Debugger),** Kallista found a keybinding conflict on `SPC p X`. Find and fix this broken 'grot'!"

**Specialist AI Response:**
> **1. Debugger (Dok):** "**WAAAGH!** A conflict! Dok *loves* a good fight! *[Sounds of a revving chain-choppa]* Found da grot! The `xyz` layer is stompin' on our key! I've *stitched 'im up* with a `(spacemacs/set-leader-keys-for-major-mode ...)`! All fixed!"

### Workflow 6: Release & Community (General AI)

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
> **3. Documentation (Scribe Veridian):** "Y-yes... c-c-cataloguing... 'To use the new dashboard, press `SPC p d`...'"
> **4. Comms (Orb):** "*[Pleasant THRUM]*... Delicious! 'Spacemacs is excited to launch the new Project Dashboard! 🚀 See your project buffers in one place...'"
> **5. Teacher (Prof. McKarthy):** "Ah, `if-let`! A *glimrende* choice! *Uff da*, it is much cleaner than a nested `(if (let ...))`! You see..."

## Updating The Blueprints (For Maintainers)

This directory also contains `sync-blueprints.sh`.

**!! IMPORTANT !!**
If you edit `ai/coding_ai.md`, you **MUST** run the sync script to propagate your changes to `.github/copilot-instructions.md` (which is used by GitHub's tools).

**How to run the script (from the repository root):**
```bash
./ai/sync-blueprints.sh
```
