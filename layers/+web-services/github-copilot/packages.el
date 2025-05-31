;;; packages.el --- Large GitHub Copilot Client for Spacemacs  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: Codruț Constantin Gușoi <mail+spacemacs@codrut.pro>
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


(defconst github-copilot-packages
  '((copilot)
    (copilot-chat)))

(defun github-copilot/init-copilot ()
  "Initialize the `copilot' package and set up keybindings."
  (use-package copilot
    :hook (prog-mode . copilot-mode)
    :custom
    (copilot-enable-predicates '(spacemacs//copilot-enable-predicate
                                 copilot--buffer-changed))
    :defer t
    :config
    (define-key copilot-completion-map (kbd "C-M-<tab>") 'spacemacs/github-copilot-next-completion)
    (define-key copilot-completion-map (kbd "C-M-<iso-lefttab>") 'spacemacs/github-copilot-previous-completion)
    (define-key copilot-completion-map (kbd "C-M-<return>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-M-S-<return>") 'copilot-accept-completion-by-word)))

(defun github-copilot/init-copilot-chat ()
  "Initialize the `copilot-chat' package and set up keybindings."
  (use-package copilot-chat
    :defer t
    :init
    ;; Provide our transient state in the AI menu
    (spacemacs/declare-prefix "$" "AI")
    (spacemacs/set-leader-keys "$c" 'copilot-chat-transient)
    (when github-copilot-enable-commit-messages
      (add-hook 'git-commit-setup-hook
                #'copilot-chat-insert-commit-message))
    :config
    ;; Make sure that standard ,, works as confirm in the chat window
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",," #'copilot-chat-prompt-send)
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",a" #'copilot-chat-kill-instance)
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",k" #'copilot-chat-kill-instance)

    ;; And don't forget to provide an alternative for holy mode users
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-c") #'copilot-chat-prompt-send)
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-a") #'copilot-chat-kill-instance)
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-k") #'copilot-chat-kill-instance)))
