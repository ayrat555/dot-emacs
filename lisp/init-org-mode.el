(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

(require 'org-projectile)
(setq org-projectile-projects-file
      "~/Dropbox/org/project_todos/todos.org")
(push (org-projectile-project-todo-entry) org-capture-templates)
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
(setq org-log-done t)
(setq org-use-speed-commands t)
(setq org-return-follows-link t)
(setq org-agenda-files (list "~/Dropbox/org/"
                             "~/Dropbox/org/todos/"
                             "~/Dropbox/org/side_projects/"
                             "~/Dropbox/org/work/"))
(provide 'init-org-mode)
