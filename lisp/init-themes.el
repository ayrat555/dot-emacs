(use-package kaolin-themes
  :config
  (global-set-key (kbd "C-c q 1") (lambda() (interactive) (load-theme 'kaolin-galaxy t)))
  (global-set-key (kbd "C-c q 2") (lambda() (interactive) (load-theme 'kaolin-eclipse t)))
  (global-set-key (kbd "C-c q 3") (lambda() (interactive) (load-theme 'kaolin-ocean t))))

(use-package creamsody-theme
  :config
  (global-set-key (kbd "C-c q 4") (lambda() (interactive) (load-theme 'creamsody t))))

(use-package doom-themes)

(use-package gruvbox-theme)

(use-package dracula-theme)

(use-package sublime-themes)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (load-theme 'doom-city-lights t)))
    (load-theme 'doom-city-lights t))

(use-package smart-mode-line-atom-one-dark-theme
  :ensure t)

;; (use-package smart-mode-line
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'respectful)
;;   (sml/setup))

(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist
      (format "^ \\(%s\\)$"
              (mapconcat #'identity
                         '("Fly.*" "Projectile.*" "NoMouse.*" "ivy.*" "company.*" "ARev.*" "Org-roam.*")
                         "\\|"))))
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'init-themes)
