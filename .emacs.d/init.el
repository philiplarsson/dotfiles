;; --------------- Philip's Emacs Configuration ---------------

;;; ---------- Packages ----------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;;; ---------- Mac Specific ----------
(when (eq system-type 'darwin)
  (setq mac-option-modifier nil
  mac-command-modifier 'meta
  x-select-enable-clipboard t))


;;; ---------- Load Configurations File ----------
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


;;; ---------- watch_here scripts ----------
(defun run-php-check ()
  "Check the current PHP file using check-php.sh"
  (interactive)
  (shell-command (format "%s %s" "~/.scripts/check-php.sh" buffer-file-name)))

(global-set-key (kbd "C-c c") 'run-php-check)

;;; ---------- Settings Set By Emacs Menu Configuration ----------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-window-fixed-size t)
 '(neo-window-width 40)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 112 :width normal)))))
