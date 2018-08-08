(require 'multi-term)

(setq multi-term-program "/usr/bin/zsh")

(global-set-key (kbd "C-c t") 'multi-term)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-unbind-key-list (quote "M-o"))
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (setq term-buffer-maximum-size 0)
            (setq show-trailing-whitespace nil)))

(setq term-bind-key-alist
   (quote
    (("M-]" . multi-term-next)
     ("M-[" . multi-term-prev)
     ("C-c C-c" . term-interrupt-subjob)
     ("C-c C-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-a" . beginning-of-line)
     ("C-e" . end-of-line)
     ("C-f" . forward-char)
     ("C-b" . backward-char)
     ("C-s" . isearch-forward)
     ("C-r" . isearch-backward)
     ("C-m" . term-send-return)
     ("C-y" . term-paste)
     ("M-f" . term-send-forward-word)
     ("M-b" . term-send-backward-word)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("<C-backspace>" . term-send-backward-kill-word)
     ("M-r" . term-send-reverse-search-history)
     ("M-d" . term-send-delete-word)
     ("M-," . term-send-raw)
     ("M-." . comint-dynamic-complete))))

(provide 'init-multi-term)
