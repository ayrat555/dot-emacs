(use-package org
  :demand t
  :mode (("\\.org$" . org-mode))
  :init
  (setq org-agenda-files (list "~/.org/"))
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
  :config
  ;; (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-switchb)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cw" 'org-time-stamp-inactive)
  (add-hook 'org-mode-hook 'visual-line-mode)

  (setq org-agenda-span 'month)
  ;; fixes " version-to-list: Invalid version syntax: ‘’ (must start with a number) "
  (setq org-version "9.4.4")
  (setq org-log-done t)
  (setq org-use-speed-commands t)
  (setq org-return-follows-link t)
  (setq org-enforce-todo-dependencies t)
  (setq org-habit-show-habits-only-for-today t)
  (setq org-archive-location "~/.org/archive/archive.org::* From %s")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.org/todo.org" "Todo")
           "* TODO %? \n  %t \n")
          ("b" "Buy" entry (file+headline "~/.org/buy.org" "Shopping list")
           "* %? \n")))
  ;; org-roam link style to distinguish them from regular links
  (org-link-set-parameters "id"
                           :face 'org-roam-header-line)
  (setq org-modules
        (quote
         (org-protocol org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m))))

(use-package org-bullets
  :requires org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-sticky-header
  :requires org
  :config
  (add-hook 'org-mode-hook (lambda () (org-sticky-header-mode))))

(use-package org-journal
  :ensure t
  :defer t
  :after org
  :bind
  (("C-c o j" . org-journal-new-entry))
  :config
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (setq org-journal-dir "~/.org/journal/")
  (add-to-list 'org-agenda-files org-journal-dir)
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (setq journal-enable-agenda-integration t))

(use-package org-projectile
  :after org
  :after projectile
  :config
  (setq org-projectile-projects-file
        "~/.org/project_todos.org")
  (push (org-projectile-project-todo-entry) org-capture-templates)
  (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))

(use-package calfw)
(use-package calfw-org
  :config
  (setq cfw:org-agenda-schedule-args '(:timestamp))
  (setq cfw:org-overwrite-default-keybinding t))

(use-package org-roam
      :ensure t
      :init  (setq org-roam-v2-ack t)
      :custom
      (org-roam-directory (file-truename "~/.org-roam/"))
      :bind (("C-c n l" . org-roam-buffer-toggle)
             ("C-c n f" . org-roam-node-find)
             ("C-c n g" . org-roam-graph)
             ("C-c n i" . org-roam-node-insert)
             ("C-c n c" . org-roam-capture)
             ;; Dailies
             ("C-c n j" . org-roam-dailies-capture-today)
             ("C-c n d" . org-roam-dailies-goto-today)
             ("C-c n y" . org-roam-dailies-goto-yesterday)
             ("C-c n t" . org-roam-dailies-goto-tomorrow)
             ("C-c n q" . org-roam-dailies-goto-date))
      :config
      (org-roam-db-sync)
      (setq org-roam-dailies-directory "daily/")
      (setq org-roam-dailies-capture-templates
            '(("d" "default" entry
               "* %<%H:%M> %?"
               :target (file+head "%<%Y-%m-%d>.org"
                                  "#+title: %<%Y-%m-%d>\n")))))

(provide 'init-org-mode)
