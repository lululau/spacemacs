;;; core-load-paths.el --- Spacemacs Core File  -*- no-byte-compile: t; lexical-binding: t -*-
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
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

;;; Commentary:
;;
;; This file defines and initializes all important directory paths used by Spacemacs.
;; It also sets up the Emacs `load-path` and `custom-theme-load-path` so that core
;; libraries and themes are discoverable. Additionally, it ensures that persistent
;; cache directories exist for storing user-specific data.

;;; Code:

;;;; PATH variables/constants

(defconst user-home-directory
  (expand-file-name "~/")
  "User home directory (default ~/).")

;; ~/.emacs.d
;; The root directory of Spacemacs, typically ~/.emacs.d.
;; This is computed relative to the location of this file, so it works even if
;; Spacemacs is installed in a non-standard location.
(defvar spacemacs-start-directory
  (expand-file-name "../" (file-name-directory (or load-file-name buffer-file-name)))
  "Spacemacs start directory. This is the root of the Spacemacs installation.")

;; Directory for static assets such as images and icons.
(defconst spacemacs-assets-directory
  (concat spacemacs-start-directory "assets/")
  "Spacemacs assets directory. Contains images, icons, and other static files.")

;; Directory containing Spacemacs core files.
(defconst spacemacs-core-directory
  (concat spacemacs-start-directory "core/")
  "Spacemacs core directory. Contains core source files and libraries.")

;; Directory for banner images displayed on startup.
(defconst spacemacs-banner-directory
  (concat spacemacs-core-directory "banners/")
  "Spacemacs banners directory. Contains images for startup banners.")

;; Path to the official Spacemacs banner image (PNG format).
(defconst spacemacs-banner-official-png
  (concat spacemacs-banner-directory "img/spacemacs.png")
  "Spacemacs official banner image (PNG).")

;; Path to the official Spacemacs badge image (PNG format).
(defconst spacemacs-badge-official-png
  (concat spacemacs-banner-directory "img/spacemacs-badge.png")
  "Spacemacs official badge image (PNG).")

;; Path to the official GPLv3 badge image (PNG format).
(defconst spacemacs-gplv3-official-png
  (concat spacemacs-banner-directory "img/gplv3.png")
  "GPLv3 official badge image (PNG).")

;; Directory containing info files (documentation, help, etc.).
(defconst spacemacs-info-directory
  (concat spacemacs-core-directory "info/")
  "Spacemacs info files directory. Contains documentation and help files.")

;; Directory for release notes, inside the info directory.
(defconst spacemacs-release-notes-directory
  (concat spacemacs-info-directory "release-notes/")
  "Spacemacs release notes directory. Contains version release notes.")

;; Directory for general documentation.
(defconst spacemacs-docs-directory
  (concat spacemacs-start-directory "doc/")
  "Spacemacs documentation directory. Contains user and developer docs.")

;; Directory for news files (announcements, changelogs, etc.).
(defconst spacemacs-news-directory
  (concat spacemacs-start-directory "news/")
  "Spacemacs News directory. Contains news and changelog files.")

;; Directory for user private layers and configuration.
(defconst spacemacs-private-directory
  (concat user-emacs-directory "private/")
  "Spacemacs private directory. User-specific layers and configuration.")

;; Directory for test files.
(defconst spacemacs-test-directory
  (concat spacemacs-start-directory "tests/")
  "Spacemacs tests directory. Contains automated tests.")

;; Directory for persistent cache files.
;; This is based on `user-emacs-directory` so that cache is per-user, even if
;; Spacemacs is installed in a shared location.
(defconst spacemacs-cache-directory
  (concat user-emacs-directory ".cache/")
  "Spacemacs storage area for persistent files (per-user cache).")

;; Directory for auto-save files, inside the cache directory.
(defconst spacemacs-auto-save-directory
  (concat spacemacs-cache-directory "auto-save/")
  "Spacemacs auto-save directory. Stores auto-saved buffers.")


;;;; Setup cache directories

;; Ensure that the cache directory exists before it is used.
;; The 'parents argument creates any necessary parent directories.
(make-directory spacemacs-cache-directory 'parents)


;;;; Load Paths

;; Add core subdirectories to the Emacs `load-path` so that libraries can be loaded.
;; The following subdirectories are added:
;; - nil: the core directory itself
;; - "libs/": third-party libraries
;; - "libs/spacemacs-theme/": official Spacemacs theme
;; - "libs/forks/": forked libraries
(dolist (subdirectory '(nil "libs/" "libs/spacemacs-theme/" "libs/forks/"))
  (let ((path (concat spacemacs-core-directory subdirectory)))
    (if (file-exists-p path)
        (add-to-list 'load-path path)
      (error "The directory %s does not exist and cannot be added to the `load-path'." path))))

;;;; Themes

;; Add the Spacemacs theme directory to `custom-theme-load-path` so that
;; themes are discoverable by Emacs.
(add-to-list 'custom-theme-load-path (concat spacemacs-core-directory
                                             "libs/spacemacs-theme/"))

;; Provide the feature so that other files can require it.
(provide 'core-load-paths)
;;; core-load-paths.el ends here
