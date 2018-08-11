;;; init.el --- Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

(require 'package)

;;; Code:

;;; (setq debug-on-error t)
(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
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

(use-package disable-mouse
  :delight
  :config
  (global-disable-mouse-mode))

(package-initialize)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)

;; Garbage autosave and backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/saves" t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("094989d1072a9d76e22528308c19217172bf3568f081f111505cd4de1c101a8a" "a56a6bf2ecb2ce4fa79ba636d0a5cf81ad9320a988ec4e55441a16d66b0c10e0" default)))
 '(package-selected-packages
   (quote
    (eyebrowse symon sudo-edit kaolin-themes helm-ag helm flycheck-credo org yaml-mode transmission beacon seethru flycheck racer ## slim-mode solidity-mode markdown-preview-mode zenburn-theme))))

(eyebrowse-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; http://company-mode.github.io/
(use-package company
  :config
  (global-company-mode))

;; https://github.com/Malabarba/beacon
(use-package beacon
  :config
  (beacon-mode 1))

;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(add-hook 'after-init-hook #'global-flycheck-mode)


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
