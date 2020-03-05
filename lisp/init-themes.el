(use-package kaolin-themes
  :config
  (global-set-key (kbd "C-c q 1") (lambda() (interactive) (load-theme 'kaolin-galaxy t)))
  (global-set-key (kbd "C-c q 2") (lambda() (interactive) (load-theme 'kaolin-eclipse t)))
  (global-set-key (kbd "C-c q 3") (lambda() (interactive) (load-theme 'kaolin-ocean t)))
  :init (progn (load-theme 'kaolin-dark t)))

(use-package creamsody-theme
  :config
  (global-set-key (kbd "C-c q 4") (lambda() (interactive) (load-theme 'creamsody t))))

(use-package dracula-theme)

;; (use-package ample-theme
;;   :init (progn (load-theme 'ample t t)
;;                (load-theme 'ample-flat t t)
;;                (load-theme 'ample-light t t)
;;                (enable-theme 'ample-flat))
  ;; :defer t
  ;; :ensure t)


(use-package smart-mode-line-atom-one-dark-theme
  :ensure t)

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
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
