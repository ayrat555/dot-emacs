(require 'projectile)
(require 'helm-projectile)
(require 'org-projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'init-projectile)
