(load-file "~/.emacs.d/plugins/ludwig-mode/ludwig-mode.el")
(add-to-list 'load-path "~/.emacs.d/plugins/go-mode")


;; Initialize MELPA
(require 'package)

(require 'go-mode-autoloads)

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
    go-autocomplete
    jedi
    neotree
    magit
    material-theme
    pylint
    python-mode
    yasnippet
    virtualenvwrapper))

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

;;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook #'(lambda () (setq flycheck-checker 'python-pylint)))

(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional


;;; godoc
(setenv "GOPATH" "/home/tardis/sandbox/go")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


;;; Call gofmt on save
(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;;; Theme & Other Visual Settings
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(global-flycheck-mode t)

;;; Keybindings
(global-set-key (kbd "C-c 1")  'neotree-toggle)
(global-set-key (kbd "C-c 2")  'magit-status)
(global-flycheck-mode)


(electric-indent-mode 0)
(yas-global-mode 1)
(setq debug-on-error t)
