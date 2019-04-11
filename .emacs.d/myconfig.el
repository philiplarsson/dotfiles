(set-frame-font "Source Code Variable 14" nil t)

;; Add linespacing
(setq-default line-spacing 6)

;; Allow y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable bell
(setq visible-bell 1)

;; Save backups in emacs-backups folder
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Disk space is cheap. Save lots.
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)

;; Remove Toolbar
(tool-bar-mode -1)

;; Highlight Parenthesis
(show-paren-mode t)

;; Remove Scrollbar
(scroll-bar-mode -1)

(use-package nimbus-theme
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
