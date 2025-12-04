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

(defun github-copilot/golem-commit ()
  "Ask G.O.L.E.M. to write the commit message based on the staged diff.
Requires `copilot-chat' to be installed and active."
  (interactive)
  (let ((diff (shell-command-to-string "git diff --cached")))
    (if (string-empty-p diff)
        (message "G.O.L.E.M.: *Grind*... Nothing to commit. Diff is empty.")
      (copilot-chat-ask
       (format "As @golem, write a strict commit message for this diff adhering to the Tim Pope standard defined in @ai/profile_doc.md:\n\n%s" diff)
       "G.O.L.E.M. Commit"))))

(defun github-copilot/insert-golem-commit-message ()
  "Insert a G.O.L.E.M. style commit message into the buffer (for Hooks).
This works by temporarily overriding the system prompt of `copilot-chat-insert-commit-message'."
  (interactive)
  (let ((copilot-chat-prompt-commit-message
         "As @golem, write a strict commit message for the diff adhering to the Tim Pope standard defined in @ai/profile_doc.md. Only output the message content, no conversational filler."))
    (copilot-chat-insert-commit-message)))
