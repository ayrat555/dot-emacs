(use-package counsel
  :init (ivy-mode 1)
  :config
  (setq ivy-height 10)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key "\C-s" 'swiper)
  (setq projectile-completion-system 'ivy)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c e e") 'counsel-rg)
  (global-set-key (kbd "C-c e n") 'counsel-fzf))

(provide 'init-ivy)
