(require 'rubocop)
(require 'rspec-mode)

;; Do not insert encodinf in ruby files
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'rubocop-mode)

(provide 'init-ruby-mode)
