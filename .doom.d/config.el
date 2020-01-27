;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

; Font & Theme
(setq doom-font (font-spec :family "Ubuntu Mono" :size 18))
(setq doom-theme 'doom-solarized-dark)

; C settings
(setq c-default-style "bsd")

; Python settings
(setq doom-modeline-python-executable "python3")
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3"
      flycheck-python-pylint-executable "python3"
      flycheck-python-flake8-executable "python3")
(setq doom-modeline-major-mode-icon nil
      doom-modeline-persp-name t
      doom-modeline-github t
      doom-modeline-version t
      doom-modeline-minor-modes t)
(setq persp-nil-name "#")
(setq minions-mode-line-lighter "◎")

; Tabs
(setq-default indent-tabs-mode t)
(setq tab-always-indent t)
(setq electric-indent-inhibit t)
;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing lines-tail))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
; 80 column coloring
(setq whitespace-line-column 80)
;(add-hook 'prog-mode-hook #'whitespace-mode)
(global-whitespace-mode) ; Enable whitespace mode everywhere

; Markdown settings
(add-hook 'markdown-mode-hook 'pandoc-mode)
