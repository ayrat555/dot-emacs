(use-package vterm
  :ensure t)

  (defun starts-with-p (line prompt)
    "Check if LINE starts with PROMPT"
    (string= (substring line 0 (length prompt)) prompt)
    )

  (defun is-a-prompt-p (line)
    "Check if the LINE is the input line of some interactive process."
    (or
     (starts-with-p line "$")
     (starts-with-p line "gnuplot>")
     (starts-with-p line ">>>")
     )
    )

  (defun send-command-input (command &optional args)
    "Check if the point is in the input line, if it is, send the
     command with vterm. This works only if the first characters
     of the line are in the database of is-a-prompt-p."
    (if (is-a-prompt-p (thing-at-point 'line))
        (vterm--self-insert)            ; Prompt line
      (funcall command args)
      )
    )

  (define-key vterm-mode-map (kbd "C-f") '(lambda () (interactive) (send-command-input 'forward-char)))
  (define-key vterm-mode-map (kbd "C-b") '(lambda () (interactive) (send-command-input 'backward-char)))
  (define-key vterm-mode-map (kbd "C-n") nil)
  (define-key vterm-mode-map (kbd "C-p") nil)
  (define-key vterm-mode-map (kbd "C-y") 'vterm-yank)
  (define-key vterm-mode-map (kbd "<mouse-2>") 'vterm-yank)
  (define-key vterm-mode-map (kbd "C-s") '(lambda () (interactive) (send-command-input 'counsel-grep-or-swiper)))
  (define-key vterm-mode-map (kbd "C-r") '(lambda () (interactive) (send-command-input 'counsel-grep-or-swiper)))
  (define-key vterm-mode-map (kbd "M-f") '(lambda () (interactive) (send-command-input 'forward-word)))
  (define-key vterm-mode-map (kbd "M-b") '(lambda () (interactive) (send-command-input 'backward-word)))
  (define-key vterm-mode-map (kbd "C-e") '(lambda () (interactive) (send-command-input 'move-end-of-line)))
  (define-key vterm-mode-map (kbd "C-a") '(lambda () (interactive) (send-command-input 'move-beginning-of-line)))
  (define-key vterm-mode-map (kbd "M-w") '(lambda () (interactive) (send-command-input
                                                               '(lambda (interactive)
                                                                  (kill-ring-save (point) (mark t))
                                                                  ))))

  (define-key vterm-mode-map (kbd "C-SPC") '(lambda () (interactive) (send-command-input 'set-mark-command)))

(provide 'init-vterm)
