(require 'rubocop)
(require 'rspec-mode)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-hook 'enh-ruby-mode #'rubocop-mode)
;; don't deep indent arrays and hashes
(setq enh-ruby-deep-indent-paren nil)

(provide 'init-ruby-mode)
