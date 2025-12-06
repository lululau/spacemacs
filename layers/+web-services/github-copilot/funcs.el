;;; funcs.el --- GitHub Copilot Layer functions file for Spacemacs -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2024-2025 Sylvain Benner & Contributors
;;
;; Author: Ferdinand Nussbaum <ferdinand.nussbaum@inf.ethz.ch>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defun spacemacs//copilot-enable-predicate ()
  "Copilot is by default only enabled in `evil-insert-state', not in `evil-emacs-state',
see the default value of `copilot-enable-predicates'.
In `holy-mode', we enable `evil-emacs-state' permanently, hence this workaround."
  (or (not (bound-and-true-p evil-local-mode))
      (bound-and-true-p holy-mode)
      (evil-insert-state-p)))

(defun spacemacs/github-copilot-next-completion ()
  "Move to the next completion in the Copilot completion menu.
This function will make sure to show the next completion,
if necessary triggering a `copilot-complete' command beforehand."
  (interactive)
  (copilot-complete)
  (copilot-next-completion))

(defun spacemacs/github-copilot-previous-completion ()
  "Move to the previous completion in the Copilot completion menu.
This function will make sure to show the previous completion,
if necessary triggering a `copilot-complete' command beforehand."
  (interactive)
  (copilot-complete)
  (copilot-previous-completion))

(defun github-copilot/insert-golem-commit-message ()
  "Insert a G.O.L.E.M. style commit message into the buffer (for Hooks).
This function sets the system prompt variable `copilot-chat-commit-prompt` buffer-locally.
We use `setq-local` because the downstream function uses a timer, so a simple `let` binding would expire."
  (interactive)
  (defvar copilot-chat-commit-prompt)

  ;; HARDENED G.O.L.E.M. PROMPT (V2)
  ;; Changes:
  ;; 1. Added NEGATIVE CONSTRAINTS (Output Contract) to prevent hallucinations.
  ;; 2. Enforced BULLET POINTS for the body for readability.
  ;; 3. Explicitly explicitly referenced the style guide.
  (setq-local copilot-chat-commit-prompt
              "You are G.O.L.E.M. (Guardian Of Legacy Elisp Manifestations).
TASK: Write a git commit message for the provided diff.

/// OUTPUT CONTRACT (CRITICAL) ///
- DO NOT output conversational text (e.g. 'Here is the message').
- DO NOT use markdown code blocks (```).
- Output ONLY the raw commit message text.
- If the diff is empty/trivial, output: 'ABORT: No significant changes.'

/// FORMAT RULES ///
1. Subject Line:
   - Limit to 50 characters (72 max).
   - IMPERATIVE mood ('Fix bug', not 'Fixed bug').
   - NO trailing period.
2. Body:
   - Must use BULLET POINTS (-) for each change.
   - Wrap lines strictly at 72 chars.
   - Explain 'Why' and 'What', not just 'How'.
   - Style: Strict adherence to 'Tim Pope' standard defined in @ai/profile_doc.md.

Diff to analyze:")

  (copilot-chat-insert-commit-message))
