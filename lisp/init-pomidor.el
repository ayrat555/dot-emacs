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
  (setq pomidor-seconds (* 15 60)) ; 15 minutes for the work period
  (setq pomidor-break-seconds (* 5 60)) ; 5 minutes break time
  (setq pomidor-breaks-before-long 4) ; wait 4 short breaks before long break
  (setq pomidor-long-break-seconds (* 20 60)) ; 20 minutes long break time
  :hook (pomidor-mode . (lambda ()
                          (display-line-numbers-mode -1) ; Emacs 26.1+
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          ;; force fringe update
                          (set-window-buffer nil (current-buffer)))))

(provide 'init-pomidor)
