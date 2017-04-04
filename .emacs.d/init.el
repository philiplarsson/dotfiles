;;; ---------- MELPA ----------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;; ---------- Plugins using use-package  ----------
(use-package dracula-theme
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package helm
  :ensure t
  :config
  (require 'helm-config))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm))

(use-package php-mode
  :ensure t)

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode))

(use-package avy
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))


;;; ---------- Keybindings ----------

;; ---  Helm Keybindings ---
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
;; Replace M-x with helm-M-x
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "M-x") 'helm-M-x)
;; Helm Kill ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; --- Avy Keybindings ---
(global-set-key (kbd "C-c C-SPC") 'avy-goto-word-or-subword-1)

;;; ---------- General Settings ----------
;; Remove Toolbar
(tool-bar-mode -1)
;; Remove Menu Bar
(menu-bar-mode -1)
;; Remove Scrollbar
(scroll-bar-mode -1)
;; Highlight Parenthesis
(show-paren-mode t)
;; Wrap text on words
(global-visual-line-mode t)
;; Remove selected text when typing
(delete-selection-mode t)
;; Use 2 spaces for tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; Allow y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)
;; Scroll 5 lines instead of default
(setq scroll-step 5)
;;; ---------- Settings Set By configuration ----------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Meslo LG L DZ for Powerline" :foundry "PfEd" :slant normal :weight normal :height 123 :width normal)))))
