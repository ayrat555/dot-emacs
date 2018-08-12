(use-package alchemist)

(use-package flycheck-credo
  :requires flycheck
  :config
  (flycheck-credo-setup))

(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(provide 'init-elixir-mode)
