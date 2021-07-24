;; interface customizations

;; (if (display-graphic-p)
;; )
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(scroll-bar-mode -1)
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
                    :family "Hack" :height 130 :weight 'normal)

(use-package disable-mouse
  :delight
  :config
  (global-disable-mouse-mode))

;; https://github.com/Malabarba/beacon
(use-package beacon
  :config
  (beacon-mode 1))

(use-package page-break-lines
  :config
  (global-page-break-lines-mode))

(use-package all-the-icons)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5))))

(provide 'init-ui-customizations)
