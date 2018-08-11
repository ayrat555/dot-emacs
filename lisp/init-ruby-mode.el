(use-package enh-ruby-mode
  :mode "\\.rb$"
  :interpreter "ruby"
  :config
  (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
  (setq enh-ruby-deep-indent-paren nil)
  ;; Do not insert encoding in ruby files
  (setq ruby-insert-encoding-magic-comment nil) ;; for ruby mode (just in case)
  (setq enh-ruby-add-encoding-comment-on-save nil)) ;; for enh ruby mode)

(use-package rubocop
  :after enh-ruby-mode
  :hook enh-ruby-mode)

(use-package rspec-mode
    :after enh-ruby-mode)

(provide 'init-ruby-mode)
