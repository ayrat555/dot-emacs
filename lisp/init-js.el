(use-package js2-mode
  :mode "\\.js\\'")

(use-package typescript-mode
  :mode  ("\\.ts\\'" "\\.tsx\\'"))

(setq css-indent-offset 2)

(use-package prettier-js
  :config
  (setq prettier-js-args '("--arrow-parens" "avoid"))
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook #'(lambda ()
                               (enable-minor-mode
                                '(("\\.jsx?\\'" "\\.ts\\'" "\\.tsx\\'") . prettier-js-mode))))
  (add-hook 'typescript-mode-hook 'prettier-js-mode))

(provide 'init-js)
