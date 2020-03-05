(use-package org
  :demand t
  :mode (("\\.org$" . org-mode))
  :init
  (setq org-agenda-files (list "~/.org/"))
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
  :config
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-switchb)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cw" 'org-time-stamp-inactive)
  (setq org-log-done t)
  (setq org-use-speed-commands t)
  (setq org-return-follows-link t)
  (setq org-enforce-todo-dependencies t)
  (setq org-habit-show-habits-only-for-today nil)
  (setq org-archive-location "~/.org/archive/archive.org::* From %s")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.org/todo.org" "Todo")
           "* TODO %? \n  %^t")
          ("i" "Idea" entry (file+headline "~/.org/ideas.org" "Ideas")
           "* %? \n %U")
          ("h" "Hobby" entry (file+headline "~/.org/hobby.org" "Hobby Projects")
           "* %? \n %U")
          ("e" "Tweak" entry (file+headline "~/.org/tweaks.org" "Tweaks")
           "* %? \n %U")
          ("l" "Learn" entry (file+headline "~/.org/learn.org" "Learn")
           "* %? \n")
          ("w" "Work note" entry (file+headline "~/.org/work.org" "Work")
           "* %? \n")
          ("m" "Check movie" entry (file+headline "~/.org/check.org" "Movies")
           "* %? %^g")
          ("n" "Check book" entry (file+headline "~/.org/check.org" "Books")
           "* %^{book name} by %^{author} %^g")))
  (setq org-modules
        (quote
         (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m))))

(use-package org-bullets
  :requires org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-sticky-header-mode
  :requires org
  :config
  (add-hook 'org-mode-hook (lambda () (org-sticky-header-mode))))

(use-package org-journal
  :requires org)

(use-package org-projectile
  :after org
  :after projectile
  :config
  (setq org-projectile-projects-file
        "~/.org/project_todos.org")
  (push (org-projectile-project-todo-entry) org-capture-templates)
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))


(provide 'init-org-mode)
