(use-package pomidor
  :bind (("<f12>" . pomidor))
  :config
  (if (string-equal system-type "darwin")
      (setq pomidor-play-sound-file
            (lambda (file)
              (start-process "my-pomidor-play-sound"
                             nil
                             "afplay"
                             file))))
  (setq pomidor-sound-tick nil
                pomidor-sound-tack nil)
  :hook (pomidor-mode . (lambda ()
                          (display-line-numbers-mode -1) ; Emacs 26.1+
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          ;; force fringe update
                          (set-window-buffer nil (current-buffer)))))

(provide 'init-pomidor)
