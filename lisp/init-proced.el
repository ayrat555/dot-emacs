(global-set-key (kbd "C-x p") #'proced)

(defun proced-settings ()
  (proced-toggle-auto-update t)
  (setq proced-auto-update-interval 5))

(add-hook 'proced-mode-hook 'proced-settings)

(provide 'init-proced)
