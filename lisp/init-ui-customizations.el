;; interface customizations
(setq menu-bar-mode nil)
(scroll-bar-mode -1)
(setq tool-bar-mode nil)
(global-linum-mode 1)
(setq linum-format "%d ")
(set-face-attribute 'linum nil :height 140)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq compilation-scroll-output t)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil
                    :family "Hack" :height 135 :weight 'normal)

(use-package disable-mouse
  :delight
  :config
  (global-disable-mouse-mode))

;; https://github.com/Malabarba/beacon
(use-package beacon
  :config
  (beacon-mode 1))

(provide 'init-ui-customizations)
