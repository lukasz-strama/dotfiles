(setq custom-file "~/.config/emacs/init.custom.el")

(add-to-list 'load-path "~/.config/emacs/lisp/")
(require 'simpc-mode)
(require 'smex)
(require 'multiple-cursors)
(smex-initialize)

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(add-to-list 'default-frame-alist `(font . "IosevkaTerm Nerd Font-16"))

(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(defun rc/duplicate-line ()
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

(load-file custom-file)
