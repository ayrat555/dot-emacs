(use-package go-mode
  :mode "\\.go$"
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-hook 'go-mode-hook
            (lambda () (add-hook 'before-save-hook #'gofmt-before-save))))

(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(provide 'init-golang)
