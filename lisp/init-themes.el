(use-package kaolin-themes
  :config
  (global-set-key (kbd "C-c q 1") (lambda() (interactive) (load-theme 'kaolin-galaxy t)))
  (global-set-key (kbd "C-c q 2") (lambda() (interactive) (load-theme 'kaolin-eclipse t)))
  (global-set-key (kbd "C-c q 3") (lambda() (interactive) (load-theme 'kaolin-ocean t)))
  :init (progn (load-theme 'kaolin-ocean t)))

(use-package creamsody-theme
  :config
  (global-set-key (kbd "C-c q 4") (lambda() (interactive) (load-theme 'creamsody t))))

(use-package dracula-theme)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (load-theme 'kaolin-ocean t)))
    (load-theme 'kaolin-ocean t))


(use-package smart-mode-line-atom-one-dark-theme
  :ensure t)

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup))

(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist
      (format "^ \\(%s\\)$"
              (mapconcat #'identity
                         '("Fly.*" "Projectile.*" "NoMouse.*" "ivy.*" "company.*" "ARev.*")
                         "\\|"))))

(provide 'init-themes)
