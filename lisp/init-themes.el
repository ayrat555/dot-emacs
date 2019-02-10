(use-package kaolin-themes
  :config
  (global-set-key (kbd "C-c q 1") (lambda() (interactive) (load-theme 'kaolin-galaxy t)))
  (global-set-key (kbd "C-c q 2") (lambda() (interactive) (load-theme 'kaolin-eclipse t)))
  (global-set-key (kbd "C-c q 3") (lambda() (interactive) (load-theme 'kaolin-ocean t))))

(use-package creamsody-theme
  :config
  (global-set-key (kbd "C-c q 4") (lambda() (interactive) (load-theme 'creamsody t))))

(use-package rebecca-theme
  :config
  (load-theme 'rebecca t))

(provide 'init-themes)
