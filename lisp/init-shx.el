(use-package shx
  :config
  (setq
  ;; resync the shell's default-directory with Emacs on "z" commands:
  shx-directory-tracker-regexp "^z "
  ;; vastly improve display performance by breaking up long output lines
  shx-max-output 1024
  ;; prevent input longer than macOS's typeahead buffer from going through
  shx-max-input 1024
  ;; prefer inlined images and plots to have a height of 250 pixels
  shx-img-height 250
  ;; don't show any incidental hint messages about how to use shx
  shx-show-hints nil
  ;; flash the previous comint prompt for a full second when using C-c C-p
  shx-flash-prompt-time 1.0
  ;; use `#' to prefix shx commands instead of the default `:'
  shx-leader ":"
  shx-global-mode 1)
  (global-set-key (kbd "C-c ` `") 'shx))


(defvar comint-history-dir (locate-user-emacs-file "comint-history"))

(unless (file-exists-p comint-history-dir)
  (make-directory comint-history-dir))

(defun comint-write-history-on-exit (process event)
  (message (process-name process))
  (let ((buf (process-buffer process)))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (insert (format "\nProcess %s %s" process event))))))

(defun turn-on-comint-history ()
  (let ((process (get-buffer-process (current-buffer))))
    (when process
      (setq comint-input-ring-file-name
            (expand-file-name (format "%s-history"
                                      (car (split-string (message (process-name process)) "<")))
                              comint-history-dir))
      (comint-read-input-ring t)
      (add-hook 'kill-buffer-hook 'comint-write-input-ring t t)
      (set-process-sentinel process
                            #'comint-write-history-on-exit))))

(add-hook 'shx-mode-hook 'turn-on-comint-history)

(defun comint-write-input-ring-all-buffers ()
  (mapc (lambda (buffer) (with-current-buffer buffer (comint-write-input-ring)))
        (buffer-list)))

(add-hook 'kill-emacs-hook 'comint-write-input-ring-all-buffers)

(provide 'init-shx)
