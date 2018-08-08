(require 'org-bullets)
(require 'org-habit)
(require 'org-journal)

(setq org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))

(add-hook 'org-mode-hook 'org-bullets-mode)


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
(setq org-log-done t)
(setq org-use-speed-commands t)
(setq org-return-follows-link t)
(setq org-habit-show-habits-only-for-today nil)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-files (list "~/Dropbox/org/"))

(setq org-archive-location "~/Dropbox/org_archive/archive.org::* From %s")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Todo soon")
         "* TODO %? \n  %^t")
        ("i" "Idea" entry (file+headline "~/Dropbox/org/ideas.org" "Ideas")
         "* %? \n %U")
        ("e" "Tweak" entry (file+headline "~/Dropbox/org/tweaks.org" "Tweaks")
         "* %? \n %U")
        ("l" "Learn" entry (file+headline "~/Dropbox/org/learn.org" "Learn")
         "* %? \n")
        ("w" "Work note" entry (file+headline "~/Dropbox/org/work.org" "Work")
         "* %? \n")
        ("m" "Check movie" entry (file+headline "~/Dropbox/org/check.org" "Movies")
         "* %? %^g")
        ("n" "Check book" entry (file+headline "~/Dropbox/org/check.org" "Books")
         "* %^{book name} by %^{author} %^g")))

(require 'org-projectile)
(setq org-projectile-projects-file
      "~/Dropbox/org/project_todos.org")
(push (org-projectile-project-todo-entry) org-capture-templates)
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)

(provide 'init-org-mode)
