#! /usr/local/bin/csi -s
;;; recipes.scm --- Cookbook generator

;; Copyright 2013, Nicholas M. Van Horn

;; Author: Nicholas M. Van Horn <vanhorn.nm@gmail.com>
;; Keywords: recipes cookbook scheme chicken
;; Version: 1.0

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA. (or visit http://www.gnu.org/licenses/)
;;

;;; Commentary:

;;; This program creates a LaTeX file which, when compiled using
;;; standard LaTeX tools (and with the proper style files, etc.), will
;;; create a pleasing pdf cookbook containing the recipes found in the
;;; accompanying "cookbook.scm" file.

;;; ----------------------------------------

(require-extension srfi-13 s args)

;;; Defaults
(define default-dir "./")
(define default-outfile "cookbook.tex")

;;; Load the recipe database. This creates a list called "cookbook"
(load "cookbook.scm")

(define (unique mylist)
      (cond
       ((null? mylist) '())
       ((member (car mylist) (cdr mylist)) (unique (cdr mylist)))
       (else (cons (car mylist) (unique (cdr mylist))))))

;;; Given an valid recipe alist key ("cat", "title", etc.) and a
;;; recipe database, this will return a list of unique alist values
;;; matching that key name. e.g., (unique-values "cat" recipes)
(define (unique-values key mylist)
  (unique (map (lambda (x) (cdr (assoc key x))) mylist)))

;;; For a given recipe category cat, return all recipes of that type
;;; in mylist.
(define (filter-by-cat cat mylist)
  (cond ((null? mylist) '())
	(else
	 (let ((currcat (cdr (assoc "cat" (car mylist)))))
	   (if (string=? (string-downcase cat) (string-downcase currcat))
	       (cons (car mylist) (filter-by-cat cat (cdr mylist)))
	       (filter-by-cat cat (cdr mylist)))))))

;;; Pretty-print preparation instructions
(define (print-prep myrecipe)
  (let ((prep (cdr (assoc "prep" myrecipe))))
    (for-each print prep)))

;;; Pretty-print ingredient list
(define (print-ing myrecipe)
  (let ((ing (cdr (assoc "ing" myrecipe))))
    (print "")
    (for-each (lambda (x)
		(let ((mytitle (cdr (assoc "title" x))))
		  (if (not (s-blank? mytitle))
		      (display (format "\n~A\n\n" mytitle)))
		  (for-each (lambda (y)
			      (display (format "~A\t~A\n"
					       (car y)
					       (cadr y))))
			    (cdr (assoc "ing" x)))))
	      ing)))

;;; This is just a helper function. Given a list of strings, this
;;; prints strings one-per-line with a unique numer at the
;;; beginning. Essentially this just pretty-prints lists with
;;; numbering. 
(define (numbered-list mylist)
  (let ((count 1))
    (for-each
     (lambda (x)
       (print (format "(~A) ~A" count x))
       (set! count (+ count 1)))
     mylist)))

;;; Given a list of recipes and a number "num", this returns the
;;; num-th recipe from the list
(define (get-recipe myrecipes num)
  (if (> num (length myrecipes))
      (print "Too large")
      (begin
	(define (recipe-by-num mylist counter)
	  (if (eq? counter num) (car mylist)
	      (recipe-by-num (cdr mylist) (+ counter 1))))
	(recipe-by-num myrecipes 1))))

;;; Find recipe by keywords
(define (recipe-by-keyword keyword myrecipes)
  (define (match-title mykeyword mytitles)
    (cond ((null? mytitles) '())
	  (else
	   (if (s-contains? mykeyword (cdr (assoc "title" (car mytitles))) #t)
	       (cons (car mytitles) (match-title mykeyword (cdr mytitles)))
	       (match-title mykeyword (cdr mytitles))))))
  (let ((all-matches (match-title keyword myrecipes)))
    (if (equal? 1 (length all-matches))
	(car all-matches)
	(let ((matching-titles (unique-values "title"  all-matches)))
	  (numbered-list matching-titles)
	  (display "\nChoose your intended recipe by number: ")
	  (let ((target-recipe (string->number (read-line))))
	    (get-recipe all-matches target-recipe))))))

;;; Write latex header for cookbook to port. outport is assumed to be
;;; opened already, and closed by another procedure later
(define (cookbook-header header-file-path outport)
  (let ((header (read-lines header-file-path)))
    (for-each (lambda (x) (write-line x outport)) header)))

;;; Write latex footer for cookbook to port. outport is assumed to be
;;; opened already, and closed by another procedure later
(define (cookbook-footer footer-file-path outport)
  (let ((footer (read-lines footer-file-path)))
    (for-each (lambda (x) (write-line x outport)) footer)))

;;; This converts an individual recipe to appropriate latex source,
;;; and writes the result to file. outport is assumed to be opened
;;; already, and closed by another procedure later
(define (cookbook-recipe myrecipe outport)
  (write-line "\\begin{recipe}" outport)
  (write-line "[ %" outport)
  (if (s-blank? (cdr (assoc "preptime" myrecipe)))
      (write-line " preparationtime," outport)
      (write-line (sprintf " preparationtime = {~A},"
			   (cdr (assoc "preptime" myrecipe))) outport))
  (if (s-blank? (cdr (assoc "baketime" myrecipe)))
      (write-line " bakingtime," outport)
      (write-line (sprintf " bakingtime = {~A},"
			   (cdr (assoc "baketime" myrecipe))) outport)))

;;; Convert all recipes in a given list into individual latex code
;;; blocks, suitable for inclusion between the latex header and footer
;;; code generated by cookbook-header and cookbook-footer. The heavy
;;; lifting is done by cookbook-recipe
(define (recipes-to-latex recipes outport)
  (for-each (lambda (x) (cookbook-recipe x outport)) recipes))

;;; Export cookbook. This calls all the necessary procedures to
;;; generate the latex source for the cookbook.
(define (cookbook-to-latex recipes outfile header-file footer-file)
  ;; open output file
  (let ((outport (open-output-file outfile)))
    ;; Insert latex header
    (cookbook-header header-file outport)
    ;; Insert each recipe 
    (recipes-to-latex recipes outport)
    ;; Insert latex footer
    (cookbook-footer footer-file outport)
    ;; Close the port
    (close-output-port outport)))

;;; The following list contains all defined command line options
;;; available to the user. For example, (h help) makes all of the
;;; following equivalent options available at runtime: -h, -help, --h,
;;; --help. These are used by the "args" egg.
(define opts
  (list (args:make-option (c cookbook) #:none "Export cookbook"
			  (export-cookbook))
	(args:make-option (h help)   #:none "Help information"
			  (usage))))

;;; This procedure is called whenever the user specifies the help
;;; option at runtime OR whenever an unexpected command line option or
;;; operand is passed to this script.
(define (usage)
 (with-output-to-port (current-error-port)
   (lambda ()
     (print "Usage: cookbook [options...]")
     (newline)
     (print (args:usage opts))
     (print "dvr prints a recursive list of all video files")
     (print "available in [directory]. By including the -d option,")
     (print "dvr allows for interactive deletion of video files.")
     (print "'Deleted' files are moved to the trash.\n")
     (print "dvr treats collections of related files as a single unit.")
     (print "Accompanying files (such as subtitle and info files)")
     (print "are sent to the trash as well for a given video file.\n")
     (print "Videos can be played (by the system default player) by")
     (print "including the -p option. An interface will allow for")
     (print "interactive selection for choosing videos to watch.\n")
     (print "Example 1: dvr ~/Videos")
     (print "Example 2: dvr ~/Videos -p")
     (print "Example 3: dvr ~/Videos/television -d\n")
     (print "Report bugs to vanhorn.nm at gmail.")))
 (exit 1))



;;; This gets things done. If you run this with no command line
;;; options, your available files are printed to the screen. Including
;;; options opens up other possibilities.
(receive (options operands)
    (args:parse (command-line-arguments) opts)
  (handle-exceptions exn (usage) (main)))
