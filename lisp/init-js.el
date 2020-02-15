(use-package js2-mode
  :mode "\\.js\\'")

(use-package typescript-mode
  :mode  ("\\.ts\\'" "\\.tsx\\'"))

(setq css-indent-offset 2)

(use-package prettier-js
  :after js2-mode)

(provide 'init-js)
