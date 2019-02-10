(use-package alchemist)

(use-package flycheck-credo
  :requires flycheck
  :config
  (flycheck-credo-setup))

(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (remove-hook 'elixir-mode-hook
            (lambda () (remove-hook 'before-save-hook 'elixir-format))))

(provide 'init-elixir-mode)
