(use-package rust-mode
  :config
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq rust-indent-offset 8))

(use-package racer
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook #'racer-mode))

(provide 'init-rust-mode)
