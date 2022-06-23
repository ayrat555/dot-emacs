(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Garbage autosave and backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/saves" t)))

(use-package package-lint)

;; http://company-mode.github.io/
(use-package company
  :config
  (global-company-mode)
  (setq company-tooltip-align-annotations t))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy)
  (dumb-jump-mode))


(defun truncate-compilation-mode-hook ()
  (setq truncate-lines nil)
  (set (make-local-variable 'truncate-partial-width-windows) nil))
(add-hook 'compilation-mode-hook 'truncate-compilation-mode-hook)


(use-package define-word
  :config
  (global-set-key (kbd "C-c e q") 'define-word-at-point))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; see additional packages that need to be installed
;; https://github.com/akermu/emacs-libvterm
(use-package vterm
  :ensure t
  :init
  (setq vterm-always-compile-module t))

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
  (global-set-key (kbd "C-q") 'mc/edit-lines))

;; Shared clipboard between terminal emacs and x11. xclip should be installed
(use-package xclip
  :config
  (xclip-mode 1))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package toml-mode)

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package terraform-mode)

(use-package speed-type)

(use-package focus)

;; better undo
(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;; Visualize the undo tree.
(use-package vundo
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

(provide 'init-common)
