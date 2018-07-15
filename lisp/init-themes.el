(require 'powerline)
(require 'planet-theme)
(powerline-default-theme)

(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
;; (moe-dark)
(load-theme 'planet t)

;; Startup window setup
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; line numbers
(global-linum-mode 1)

(provide 'init-themes)
