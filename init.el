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

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-interval 1)
  (auto-package-update-maybe))

(use-package delight)

;; interface customizations
(setq menu-bar-mode nil)
(setq scroll-bar-mode nil)
(setq tool-bar-mode nil)
(global-linum-mode 1)
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

(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent))))


(use-package eyebrowse
  :config
  (eyebrowse-mode t))

(use-package sudo-edit)

;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(require 'init-org-mode)
(require 'init-rust-mode)
(require 'init-elixir-mode)
(require 'init-ruby-mode)
(require 'init-lisp-mode)
(require 'init-themes)
(require 'init-ace-window)
(require 'init-neotree)
(require 'init-magit)
(require 'init-avy)
(require 'init-pomidor)
(require 'init-projectile)
(require 'init-multi-term)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multi-term helm-projectile helm pomidor magit neotree ace-window creamsody-theme kaolin-themes rspec-mode rubocop enh-ruby-mode flycheck-credo alchemist racer rust-mode org-projectile org-journal org-bullets flycheck multiple-cursors sudo-edit eyebrowse yaml-mode beacon company disable-mouse delight auto-package-update use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
