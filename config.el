(setq-default vterm-shell (executable-find "fish"))
    
(setq-default explicit-shell-file-name (executable-find "fish"))

(use-package! tabnine
  :hook ((prog-mode . tabnine-mode)
	 (kill-emacs . tabnine-kill-process))
  :config
  (add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)
  (tabnine-start-process)
  :bind
  (:map  tabnine-completion-map
	("<tab>" . tabnine-accept-completion)
	("TAB" . tabnine-accept-completion)
	("M-f" . tabnine-accept-completion-by-word)
	("M-<return>" . tabnine-accept-completion-by-line)
	("C-g" . tabnine-clear-overlay)
	("M-[" . tabnine-previous-completion)
	("M-]" . tabnine-next-completion)))


(use-package! org
  :config
  (setq org-startup-with-latex-preview t        ;; Show LaTeX formulas nicely
        org-startup-with-inline-images t        ;; Show inline images in Org files
        org-hide-emphasis-markers t             ;; Hide emphasis markers (*bold*, /italic/)
        org-ellipsis " ▾"                       ;; Use a nice ellipsis
        org-appear-autoemphasis t               ;; Auto emphasize text
        org-fontify-whole-heading-line t         ;; Fontify whole heading line
        org-pretty-entities t))                  ;; Prettify LaTeX entities (e.g., Greek letters)

;; Customize heading font styles
(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿") ;; Choose bullet points
      org-superstar-item-bullet-alist '((?* . "•") (?+ . "➤") (?- . "❖"))) ;; Custom bullets

;; Enable org-superstar for cleaner headers
(use-package! org-superstar
  :hook (org-mode . org-superstar-mode))

;; Make LaTeX symbols like ∑ and ∆ appear as proper characters
(setq org-pretty-entities t)

(use-package math-preview)

(setq doom-theme 'doom-monokai-pro)
(custom-theme-set-faces!
'doom-monokai-pro      
'(org-level-3 :inherit outline-3 :height 1.05)      
'(org-level-2 :inherit outline-2 :height 1.25)      
'(org-level-1 :inherit outline-1 :height 1.4)      
'(org-document-title  :height 1.5 :underline nil))

(map! :leader
      :desc "Reload math preview"
      "c p" #'math-preview-all)
