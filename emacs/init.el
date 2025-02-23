(setq custom-file "~/.config/emacs/init.custom.el")

(add-to-list 'load-path "~/.config/emacs/lisp/")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(add-to-list 'default-frame-alist `(font . "IosevkaTerm Nerd Font-16"))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-file custom-file)
