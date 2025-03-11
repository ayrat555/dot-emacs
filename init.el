;;; init.el --- Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

;;; Code:

;;; (setq debug-on-error t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq straight-use-package-by-default t)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-ui-customizations)
(require 'init-ace-window)
(require 'init-avy)
(require 'init-common)
(require 'init-elixir-mode)
(require 'init-golang)
(require 'init-ivy)
(require 'init-js)
(require 'init-ledger)
(require 'init-magit)
(require 'init-markdown)
(require 'init-nov)
(require 'init-org-mode)
(require 'init-pomidor)
(require 'init-proced)
(require 'init-projectile)
(require 'init-ruby-mode)
(require 'init-rust-mode)
(require 'init-shx)
(require 'init-themes)
(require 'init-treemacs)
(require 'init-web-mode)
(require 'init-yasnippet)
