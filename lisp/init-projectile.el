(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm
  :requires projectile)

(use-package helm-projectile
  :requires (helm projectile)
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(provide 'init-projectile)
