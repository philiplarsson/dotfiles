(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

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
;;; ---------- Keybindings ----------
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-n") 'forward-char)
(global-set-key (kbd "M-c") 'previous-line)
(global-set-key (kbd "M-t") 'next-line)

(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
;;; ---------- General Settings ----------
;; Remove toolbar
(when (window-system)
  (tool-bar-mode -1))
;; Remove Menu Bar
(menu-bar-mode -1)
;; Wrap text on words
(global-visual-line-mode t)

;; Remove selected text when typing
(delete-selection-mode t)

;; Highlight Parenthasis
(show-paren-mode t)

;; Use 2 spaces for tab
(setq-default tab-width 2)
(setq-default ident-tabl-mode nil)

;; Allow y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; ---------- Mouse ----------
;;; scroll one line at a time (less "jumpy" than defaults) 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling  
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Meslo LG L DZ for Powerline" :foundry "PfEd" :slant normal :weight normal :height 123 :width normal)))))
