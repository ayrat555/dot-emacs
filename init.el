(require 'package)
(package-initialize)
(add-to-list 'package-archives
             ;; '("melpa" . "http://melpa.milkbox.net/packages/") t)
             ;;'("melpa-stable" . "http://stable.melpa.org/packages/") t)
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Elixir setup

(require 'elixir-mode)
(require 'alchemist)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (flycheck racer  ## slim-mode solidity-mode multiple-cursors org-journal neotree markdown-preview-mode projectile zenburn-theme)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Company setup
;; http://company-mode.github.io/

(require 'company)
(global-company-mode 1)

(projectile-mode 1)

;; Garbage emacs autosave files
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves" t)))

;; Multiple cursors setup
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(add-hook 'after-init-hook #'global-flycheck-mode)


(require 'init-org-mode)
(require 'init-rust-mode)
(require 'init-elixir-mode)
(require 'init-ruby-mode)
(require 'init-themes)