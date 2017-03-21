(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; ---------- Evil Settings ----------
; As per manual instruction, these should be done before Evil is
; loaded.
(setq evil-shift-width 2)

;;; ---------- Plugins ----------
;; Evil mode
(require 'evil)
(evil-mode 1)

;; Powerline
(require 'powerline)
(powerline-center-evil-theme)

;; Scala mode
(require 'scala-mode)

;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode t)

;; Helm
(require 'helm)
(require 'helm-config)

;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)

;; PHP mode
(require 'php-mode)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Dumb Jump
(dumb-jump-mode)

;;; ---------- Keybindings ----------
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-n") 'forward-char)
(global-set-key (kbd "M-c") 'previous-line)
(global-set-key (kbd "M-t") 'next-line)

;; Helm Keybindings
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

(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)

;; Move between windows using M-o
(global-set-key (kbd "M-o") 'other-window)

;; Evil Keybindings
;; Use C-e to go to end of line
(define-key evil-normal-state-map (kbd "C-e") 'evil-append-line)
(define-key evil-insert-state-map (kbd "C-e") 'evil-append-line)
(define-key evil-insert-state-map (kbd "C-<return>") 'evil-open-below)
; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;;; ---------- General Settings ----------
;; Remove toolbar
(when (window-system)
  (tool-bar-mode -1))
;; Remove Menu Bar
(menu-bar-mode -1)
;; Remove Scrollbar
(scroll-bar-mode -1)

;; Wrap text on words
(global-visual-line-mode t)

;; Remove selected text when typing
(delete-selection-mode t)

;; Highlight Parenthasis
(show-paren-mode t)

;; Use 2 spaces for tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Allow y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; Use IDO Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
;; IDO File matching (C-x C-f) (find files) with IDO
(setq ido-eveywhere t)

;; Auto Indent When Pressing enter
(define-key global-map (kbd "RET") 'newline-and-indent)

;; windmove Package to move to window using shift+arrow keys
(windmove-default-keybindings)

;; Always insert matching brackets & parenthesis
(electric-pair-mode 1)

;; Use Hippie Expand
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Use ibuffer instead of buff-menu
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ---------- Mouse ----------
;;; scroll one line at a time (less "jumpy" than defaults) 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling  
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; ---------- Variables set by Custom ----------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
	 (quote
		("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(line-move-visual t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Meslo LG L DZ for Powerline" :foundry "PfEd" :slant normal :weight normal :height 123 :width normal)))))
