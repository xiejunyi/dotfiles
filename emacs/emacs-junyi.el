;;; add search path
(add-to-list 'load-path "/Users/junyi/.emacs.d/cc-mode/")
(add-to-list 'load-path "/Users/junyi/.emacs.d/")

;;; display date and time
(display-time-mode 1)
(setq display-time-format "%R %m-%d-%Y")
(setq display-time-day-and-date t) ;;
(setq display-time-24hr-format t)
(display-time)

(require 'cc-mode)
(c-initialize-cc-mode t)
;;;(c-init-language-vars-for 'java-mode)
;;;(c-common-init 'java-mode) ; Or perhaps (c-basic-common-init 'some-mode)

;;; show whitespaces
(setq-default show-trailing-whitespace t)

;;; no tabs and tab width
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 4)

;;; java mode indent
(require 'java-mode-indent-annotations)
(add-hook 'java-mode-hook
		  (lambda () (interactive) (column-marker-1 80)))

;;; column marker
(require 'column-marker)
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(add-hook 'java-mode-hook 'fci-mode)
(add-hook 'c-mode-hook 'fci-mode)

;;; smart scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

;;; long lines mode
(autoload 'longlines-mode
  "longlines.el"
  "Minor mode for automatically wrapping long lines." t)

;;; workgroups to restore windows
(require 'workgroups)
(workgroups-mode 1)
(setq wg-switch-on-load nil)
(wg-load "/Users/junyi/.emacs.d/default.layout")

;;; cscope support ;;;
(require 'xcscope)
(cscope-setup)

;;; elrang support
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(add-hook 'erlang-mode-hook
		  #'(lambda () (setq indent-tabs-mode nil)))


;;; try to display the buffer in an existing window
;;; without creating new windows on the selected frame.
(setq split-height-threshold nil)
(setq split-width-threshold nil)

;; function key map
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta down)]    'scroll-up-1)
(global-set-key [(meta up)]      'scroll-down-1)

;;;(define-key function-key-map "\e\eOA" [(meta up)])
;;;(define-key function-key-map "\e\eOB" [(meta down)])
;;;(define-key function-key-map "\e\eOC" [(meta right)])
;;;(define-key function-key-map "\e\eOD" [(meta left)])
;;;(define-key function-key-map "\eOa" [(control up)])
;;;(define-key function-key-map "\eOb" [(control down)])
;;;(define-key function-key-map "\eOc" [(control right)])
;;;(define-key function-key-map "\eOd" [(control left)])

;; (define-key function-key-map "\e[T" [(shift tab)])
;; (define-key function-key-map "\e[U" [(control tab)])

;;; Emulation of the vi % command
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key (kbd "C-x %") 'goto-match-paren)

;;; Line to top of window;
;;; replace three keystroke sequence  C-u 0 C-l
(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive)
  (recenter 0))
(global-set-key [f6] 'line-to-top-of-window)

;;; remap previous input [M-p]
(global-set-key (kbd "M-p") 'comint-previous-input)

;;; remap goto-line [M-g g]
(global-set-key (kbd "M-g") 'goto-line)

;;; remap other-window [(shift tab)]
(global-set-key [(backtab)] 'other-window)

;;; create a shell [M-x shell]
(global-set-key (kbd "M-s") 'shell)

;;; string to fill a rectangle
(global-set-key (kbd "C-x rp")  'string-insert-rectangle)

;;; revert a buffer
(global-set-key [f5]  'revert-buffer)

;;; show line and col number
(setq line-number-mode t)
(setq column-number-mode t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; resize windows
(global-set-key [f7]      'shrink-window-horizontally)
(global-set-key [f8]      'enlarge-window-horizontally)
(global-set-key [f9]      'shrink-window)
(global-set-key [f10]     'enlarge-window)

;;; cscope keybinding
(global-set-key (kbd "C-c s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-c d") 'cscope-find-global-definition)
(global-set-key (kbd "C-c r") 'cscope-find-functions-calling-this-function)
(global-set-key (kbd "C-c c") 'cscope-find-called-functions)
(global-set-key (kbd "C-c f") 'cscope-find-this-file)
(global-set-key (kbd "C-c g") 'cscope-find-egrep-pattern)
(global-set-key (kbd "C-c =") 'cscope-find-assignments-to-this-symbol)
(global-set-key (kbd "C-c #") 'cscope-find-files-including-file)


