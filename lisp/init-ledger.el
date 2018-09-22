(use-package ledger-mode
  :mode "\\.ledger$"
  :config
  (setq ledger-post-auto-adjust-amounts t)
  (setq ledger-post-amount-alignment-column 74)
  (setq org-capture-templates
        (append '(("q" "Ledger entry" plain (file "~/Documents/ledger/journal.ledger")
                   "%(org-read-date) * %^{Payee}
  Expenses:%^{Account}  %^{Amount}₽
  Assets:CreditCard
"))
                org-capture-templates)))

(use-package flycheck-ledger
  :after ledger-mode)

(provide 'init-ledger)
