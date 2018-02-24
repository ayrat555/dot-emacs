(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
             ;; '("melpa-stable" . "http://stable.melpa.org/packages/") t)
             ;; '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (transmission beacon seethru disable-mouse flycheck racer ## slim-mode solidity-mode multiple-cursors org-journal markdown-preview-mode projectile zenburn-theme)))
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

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

(require 'init-org-mode)
(require 'init-rust-mode)
(require 'init-elixir-mode)
(require 'init-ruby-mode)
(require 'init-themes)
(require 'init-ace-window)
(require 'init-neotree)
(require 'init-magit)
(require 'init-avy)
(require 'init-pomidor)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
