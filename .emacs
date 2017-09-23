(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
 
(package-initialize)

(custom-set-variables
 '(package-selected-packages (quote (zenburn-theme))))

(load-theme 'zenburn t)
