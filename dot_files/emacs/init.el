(load-file "~/.emacs.d/plugins/ludwig-mode/ludwig-mode.el")

;; Initialize MELPA
(require 'package)
(package-initialize)


(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auto-complete
    autopair
    better-defaults
    flycheck
    jedi
    neotree
    magit
    material-theme
    python-mode
    yasnippet))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




(global-auto-complete-mode t)
; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional


;;; Theme & Other Visual Settings
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(global-flycheck-mode t)

;;; Keybindings
(global-set-key (kbd "C-c 1")  'neotree-toggle)
(global-set-key (kbd "C-c 2")  'magit-status)


(electric-indent-mode 0)
(yas-global-mode 1)
