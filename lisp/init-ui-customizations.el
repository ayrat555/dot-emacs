;; interface customizations
(setq menu-bar-mode nil)
(scroll-bar-mode -1)
(setq tool-bar-mode nil)
(global-linum-mode 1)
(set-face-attribute 'linum nil :height 100)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(use-package disable-mouse
  :delight
  :config
  (global-disable-mouse-mode))

;; https://github.com/Malabarba/beacon
(use-package beacon
  :config
  (beacon-mode 1))

(provide 'init-ui-customizations)
