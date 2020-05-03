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

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(setq use-package-verbose t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-common)
(require 'init-ui-customizations)
(require 'init-org-mode)
(require 'init-ivy)
(require 'init-rust-mode)
(require 'init-elixir-mode)
(require 'init-ruby-mode)
(require 'init-themes)
(require 'init-ace-window)
(require 'init-magit)
(require 'init-avy)
(require 'init-pomidor)
(require 'init-projectile)
(require 'init-ledger)
(require 'init-markdown)
(require 'init-js)
(require 'init-golang)
(require 'init-nov)
(require 'init-web-mode)
(require 'init-shx)
(require 'init-proced)
(require 'init-treemacs)
(require 'init-yasnippet)
