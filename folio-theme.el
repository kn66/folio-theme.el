;;; folio-theme.el --- Warm paper-like theme built on Modus and Ef -*- lexical-binding: t; -*-

;; Author: nobu43
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0") (ef-themes "2.0.0"))
;; Keywords: faces, theme

;;; Commentary:
;;
;; A restrained light theme built on the `modus-themes' engine and the
;; `ef-themes' palette semantics.  It keeps an off-white paper background,
;; deep blue structural accents, and sparse red warning accents while inheriting
;; the broader package face coverage of the Modus/Ef ecosystem.

;;; Code:

(require 'modus-themes)
(require 'ef-themes)

(defgroup folio-theme nil
  "Warm paper-like derivative theme built on Modus and Ef."
  :group 'faces
  :group 'ef-themes
  :prefix "folio-")

(defconst folio-theme-description
  "Warm paper-like theme with deep blue structure and restrained red accents."
  "Documentation string for the `folio' theme.")

(defconst folio-theme-name 'folio
  "Theme symbol for `folio'.")

(defconst folio-theme-family 'folio-theme
  "Theme family symbol for `folio'.")

(defconst folio-theme-background-mode 'light
  "Background mode for `folio'.")

(defconst folio-palette-partial
  '(;; Core backgrounds / foregrounds
    (cursor "#B68A14")
    (bg-main "#FFFBF0")
    (bg-dim "#F7F2E7")
    (bg-alt "#EEE5CF")
    (fg-main "#2C2924")
    (fg-dim "#6B6459")
    (fg-alt "#7A7165")
    (bg-active "#F5EFE0")
    (bg-inactive "#F7F2E7")
    (border "#DDD4C2")

    ;; Folio-specific helper colors
    (bg-hl "#F5EFE0")
    (yellow-soft "#D8B85A")
    (blue-soft "#4A6A91")
    (red-soft "#B35C4A")
    (green-soft "#74823F")

    ;; Red family: warnings and removal
    (red "#8E3434")
    (red-warmer "#B35C4A")
    (red-cooler "#762A2A")
    (red-faint "#C59588")

    ;; Green family: success and additions
    (green "#5C6B2D")
    (green-warmer "#74823F")
    (green-cooler "#495621")
    (green-faint "#99A66C")

    ;; Yellow family: warm ambient accent
    (yellow "#B68A14")
    (yellow-warmer "#D8B85A")
    (yellow-cooler "#9F7A10")
    (yellow-deep "#7A5D0C")
    (yellow-faint "#D8C37A")

    ;; Blue family: structural guidance
    (blue "#274C77")
    (blue-warmer "#4A6A91")
    (blue-cooler "#1F3F64")
    (blue-faint "#93A5BC")

    ;; Magenta family: muted supporting tone for derived faces
    (magenta "#7B6478")
    (magenta-warmer "#947590")
    (magenta-cooler "#63515F")
    (magenta-faint "#B9A8B7")

    ;; Cyan family: reserved informational accent
    (cyan "#4A7F8E")
    (cyan-warmer "#689AA8")
    (cyan-cooler "#35636F")
    (cyan-faint "#9EC0C9")

    ;; Intense backgrounds
    (bg-red-intense "#F2D8D3")
    (bg-green-intense "#E8EBCF")
    (bg-yellow-intense "#F2E6BE")
    (bg-blue-intense "#DCE8F4")
    (bg-magenta-intense "#E9DDE8")
    (bg-cyan-intense "#DCEDEF")

    ;; Subtle backgrounds
    (bg-red-subtle "#F8E8E4")
    (bg-green-subtle "#F3F5E6")
    (bg-yellow-subtle "#F8F1D7")
    (bg-blue-subtle "#EDF3F8")
    (bg-magenta-subtle "#F3EDF2")
    (bg-cyan-subtle "#EEF5F6")

    ;; Nuanced backgrounds for headings and lightly accented surfaces
    (bg-red-nuanced "#F6EDE9")
    (bg-green-nuanced "#EEF2DE")
    (bg-yellow-nuanced "#F6F0D8")
    (bg-blue-nuanced "#E6EEF6")
    (bg-magenta-nuanced "#F1EAF0")
    (bg-cyan-nuanced "#E8F1F3")

    ;; Graph colors for org-habit and chart-like faces
    (bg-graph-red-0 "#D9877C")
    (bg-graph-red-1 "#E9B7AF")
    (bg-graph-green-0 "#91A252")
    (bg-graph-green-1 "#B7C582")
    (bg-graph-yellow-0 "#D1AD41")
    (bg-graph-yellow-1 "#E7C96E")
    (bg-graph-blue-0 "#6F8FB6")
    (bg-graph-blue-1 "#A2B8D1")
    (bg-graph-magenta-0 "#B18EAD")
    (bg-graph-magenta-1 "#D5C0D2")
    (bg-graph-cyan-0 "#79AAB5")
    (bg-graph-cyan-1 "#AFCCD3")

    ;; Diff
    (bg-added "#E8EBCF")
    (bg-added-faint "#F3F5E6")
    (bg-added-refine "#DCE2B1")
    (bg-added-fringe "#9DA861")
    (fg-added "#5C6B2D")
    (fg-added-intense "#495621")

    (bg-changed "#F2E6BE")
    (bg-changed-faint "#F8F1D7")
    (bg-changed-refine "#E5D18E")
    (bg-changed-fringe "#B68A14")
    (fg-changed "#7A5D0C")
    (fg-changed-intense "#5F4708")

    (bg-removed "#F2D8D3")
    (bg-removed-faint "#F8E8E4")
    (bg-removed-refine "#E7BEB7")
    (bg-removed-fringe "#B35C4A")
    (fg-removed "#8E3434")
    (fg-removed-intense "#762A2A")

    (bg-diff-context "#F5EFE0")

    ;; UI chrome
    (bg-mode-line-active "#EEE5CF")
    (fg-mode-line-active "#2C2924")
    (bg-mode-line-inactive "#F7F2E7")
    (fg-mode-line-inactive "#6B6459")
    (border-mode-line-active "#4A6A91")
    (border-mode-line-inactive "#DDD4C2")
    (bg-completion "#F7F2E7")
    (bg-completion-current "#C4D7EA")
    (bg-hover "#F5EFE0")
    (bg-hover-secondary "#EDF3F8")
    (bg-hl-line "#F5EFE0")
    (bg-paren-match "#EEE5CF")
    (bg-err "#F2D8D3")
    (bg-warning "#F2E6BE")
    (bg-info "#DCE8F4")
    (bg-region "#F8F1D7"))
  "Base palette entries for `folio'.")

(defconst folio-palette-mappings-partial
  '(;; Status
    (err red)
    (warning red-warmer)
    (info blue-warmer)
    (underline-err red)
    (underline-warning red-warmer)
    (underline-note blue-soft)
    (modeline-err red)
    (modeline-warning yellow-cooler)
    (modeline-info blue)
    (bg-prominent-warning bg-warning)
    (fg-prominent-warning fg-main)
    (bg-prominent-note bg-info)
    (fg-prominent-note fg-main)

    ;; Links
    (fg-link blue)
    (fg-link-visited blue-warmer)
    (fg-link-symbolic blue-soft)
    (bg-link unspecified)
    (bg-link-symbolic unspecified)
    (bg-link-visited unspecified)
    (underline-link blue)
    (underline-link-visited blue-warmer)
    (underline-link-symbolic blue-soft)

    ;; Identifiers & prompt
    (name blue)
    (keybind yellow)
    (identifier fg-alt)
    (fg-prompt blue)
    (bg-prompt unspecified)

    ;; Code syntax
    (builtin blue-warmer)
    (comment fg-alt)
    (constant red-warmer)
    (fnname blue)
    (fnname-call blue-warmer)
    (keyword blue)
    (preprocessor blue-soft)
    (property fg-main)
    (docstring fg-alt)
    (docmarkup yellow-cooler)
    (string yellow-deep)
    (type blue-warmer)
    (variable fg-main)
    (variable-use fg-main)
    (rx-backslash red)
    (rx-construct blue)

    ;; Accents
    (accent-0 blue)
    (accent-1 green)
    (accent-2 red-warmer)
    (accent-3 yellow)

    ;; Buttons / selections
    (fg-button-active fg-main)
    (fg-button-inactive fg-dim)
    (bg-button-active bg-main)
    (bg-button-inactive bg-dim)
    (fg-region fg-main)
    (bg-mark-delete bg-red-subtle)
    (fg-mark-delete red)
    (bg-mark-select bg-blue-subtle)
    (fg-mark-select blue)
    (bg-mark-other bg-yellow-subtle)
    (fg-mark-other yellow-cooler)

    ;; Dates
    (date-common blue-warmer)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-holiday-other blue-soft)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled blue)
    (date-scheduled-subtle blue-faint)
    (date-weekday blue)
    (date-weekend red-faint)

    ;; Prose / markup
    (fg-prose-code red-warmer)
    (prose-done green-soft)
    (fg-prose-macro yellow)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula blue-warmer)
    (prose-tag yellow-faint)
    (prose-todo red)
    (fg-prose-verbatim blue-warmer)

    ;; Mail
    (mail-cite-0 blue)
    (mail-cite-1 red-warmer)
    (mail-cite-2 green)
    (mail-cite-3 yellow)
    (mail-part blue-soft)
    (mail-recipient blue)
    (mail-subject red-warmer)
    (mail-other fg-alt)

    ;; Search
    (bg-search-static bg-blue-subtle)
    (bg-search-current bg-blue-intense)
    (bg-search-lazy bg-yellow-subtle)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-blue-intense)
    (bg-search-rx-group-1 bg-red-intense)
    (bg-search-rx-group-2 bg-green-intense)
    (bg-search-rx-group-3 bg-yellow-intense)

    (bg-space-err bg-red-intense)
    (bg-space bg-main)
    (fg-space border)

    ;; Line numbers & fringe
    (fringe bg-main)
    (fg-line-number-active fg-main)
    (fg-line-number-inactive fg-dim)
    (bg-line-number-active bg-hl-line)
    (bg-line-number-inactive bg-main)

    ;; Structural surfaces
    (bg-tab-bar bg-dim)
    (bg-tab-current bg-main)
    (bg-tab-other bg-dim)

    ;; Matching / prompts / emphasis
    (bg-prominent-err bg-err)
    (fg-prominent-err err)
    (fg-paren-match blue)
    (underline-paren-match unspecified)
    (bg-active-argument bg-active)
    (fg-active-argument blue)
    (bg-active-value bg-blue-subtle)
    (fg-active-value blue)

    ;; Prose blocks
    (bg-prose-block-delimiter bg-dim)
    (fg-prose-block-delimiter fg-dim)
    (bg-prose-block-contents bg-dim)
    (bg-prose-code unspecified)
    (bg-prose-macro unspecified)
    (bg-prose-verbatim unspecified)

    ;; Completion / search
    (fg-completion-match-0 blue)
    (fg-completion-match-1 red-soft)
    (fg-completion-match-2 green)
    (fg-completion-match-3 yellow)
    (bg-completion-match-0 unspecified)
    (bg-completion-match-1 unspecified)
    (bg-completion-match-2 unspecified)
    (bg-completion-match-3 unspecified)
    (bg-completion bg-dim)
    (fg-search-current fg-main)

    ;; Terminal
    (bg-term-black fg-main)
    (fg-term-black fg-main)
    (bg-term-black-bright fg-dim)
    (fg-term-black-bright fg-dim)
    (bg-term-red red)
    (fg-term-red red)
    (bg-term-red-bright red-warmer)
    (fg-term-red-bright red-warmer)
    (bg-term-green green)
    (fg-term-green green)
    (bg-term-green-bright green-warmer)
    (fg-term-green-bright green-warmer)
    (bg-term-yellow yellow-cooler)
    (fg-term-yellow yellow-cooler)
    (bg-term-yellow-bright yellow)
    (fg-term-yellow-bright yellow)
    (bg-term-blue blue)
    (fg-term-blue blue)
    (bg-term-blue-bright blue-warmer)
    (fg-term-blue-bright blue-warmer)
    (bg-term-magenta magenta)
    (fg-term-magenta magenta)
    (bg-term-magenta-bright magenta-warmer)
    (fg-term-magenta-bright magenta-warmer)
    (bg-term-cyan cyan)
    (fg-term-cyan cyan)
    (bg-term-cyan-bright cyan-warmer)
    (fg-term-cyan-bright cyan-warmer)
    (bg-term-white bg-alt)
    (fg-term-white fg-dim)
    (bg-term-white-bright bg-main)
    (fg-term-white-bright fg-main)

    ;; Rainbow / heading order
    (rainbow-0 blue)
    (rainbow-1 blue-warmer)
    (rainbow-2 yellow)
    (rainbow-3 fg-main)
    (rainbow-4 red-warmer)
    (rainbow-5 green)
    (rainbow-6 blue-soft)
    (rainbow-7 fg-alt)
    (rainbow-8 fg-dim)

    ;; Headings
    (fg-heading-0 blue)
    (fg-heading-1 blue-warmer)
    (fg-heading-2 yellow-cooler)
    (fg-heading-3 fg-main)
    (fg-heading-4 green)
    (fg-heading-5 blue-soft)
    (fg-heading-6 red-soft)
    (fg-heading-7 fg-alt)
    (fg-heading-8 fg-dim)
    (bg-heading-0 unspecified)
    (bg-heading-1 unspecified)
    (bg-heading-2 bg-yellow-nuanced)
    (bg-heading-3 unspecified)
    (bg-heading-4 bg-green-nuanced)
    (bg-heading-5 bg-blue-nuanced)
    (bg-heading-6 bg-red-nuanced)
    (bg-heading-7 unspecified)
    (bg-heading-8 unspecified)
    (overline-heading-0 blue)
    (overline-heading-1 blue-warmer)
    (overline-heading-2 yellow-cooler)
    (overline-heading-3 unspecified)
    (overline-heading-4 green)
    (overline-heading-5 blue-soft)
    (overline-heading-6 red-soft)
    (overline-heading-7 unspecified)
    (overline-heading-8 unspecified))
  "Semantic color mappings for `folio'.")

(defcustom folio-palette-overrides nil
  "Overrides for `folio-palette'.

Each element should have the form (NAME VALUE), where NAME is a palette
entry from `folio-palette' and VALUE is either another palette symbol
or a color string."
  :group 'folio-theme
  :package-version '(folio-theme . "0.1.0")
  :type '(repeat (list symbol (choice symbol string))))

(defconst folio-palette
  (modus-themes-generate-palette
   folio-palette-partial
   'warm
   nil
   (append folio-palette-mappings-partial ef-themes-palette-common))
  "Full palette for `folio'.")

(defconst folio-custom-faces
  '(`(corfu-default ((,c :inherit modus-themes-fixed-pitch
                         :background ,bg-dim
                         :foreground ,fg-main)))
    `(corfu-current ((,c :background ,bg-completion-current
                         :foreground ,blue
                         :extend t
                         :weight semi-bold)))
    `(corfu-border ((,c :background ,border
                        :foreground ,border)))
    `(corfu-bar ((,c :background ,blue-soft)))
    `(corfu-popupinfo ((,c :background ,bg-dim
                           :foreground ,fg-main))))
  "Additional face overrides for `folio'.

Prefer palette entries and semantic mappings first.
Use direct face overrides only for targeted package cases where the
inherited mapping does not provide enough contrast.")

(defun folio--ensure-modus-theme-metadata ()
  "Declare `folio' as a Modus-derived theme when reloading in-session.

If a `folio' theme object already exists in the session, ensure it still
has the theme properties that `modus-themes-theme' expects."
  (unless (plist-get (get folio-theme-name 'theme-properties) :modus-core-palette)
    (modus-themes-declare
     folio-theme-name
     folio-theme-family
     folio-theme-description
     folio-theme-background-mode
     'folio-palette
     nil
     'folio-palette-overrides)
    (modus-themes-register folio-theme-name)))

(folio--ensure-modus-theme-metadata)

(modus-themes-theme
 folio-theme-name
 folio-theme-family
 folio-theme-description
 folio-theme-background-mode
 'folio-palette
 nil
 'folio-palette-overrides
 'folio-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide 'folio-theme)

;;; folio-theme.el ends here
