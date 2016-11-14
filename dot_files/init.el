;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    find-file-in-project
    flycheck
    idle-highlight-mode
    ido-ubiquitous
    material-theme
    paredit
    py-autopep8
    neotree
    magit
    markdown-mode
    smex
    scpaste))

(package-initialize)
(dolist (p myPackages)
  (when (not (package-installed-p p))
    (package-install p)))

;;(mapc #'(lambda (package)
;;    (unless (package-installed-p package)
;;      (package-install package)))
;;      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
;; (global-linum-mode t) ;; enable line numbers globally


(global-set-key [f8] 'neotree-toggle)

;; (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)



;; PYTHON CONFIGURATION
;; --------------------------------------

;; (elpy-enable)
;; (elpy-use-ipython)

;; use flycheck not flymake with elpy
;; (when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(starter-kit-install-if-needed 'elpy 'flycheck 'py-autopep8 'py-yapf)
(elpy-enable)
(setq elpy-modules '(elpy-module-company
                     elpy-module-eldoc
                     elpy-module-pyvenv
                     elpy-module-yasnippet
                     elpy-module-sane-defaults)))
(setq  elpy-rpc-timeout "10")
(elpy-use-ipython)
(require 'py-yapf)
(add-hook 'elpy-mode-hook 'py-yapf-enable-on-save)



;;; Markdown mode   
(autoload 'gfm-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . gfm-mode) auto-mode-alist))


;; DEVOPS
(define-key global-map (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-x C-b") 'bs-show)


;; init.el ends here
(put 'upcase-region 'disabled nil)
