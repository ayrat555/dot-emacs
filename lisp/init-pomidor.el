(use-package pomidor
  :config
  (global-set-key (kbd "<f12>") #'pomidor)
  (setq pomidor-sound-tick nil
        pomidor-sound-tack nil
        pomidor-sound-overwork nil))

(provide 'init-pomidor)
