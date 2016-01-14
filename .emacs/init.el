;; Mac specific
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'meta)
(setq mac-option-modifier nil)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 5))) ;; one line at a time, 5* with shift
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Font size
(set-face-attribute 'default nil :height 140)

;; Add major mode:
;; (add-to-list 'auto-mode-alist '("reqexpr" . mode))
;;  ex:
;; (add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))

;; Activate minor mode when major mode is started, create hook:
;; (add-hook 'text-mode-hook 'orgtbl-mode)

;; #################### My Init File ####################
;; Backup folder
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
;; (setq auto-save-file-name-transforms
;;       `(("." , "~/.emacs.d/saves")))

;; Using cask instead of melpa package install
;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Allow syntax highlightning in org mode code block
(setq org-src-fontify-natively t)

;; Load rainbow mode while in css mode
(add-hook 'css-mode-hook 'rainbow-mode)

;; Projectile
(projectile-global-mode)

;; Yasnippet
(yas-global-mode t)

;; Include auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; Set indent mode
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Delete marked word when typing
(delete-selection-mode t)

;; Rebind list-buffer to buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;;Make cursor blinky (often standard behavior)
(blink-cursor-mode t)

;; Highlight corresponding parenthasies
(show-paren-mode t)

;;Disable toolbar and scroll in GUI emacs
(when (window-system)
  (tool-bar-mode -1))

;; Make Lines Wrap on words
(global-visual-line-mode t)

;; Make linum mode start
(global-linum-mode t)

;; Initialise smart parens
(smartparens-global-mode t)

;; Don't show start message, go to scratch
(setq inhibit-startup-message t)

;; Make question y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Plugin keyboard shortcuts
(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "<S-tab>") 'emmet-expand-line) ; Should use Shift+Tab for emmet.

;; Projectile key mapping
(define-key projectile-mode-map (kbd "C-ö f") 'projectile-find-file)
(define-key projectile-mode-map (kbd "C-ö 2 f") 'projectile-find-file-other-window)
(define-key projectile-mode-map (kbd "C-ö b") 'projectile-switch-to-buffer)

;; Ido-mode:
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; #################### My own function ####################
(defun select-current-line ()
  "Selects the current line"
  (interactive)
  (end-of-line)
  (push-mark (line-beginning-position) nil t))
(global-set-key (kbd "M-l") 'select-current-line)

(defun line-above()
  "Pastes line above"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "M-RET") 'line-above)

;; newline-without-break-of-line
(defun newline-without-break-of-line ()
  "1. move to end of the line.
  2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(web-mode-code-indent-offset 4)
 '(web-mode-markup-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
