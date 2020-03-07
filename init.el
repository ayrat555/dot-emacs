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

;; interface customizations
(setq menu-bar-mode nil)
(scroll-bar-mode -1)
(setq tool-bar-mode nil)
(global-linum-mode 1)
(set-face-attribute 'linum nil :height 100)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package disable-mouse
  :delight
  :config
  (global-disable-mouse-mode))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Garbage autosave and backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/saves" t)))

;; http://company-mode.github.io/
(use-package company
  :config
  (global-company-mode)
  (setq company-tooltip-align-annotations t))

;; https://github.com/Malabarba/beacon
(use-package beacon
  :config
  (beacon-mode 1))

(use-package define-word
  :config
  (global-set-key (kbd "C-c e q") 'define-word-at-point))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package sudo-edit)

;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package toml-mode)
(require 'init-org-mode)
(require 'init-ivy)
(require 'init-rust-mode)
(require 'init-elixir-mode)
(require 'init-ruby-mode)
(require 'init-themes)
(require 'init-ace-window)
(require 'init-neotree)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("89f545ddc104836b27167696db89b371f23893d5b2f038d43383d877ee678d3d" default)))
 '(package-selected-packages
   (quote
    (shx web-mode org-sticky-header-mode ample-theme toml-mode define-word challenger-deep-theme nov smart-mode-line-atom-one-dark-theme exec-path-from-shell markdown-mode flycheck-ledger ledger-mode multi-term pomidor magit neotree ace-window smart-mode-line dracula-theme creamsody-theme kaolin-themes rspec-mode rubocop enh-ruby-mode flycheck-credo alchemist racer rust-mode counsel org-projectile org-journal org-bullets flycheck multiple-cursors sudo-edit yaml-mode beacon company disable-mouse use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
