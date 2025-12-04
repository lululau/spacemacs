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
;; GNU General Public License for all details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defconst github-copilot-packages
  '(copilot       ;; For inline code completion
    copilot-chat  ;; The "Cathedral" (Chat UI)
    magit         ;; For G.O.L.E.M. commit messages
    mcp))         ;; The "ToolShed" (mcp-hub & foundation)

(defun github-copilot/init-copilot ()
  "Initialize the `copilot' package (inline suggestions)."
  (use-package copilot
    :hook (prog-mode . copilot-mode)
    :defer t
    :custom
    (copilot-enable-predicates '(spacemacs//copilot-enable-predicate
                                 copilot--buffer-changed))
    :config
    (define-key copilot-completion-map (kbd "C-M-<tab>") 'spacemacs/github-copilot-next-completion)
    (define-key copilot-completion-map (kbd "C-M-<iso-lefttab>") 'spacemacs/github-copilot-previous-completion)
    (define-key copilot-completion-map (kbd "C-M-<return>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-M-S-<return>") 'copilot-accept-completion-by-word)))

(defun github-copilot/init-copilot-chat ()
  "Initialize the `copilot-chat' package (The Cathedral).
This is the main chat UI which will *manage* mcp tools."
  (use-package copilot-chat
    :defer t
    :after mcp
    :init
    ;; Provide our transient state in the AI menu
    (spacemacs/declare-prefix "$" "AI")
    (spacemacs/set-leader-keys "$c" 'copilot-chat-transient)

    ;; Setup Magit integration (Commit Messages)
    (when github-copilot-enable-commit-messages
      (add-hook 'git-commit-setup-hook
                (if (eq github-copilot-enable-commit-messages 'golem)
                    #'github-copilot/insert-golem-commit-message
                  #'copilot-chat-insert-commit-message)))

    :config
    (setq copilot-chat-mcp-servers (mapcar #'car github-copilot-mcp-servers))

    ;; Keybindings for the chat prompt
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",," #'copilot-chat-prompt-send)
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",a" #'copilot-chat-kill-instance)
    (evil-define-key 'normal copilot-chat-prompt-mode-map ",k" #'copilot-chat-kill-instance)
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-c") #'copilot-chat-prompt-send)
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-a") #'copilot-chat-kill-instance)
    (define-key copilot-chat-prompt-mode-map (kbd "C-c C-k") #'copilot-chat-kill-instance)))

(defun github-copilot/init-mcp ()
  "Initialize the `mcp' package (The Sacred ToolShed).
This provides the `mcp-hub' for managing external servers
and *programmatically* sets up the default tools."
  (use-package mcp
    :config
    ;; We *always* set the hub's list from our variable.
    ;; This works for *both* our defaults AND the user's custom list.
    (setq mcp-hub-servers github-copilot-mcp-servers)
    )

  (use-package mcp-hub
    :after mcp ;; The hub *must* be built AFTER the mcp foundation!
    :init
    (spacemacs/set-leader-keys "$m" 'mcp-hub)
    ))

(defun github-copilot/post-init-magit ()
  (with-eval-after-load 'magit
    ;; Native Emacs Binding (global map for magit status)
    (define-key magit-status-mode-map (kbd "C-c g") 'github-copilot/golem-commit)

    ;; Spacemacs/Evil Binding (Local Leader)
    ;; In Magit Status, this is usually bound to ",". So pressing ", g" triggers it.
    (spacemacs/set-leader-keys-for-major-mode 'magit-status-mode
      "g" 'github-copilot/golem-commit)))
