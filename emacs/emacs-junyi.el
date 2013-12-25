;;; add search path
(add-to-list 'load-path "/Users/junyi/dotfiles/emacs")
(add-to-list 'load-path "/usr/bin")
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs")

;;; elrang support
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(add-hook 'erlang-mode-hook
		  #'(lambda () (setq indent-tabs-mode nil)))

;;; show whitespaces
(setq-default show-trailing-whitespace t)

;;; tab width
(setq default-tab-width 4)

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
(setq wg-switch-on-load 1)
(wg-load "/Users/junyi/dotfiles/emacs/default.layout")

;; function key map
(define-key function-key-map "\e\eOA" [(meta up)])
(define-key function-key-map "\e\eOB" [(meta down)])
(define-key function-key-map "\e\eOC" [(meta right)])
(define-key function-key-map "\e\eOD" [(meta left)])
;;;(define-key function-key-map "\eOa" [(control up)])
;;;(define-key function-key-map "\eOb" [(control down)])
;;;(define-key function-key-map "\eOc" [(control right)])
;;;(define-key function-key-map "\eOd" [(control left)])

;; (define-key function-key-map "\e[T" [(shift tab)])
;; (define-key function-key-map "\e[U" [(control tab)])

(global-set-key [(meta down)]    'scroll-up-1)
(global-set-key [(meta up)]      'scroll-down-1)

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
(global-set-key [f10]      'enlarge-window)

;;; -------------- ;;;
;;; cscope support ;;;
;;; -------------- ;;;

;;; (require 'xcscope)

;;	(define-key global-map [(control f3)]  'cscope-set-initial-directory)
;;	(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;;	(define-key global-map [(control f5)]  'cscope-find-this-symbol)

;;	(define-key global-map [(control f7)]
;;	  'cscope-find-global-definition-no-prompting)
;;	(define-key global-map [(control f8)]  'cscope-pop-mark)
;;	(define-key global-map [(control f9)]  'cscope-next-symbol)
;;	(define-key global-map [(control f10)] 'cscope-next-file)
;;	(define-key global-map [(control f11)] 'cscope-prev-symbol)
;;	(define-key global-map [(control f12)] 'cscope-prev-file)
;;      (define-key global-map [(meta f9)]  'cscope-display-buffer)
;;      (defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)

;;; cscope keybinding
(define-key global-map [(meta ..)] 'cscope-find-global-definition)
(define-key global-map [(meta .r)] 'cscope-find-functions-calling-this-function)

;(global-set-key (kbd "M-.") 'cscope-find-global-definition)
;(global-set-key (kbd "\M-.r") 'cscope-find-functions-calling-this-function)
