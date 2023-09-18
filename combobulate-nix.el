;;; combobulate-nix.el --- nix-specific features for combobulate  -*- lexical-binding: t; -*-

;; Copyright (C) 2021-23  Mickey Petersen

;; Author: Mickey Petersen <mickey at masteringemacs.org>
;; Package-Requires: ((emacs "29"))
;; Version: 0.1
;; Homepage: https://www.github.com/mickeynp/combobulate
;; Keywords: convenience, tools, languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'nix-ts-mode)
(require 'combobulate-navigation)
(require 'combobulate-manipulation)
(require 'combobulate-interface)
(require 'combobulate-rules)

(defun combobulate-nix-pretty-print-node-name (node default-name)
  "Pretty printer for Nix nodes"
  (pcase (combobulate-node-type node)
    ("binding" (combobulate-node-text
		(combobulate-node-child-by-field
		 (combobulate-node-child-by-field node "attrpath")
		 "attr")))))

(defun combobulate-nix-setup (_)
  (setq combobulate-navigation-context-nodes
        '("binding"))

  (setq combobulate-manipulation-envelopes nil)
  (setq combobulate-pretty-print-node-name-function #'combobulate-nix-pretty-print-node-name)
  ;; (setq combobulate-manipulation-trim-empty-lines t)

  )

(provide 'combobulate-nix)
;;; combobulate-nix.el ends here
