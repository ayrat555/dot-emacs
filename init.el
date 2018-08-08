;;; init.el --- Initialization file for Emacs

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

(require 'package)

;;; Code:

(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
             ;; '("melpa-stable" . "http://stable.melpa.org/packages/") t)
             ;; '("melpa" . "http://melpa.org/packages/") t)

(setq debug-on-error t)
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("094989d1072a9d76e22528308c19217172bf3568f081f111505cd4de1c101a8a" "a56a6bf2ecb2ce4fa79ba636d0a5cf81ad9320a988ec4e55441a16d66b0c10e0" default)))
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("/home/ayrat/Dropbox/org/habits.org" "/home/ayrat/Dropbox/org/ideas.org" "/home/ayrat/Dropbox/org/learn.org" "/home/ayrat/Dropbox/org/todo.org" "/home/ayrat/Dropbox/org/work.org")))
 '(package-selected-packages
   (quote
    (symon sudo-edit kaolin-themes helm-ag helm flycheck-credo org yaml-mode transmission beacon seethru disable-mouse flycheck racer ## slim-mode solidity-mode multiple-cursors markdown-preview-mode zenburn-theme)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Company setup
;; http://company-mode.github.io/

(require 'company)
(global-company-mode 1)

;; Garbage emacs autosave files
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/saves" t)))

;; disable mouse
;; https://github.com/purcell/disable-mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

;; https://github.com/Malabarba/beacon
(beacon-mode 1)

;; Multiple cursors setup
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

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

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(provide 'init)

;;; init.el ends here
