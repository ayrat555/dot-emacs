;; (use-package alchemist
;;   :config
;;   (setq alchemist-key-command-prefix (kbd "C-c a")))

(use-package flycheck-credo
  :requires flycheck
  :config
  (flycheck-credo-setup))

(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-hook 'elixir-format-hook (lambda ()
                                  (if (projectile-project-p)
                                      (setq elixir-format-arguments
                                            (list "--dot-formatter"
                                                  (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                    (setq elixir-format-arguments nil)))))
(use-package mix
  :config
  (add-hook 'elixir-mode-hook 'mix-minor-mode))

(load-file (expand-file-name "custom/company-elixir/company-elixir.el" user-emacs-directory))
(add-hook 'elixir-mode-hook 'company-elixir-hook)

(provide 'init-elixir-mode)
