(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(use-package go-mode
  :mode "\\.go$"
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports))
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-hook 'go-mode-hook
            (lambda () (add-hook 'before-save-hook #'gofmt-before-save))))

(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(provide 'init-golang)
