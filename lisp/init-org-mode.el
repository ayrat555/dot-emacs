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
  (setq org-modules
        (quote
         (org-protocol org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m))))

(use-package org-bullets
  :requires org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-sticky-header-mode
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
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/.org-roam/")
      (org-roam-dailies-directory "~/.org-roam/daily/")
      (set org-roam-dailies-capture-templates
           '(("t" "todo" entry
              #'org-roam-capture--get-point
              "* %?"
              :file-name "daily/%<%Y-%m-%d>"
              :head "#+title: %<%Y-%m-%d>\n"
              :olp ("Todo"))

             ("j" "journal" entry
              #'org-roam-capture--get-point
              "* %?"
              :file-name "daily/%<%Y-%m-%d>"
              :head "#+title: %<%Y-%m-%d>\n"
              :olp ("Journal"))))
      (org-roam-graph-viewer "open")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph)
               ("C-c n j" . org-roam-dailies-capture-today)
               ("C-c n t" . org-roam-dailies-capture-tomorrow))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package olivetti
  :config
  (setq olivetti-body-width 150)
  (setq olivetti-minimum-body-width 150)
  (add-hook 'org-mode-hook 'olivetti-mode))

(provide 'init-org-mode)
