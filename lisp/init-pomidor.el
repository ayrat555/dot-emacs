(use-package pomidor
  :bind (("<f12>" . pomidor))
  :config (setq pomidor-sound-tick nil
                pomidor-sound-tack nil)
  :hook (pomidor-mode . (lambda ()
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          ;; force fringe update
                          (set-window-buffer nil (current-buffer)))))

(provide 'init-pomidor)
