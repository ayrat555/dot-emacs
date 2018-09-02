(use-package counsel
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key "\C-s" 'swiper)
  (setq projectile-completion-system 'ivy))

(provide 'init-ivy)
