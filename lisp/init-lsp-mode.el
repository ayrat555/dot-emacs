(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :init  (setq lsp-rust-server 'rust-analyzer)
         (add-to-list 'exec-path "~/.emacs.d/elixir-ls-1.11")
  :hook (
         (rust-mode . lsp)
         (elixir-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package which-key
    :config
    (which-key-mode))

(provide 'init-lsp-mode)
