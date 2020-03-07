(use-package rust-mode
  :config
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq rust-format-on-save t)
  (setq rust-indent-offset 4))

(use-package cargo
  :requires rust-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :requires rust-mode

  :init (setq racer-rust-src-path
              (concat (string-trim
                       (shell-command-to-string "rustc --print sysroot"))
                      "/lib/rustlib/src/rust/src"))
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook #'racer-mode))


(provide 'init-rust-mode)
