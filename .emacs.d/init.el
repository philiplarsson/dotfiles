(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)
(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(doom-one-light))
 '(custom-safe-themes
   '("e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "d5f8099d98174116cba9912fe2a0c3196a7cd405d12fa6b9375c55fc510988b5" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "1d50bd38eed63d8de5fcfce37c4bb2f660a02d3dff9cbfd807a309db671ff1af" "cb96a06ed8f47b07c014e8637bd0fd0e6c555364171504680ac41930cfe5e11e" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" default))
 '(package-selected-packages
   '(undo-tree smartparens aggressive-indent git-gutter exec-path-from-shell typescript-mode dockerfile-mode counsel-projectile projectile smex counsel ivy crux avy which-key doom-themes))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Roboto Mono")))))
