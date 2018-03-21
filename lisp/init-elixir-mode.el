(require 'elixir-mode)
(require 'alchemist)

(eval-after-load 'flycheck
  '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

(provide 'init-elixir-mode)
