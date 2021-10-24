;; -*- lexical-binding: t; -*-

(use-package org
  :demand t
  :mode (("\\.org$" . org-mode))
  :init
  (setq org-agenda-files (list "~/.org-roam/todos/"))
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
  (setq org-archive-location "~/.org-roam/archive/archive.org::* From %s")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.org-roam/todos/20210919173245-actions.org" "Backlog")
           "* TODO %? \n  %t \n")
          ("f" "Fiction Books" entry (file+headline "~/.org-roam/fun/20210920064135-fiction_books.org" "Backlog")
           "* %? \n  %t \n")
          ("i" "Nonfiction Books" entry (file+headline "~/.org-roam/personal/20210919163010-nonfiction_books.org" "Backlog")
           "* %? \n  %t \n")
          ("m" "Movie" entry (file+headline "~/.org-roam/fun/20210102175200-movies.org" "Backlog")
           "* %? \n %t \n")
          ("v" "TV" entry (file+headline "~/.org-roam/fun/20210102112056-tv_series.org" "Backlog")
           "* %? \n %t \n")
          ("u" "Music" entry (file+headline "~/.org-roam/fun/20210925131533-music.org" "Backlog")
           "* %? \n %t \n")
          ("b" "Buy" entry (file+headline "~/.org-roam/personal/20210925123610-buy.org" "Backlog")
           "* %? \n %t \n")))
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
      :after org
      :init  (setq org-roam-v2-ack t)
      :custom
      (org-roam-directory (file-truename "~/.org-roam/"))
      :bind (("C-c n l" . org-roam-buffer-toggle)
             ("C-c n f" . ayrat555/org-roam-node-find)
             ("C-c n g" . org-roam-node-find)
             ("C-c n i" . org-roam-node-insert)
             ("C-c n c" . ayrat555/org-roam-capture)
             ;; Dailies
             ("C-c n j" . org-roam-dailies-capture-today)
             ("C-c n d" . org-roam-dailies-goto-today)
             ("C-c n y" . org-roam-dailies-goto-yesterday)
             ("C-c n t" . org-roam-dailies-goto-tomorrow)
             ("C-c n q" . org-roam-dailies-goto-date))
      :config
      (org-roam-db-autosync-mode)
      (setq org-roam-dailies-directory "daily/")
      (setq org-roam-dailies-capture-templates
            '(("d" "default" entry
               "* %<%H:%M> %?"
               :target (file+head+olp "%<%Y-%m-%d>.org"
                                  "#+title: %<%Y-%m-%d>\n" ("Journal"))))))

(defun ayrat555/org-roam-capture ()
  (interactive)
  (let* ((directory (completing-read "org-roam directory: " (ayrat555/org-roam-directories)))
         (org-roam-directory (expand-file-name directory org-roam-directory)))
    (setq ayrat555/org-roam-current-tag directory)
    (org-roam-capture- :node (org-roam-node-read
                              nil
                              (ayrat555/org-roam-filter-by-tag directory))
                       :templates ayrat555/org-roam-capture-templates)))

(defcustom ayrat555/org-roam-capture-templates
  '(("d" "default" plain "%?"
     :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                        "#+title: ${title}\n#+filetags: :%(ayrat555/org-roam-get-current-tag):")
     :unnarrowed t))
    "Templates for the creation of new entries within Org-roam.")

(defun ayrat555/org-roam-get-current-tag ()
  ayrat555/org-roam-current-tag)

(defun ayrat555/org-roam-directories ()
  (let ((files (directory-files org-roam-directory)))
    (seq-filter (lambda (name)
                  (and (file-directory-p (concat org-roam-directory name))
                       (not (string-prefix-p "." name))))
                files)))

(defun ayrat555/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun ayrat555/org-roam-node-find ()
  (interactive)
  (let* ((tags (ayrat555/org-roam-directories))
         (tag (completing-read "tag: " tags))
         (org-roam-directory (expand-file-name tag org-roam-directory)))
    (setq ayrat555/org-roam-current-tag tag)
    (org-roam-node-find
     nil
     nil
     (ayrat555/org-roam-filter-by-tag tag)
     :templates ayrat555/org-roam-capture-templates)))

(use-package ox-hugo
  :ensure t
  :after ox)

(provide 'init-org-mode)
