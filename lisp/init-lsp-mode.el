(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :init  (setq lsp-rust-server 'rust-analyzer)
  :hook (
         (rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode
  :bind (("C-c z" . lsp-ui-doc-focus-frame)))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol
  :bind (("C-c s" . lsp-ivy-workspace-symbol)))

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package which-key
    :config
    (which-key-mode))

(provide 'init-lsp-mode)
