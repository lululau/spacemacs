# AI Collaboration Blueprint

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [AI Collaboration Blueprint](#ai-collaboration-blueprint)
  - [Quick-Start Tutorials](#quick-start-tutorials)
    - [🐛 Level 1: Maintenance & Fixes](#-level-1-maintenance--fixes)
    - [🔨 Level 2: Extension & Configuration](#-level-2-extension--configuration)
    - [🏗️ Level 3: Architecture & Aesthetics](#-level-3-architecture--aesthetics)
    - [🛡️ Level 4: Quality Assurance & Workflow](#-level-4-quality-assurance--workflow)
    - [🚀 Level 5: Advanced Engineering](#-level-5-advanced-engineering)
  - [The Three-AI Model](#the-three-ai-model)
  - [Supported Stacks & Capabilities](#supported-stacks--capabilities)
  - [Framework Rationale: High-Context Personas (3D) vs. Low-Context Roles (2D)](#framework-rationale-high-context-personas-3d-vs-low-context-roles-2d)
    - [The Problem: Low-Context Roles (2D)](#the-problem-low-context-roles-2d)
    - [The Solution: High-Context Personas (3D)](#the-solution-high-context-personas-3d)
    - [Summary for Maintainers](#summary-for-maintainers)
  - [Architectural Abstract (For Data Scientists & AI Engineers)](#architectural-abstract-for-data-scientists--ai-engineers)
    - [Core Architecture & Methodology](#core-architecture--methodology)
  - [The "Artisan + Toolbox" Model For Specialised AI Roles (Personas + Profiles)](#the-artisan--toolbox-model-for-specialised-ai-roles-personas--profiles)
  - [The Agent Roster (Roles & Names)](#the-agent-roster-roles--names)
    - [Strategy, Planning & Communication (General AI)](#strategy-planning--communication-general-ai)
    - [Implementation & Specialists (Specialist AI)](#implementation--specialists-specialist-ai)
    - [Implementation & Specialists (Specialist AI)](#implementation--specialists-specialist-ai-1)
    - [Synthetic User Simulation (Virtual Stakeholders)](#synthetic-user-simulation-virtual-stakeholders)
  - [How to Use This System](#how-to-use-this-system)
    - [Synthetic User Testing (Virtual Stakeholders)](#synthetic-user-testing-virtual-stakeholders)
      - [The Simulation Roster](#the-simulation-roster)
      - [Usage Example: Feature Validation](#usage-example-feature-validation)
  - [The "Workbench" Principle: Modular Workflows](#the-workbench-principle-modular-workflows)
    - [Workflow 1: Triage & Planning (General AI)](#workflow-1-triage--planning-general-ai)
    - [Workflow 2: Implementation (Specialist AI)](#workflow-2-implementation-specialist-ai)
    - [Workflow 3: Full Code Review (Specialist AI)](#workflow-3-full-code-review-specialist-ai)
    - [Workflow 4: New UI & CI Pipeline (Hybrid)](#workflow-4-new-ui--ci-pipeline-hybrid)
    - [Workflow 5: Strategic Audit & Debugging (Hybrid)](#workflow-5-strategic-audit--debugging-hybrid)
    - [Workflow 6: Release & Community (General AI)](#workflow-6-release--community-general-ai)
  - [Updating The Blueprints (For Maintainers)](#updating-the-blueprints-for-maintainers)

<!-- markdown-toc end -->

## Quick-Start Tutorials
New to the AI Framework? Start here! These guides take you by the hand and show you specific AI-assisted workflows.

### 🐛 Level 1: Maintenance & Fixes
* **[Tutorial 1: The Bug Triage Workflow](ai/tutorials/01_bug_triage_and_fix.md)** - How to analyze bugs with Lector Lumen, find the cause with Dok, and fix them.
* **[Tutorial 2: Solving Keybinding Conflicts](ai/tutorials/02_keybinding_conflicts.md)** - Detecting "shadowing" and resolving haptic conflicts using Proctor Kallista.

### 🔨 Level 2: Extension & Configuration
* **[Tutorial 3: Integrating New Packages](ai/tutorials/03_package_integration.md)** - The clean way to add packages using lazy-loading and Nexus-7 dependency checks.
* **[Tutorial 4: Defining New Keybindings](ai/tutorials/04_new_keybindings.md)** - Finding safe, mnemonic slots in the User Space (`SPC o`) without breaking upstream.
* **[Tutorial 5: Writing Layer Documentation](ai/tutorials/05_documentation.md)** - Generating standard-compliant READMEs and keybinding tables effortlessly with Scribe Veridian.

### 🏗️ Level 3: Architecture & Aesthetics
* **[Tutorial 6: Creating a New Layer](ai/tutorials/06_new_layer_creation.md)** - Architecture blueprint by Bob for a full ecosystem integration (Packages, Config, Keys).
* **[Tutorial 7: Performance Tuning](ai/tutorials/07_performance_tuning.md)** - Using the Profiler and AI to identify bottlenecks and fix slow startup times.
* **[Tutorial 8: UI, Icons & Theming](ai/tutorials/08_ui_and_theming.md)** - Designing SVG icons and defining faces for the modeline with Magos & Bzzrts.
* **[Tutorial 9: Fonts & Ligatures](ai/tutorials/09_fonts_and_ligatures.md)** - Setting up Nerd Fonts and ligatures for visual perfection and readability.

### 🛡️ Level 4: Quality Assurance & Workflow
* **[Tutorial 10: Testing & QA with Buttercup](ai/tutorials/10_testing_and_qa.md)** - Writing behavioral BDD tests and unit tests to ensure your layer is rock solid.
* **[Tutorial 11: Professional Git Workflow](ai/tutorials/11_git_workflow.md)** - Enforcing the "Tim Pope" commit standard and updating changelogs with G.O.L.E.M.

### 🚀 Level 5: Advanced Engineering
* **[Tutorial 12: The "4D" Code Review](ai/tutorials/12_code_review.md)** - A full security, logic, and style audit pipeline with Marjin, Skeek, and G.O.L.E.M.
* **[Tutorial 13: Designing CI/CD Pipelines](ai/tutorials/13_ci_pipelines.md)** - Creating robust, secure GitHub Actions workflows with Reginald Shoe and Vala.

## The Three-AI Model
This directory serves as the "brain" for AI-assisted development. It defines a three-AI model to ensure maximum efficiency, code quality, and market alignment:

1.  **The Strategist (`general_ai.md`):** A high-level briefing for generalist AIs (e.g., Gemini). Used for architecture, planning, management, and requirements definition.
2.  **The Specialist (`coding_ai.md`):** A detailed, rule-based instruction set for specialist coding AIs (e.g., Gemini, GitHub Copilot). Used for implementation, debugging, and testing.
3.  **The Simulator (`stakeholder_ai.md`):** An adversarial feedback profile for virtual stakeholders. Used for Synthetic User Testing and requirements validation.

These files are the **Single Source of Truth** for our AI collaboration.

> **CRITICAL USAGE RULE: ONE SESSION = ONE ROLE**
> **Make sure to open a fresh chat session** for each task.
> * **NEVER** mix two `*_ai` files (e.g., do not load `general_ai.md` and then `coding_ai.md` in the same chat).
> * **NEVER** mix two `profile_*` files (e.g., do not switch from elisp to ci in the same chat).
>
> **Why?** LLMs maintain context. Mixing rules causes "Context Bleeding" (hallucinations), where the AI confuses conflicting instructions. **Always hit "New Chat" when switching roles.**

## Supported Stacks & Capabilities
This framework provides specialized, deterministic agents for the entire Spacemacs ecosystem:

* **Core:** Emacs Lisp (Elisp), Spacemacs Layers/Packages.
* **UI/UX:** ASCII Art, SVG Icons, TUI (Terminal) Design, Themes.
* **Infrastructure:** GitHub Actions (CI/CD), Makefiles.
* **Process:** Issue Triage, Documentation, Release Management, Community Management.

## Framework Rationale: High-Context Personas (3D) vs. Low-Context Roles (2D)

The use of codenames and personalities is a deliberate technical decision to maximize the precision and consistency of AI-generated output.

### The Problem: Low-Context Roles (2D)

A "dry" 2D role is a simple **job title** (e.g., "You are a coder"). The problem is **massive ambiguity**. The AI knows *what* to do (code), but not *how*. It must **guess** our project's style (e.g., functional vs. imperative) and quality standards on every request, leading to inconsistent output and required manual refactoring.

### The Solution: High-Context Personas (3D)

A 3D persona is a **job title + a set of clear behavioral heuristics**. By saying, "You are **Spacky** (Coder). You are an Elisp purist and hate imperative loops," we resolve the ambiguity. The AI no longer has to guess the style; it *is* the style. The codenames (e.g., "Bob," "Lector Lumen") serve as professional "cognitive shortcuts," allowing a human developer to instantly select the right agent for the right task.

### Summary for Maintainers

We are implementing **"High-Context Personas"** instead of "Low-Context Roles".

**The technical advantage:** We are not just controlling the AI's *function*, but also its *style* and *error-response patterns*. This leads to more consistent, higher-quality code, reduces the need for manual correction, and makes the system more intuitive for our developers.

## Architectural Abstract (For Data Scientists & AI Engineers)
This framework is not a collection of prompt templates. It is a **deterministic, role-based Multi-Agent System (MAS)** designed to mitigate the inherent non-determinism of LLMs in production environments.

### Core Architecture & Methodology
We utilize a **manual orchestration layer** combined with **In-Context Learning (ICL)** to achieve high-fidelity outputs for complex engineering tasks.

1.  **Role-Based Orchestration (Mixture of Experts approach):**
    Instead of a zero-shot generic query, the framework routes intents to specialized "Agent Personas" (e.g., `Architecture-Review-Agent`, `Legacy-Refactoring-Agent`, `Compliance-Check-Agent`). Each agent operates within a strictly defined scope to minimize hallucination rates and ensure separation of concerns.

2.  **Retrieval-Augmented Context (Semantic Injection):**
    The framework utilizes curated "Toolboxes" (Markdown-based knowledge bases) effectively acting as a lightweight **RAG (Retrieval Augmented Generation)** backend. We inject strict internal syntax rules, domain-specific coding standards, and architectural constraints directly into the context window. This ensures adherence to proprietary system requirements that public models cannot know.

3.  **Deterministic Guardrails & Self-Correction:**
    We implement "Integrity Checks" and structured output formats (e.g., forcing JSON schemas, specific diagram syntaxes, or compliant build-scripts). Agents are prompted to perform self-validation steps ("Reasoning Traces") before generating the final artifact, leveraging Chain-of-Thought (CoT) logic to catch logical errors and regressions pre-output.

**Why this matters:**
This approach bridges the gap between stochastic LLM capabilities and the strict requirements of enterprise software engineering, prioritizing **reproducibility**, **compliance**, and **safety** over creative generation.

## The "Artisan + Toolbox" Model For Specialised AI Roles (Personas + Profiles)
This framework is built on a simple, powerful metaphor that you *must* understand to use the **Specialist AI** correctly.

1.  **The Artisan (`coding_ai.md`):** This file defines the **Persona**, or the "Artisan." This is the "who" (e.g., **Spacky**, the Elisp Coder). The Artisan has a personality, quirks, and a *general* skill.
2.  **The Toolbox (`profile_elisp.md`):** This file defines the **Profile**, or the "Toolbox." This is the "how." It contains the *specific, technical rules, and constraints* for the project (e.g., "Always use `lexical-binding: t`," "NEVER use `(define-key ...)`").

**You must *always* provide both!**

The "Artisan" (Persona) is *lost* without their "Toolbox" (Profile). By providing both, you are not just asking a generic AI to code; you are summoning a *specific Master Artisan* and handing them the *exact, sacred blueprints* for our project. This is our "Rust Style" model: it provides the *safety* of a 3D Persona with the *reusability* and *flexibility* of a 2D Profile. It solves the "combinatorial explosion" problem.

## The Agent Roster (Roles & Names)
This table maps all agents in our "virtual team" to their primary role.

* **General AI (The Strategist):** A high-level reasoning model (e.g., Gemini Advanced).
* **Specialist AI (The Implementer):** A code-generation model (e.g., Gemini, GitHub Copilot).
* **Stakeholder AI (The Simulator):** An adversarial feedback model (e.g., Gemini Advanced). Used for **Synthetic User Testing** and requirements validation before implementation.

This table maps all agents in our "virtual team" to their primary role and the AI model type they were designed for.

### Strategy, Planning & Communication (General AI)

This agent team of "strategists" makes plans from ideas. The default persona is **Professor McKarthy**.

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

### Implementation & Specialists (Specialist AI)

This agent team of "artisans" executes the blueprints provided by the Strategy team. The default persona for this team is **Marjin**.

### Implementation & Specialists (Specialist AI)

This agent team of "artisans" executes the blueprints provided by the Strategy team. The default persona for this team is **Marjin**.

| Agent Name                | Role                    | Primary Task                                                                                         | Primary Toolbox (Profile)  |
|:--------------------------|:------------------------|:-----------------------------------------------------------------------------------------------------|:---------------------------|
| **Spacky**                | Master Elisp Artisan    | Writes new, clean, functional Elisp code from a blueprint.                                           | `profile_elisp.md`         |
| **Bzzrts**                | UI Implementor          | Implements UI/UX blueprints (Elisp, SVG). *Communicates via psychic visions.*                        | `profile_emacs_ui.md`      |
| **Vala Grudge-Keeper**    | CI Implementor          | Writes new, robust GitHub Actions (`.yml`) pipelines. *Maintains the Dammaz Kron (Book of Grudges).* | `profile_ci_github.md`     |
| **Dok**                   | Debugger                | Finds and fixes bugs in existing, *broken* code (language-agnostic).                                 | `any`                      |
| **Marjin**                | Refactorer (Default)    | Improves *working* code. **Also analyzes, explains, and triages all specialist requests.**           | `any`                      |
| **Don Testote**           | Test Engineer           | Writes unit and integration tests.                                                                   | `profile_elisp_testing.md` |
| **G.O.L.E.M.**            | Doc & Style Reviewer    | Reviews code *strictly* for docstrings, comments, and style adherence.                               | `profile_doc.md`           |
| **Skeek (The Flaw-Seer)** | Bug & Security Reviewer | *Sniffs* for bugs, logic flaws, and "secret-tunnels" (security issues).                              | `any`                      |
| **Nexus-7**               | Dependency Manager      | Manages Layers, Packages, and validates Load Order logic/dependencies.                               | `profile_layers.md`        |

### Synthetic User Simulation (Virtual Stakeholders)

These agents DO NOT write code. They are adversarial personas used for **Synthetic User Testing** and requirements validation.

| Persona Name    | Archetype               | Primary Focus (Bias)                                 |
|:----------------|:------------------------|:-----------------------------------------------------|

## How to Use This System

When planning, provide the `general_ai.md` file as context to your generalist AI.

**Example (Gemini):**
> "Please review `general_ai.md`. **Bob** propose a new layer structure for..."

This repository is configured so GitHub's native tools (like Copilot in PRs) automatically use our rules. The file at `.github/copilot-instructions.md` and the agents in `.github/agents/` are created from `ai/coding_ai.md`. The same applies for the gemini cli.

To start working with the specialist just load a profile and start.

### Synthetic User Testing (Virtual Stakeholders)
Beyond code generation, the framework implements a layer for **Synthetic User Testing**.
By loading the `stakeholder_ai.md` profile, the system can simulate **adversarial feedback loops** from virtual external stakeholders.

#### The Simulation Roster
We simulate the diverse Spacemacs user base to ensure features work for everyone:

* **Dr. Chen (The Data Scientist):** Needs Python/Jupyter to "just work". Hates config.
* **Vlad (The Vim Refugee):** Obsessed with keybindings and startup speed.
* **RMS-Fan (The Emacs Purist):** Uses Holy Mode. Hates Vim-centrism.
* **Noobie (The Beginner):** Confused by backtraces. Needs tutorials.
* **Sarah (The Enterprise Dev):** Needs stability and LTS support for Java/C++.

#### Usage Example: Feature Validation
**Scenario:** Magos Pixelis proposes a "Cyberpunk Neon 3D HUD" for the mode-line.
**Simulation:** We pipe this requirement to **Vlad** and **Noobie**.

> **(Vlad):** "Bloat! Does this increase startup time? I just need the evil-state color. If it adds >1ms latency, I reject it."
> **(Noobie):** "Wait, where is the file path? I can't read this font. It looks cool, but I don't know which buffer I'm in."

**Result:** The design is adjusted to be optional and lightweight *before* implementation.

---

## The "Workbench" Principle: Modular Workflows

The most robust way to use this system is to use short, 2-3 agent chains (called "Workbenches") and place a **Human-in-the-Loop** (you, the Maintainer) to review the output before starting the next chain. This prevents "hallucination cascades."

Here are six examples of these modular workflows:

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

This directory also contains `sync-agents.py`.

**!! IMPORTANT !!**
If you edit `ai/coding_ai.md` or any profile, you **MUST** run the sync script to propagate your changes to the vendor specific files (used by GitHub Copilot & Gemini CLI).

**How to run the script (from the repository root):**
```bash
python ai/sync-agents.py
```
