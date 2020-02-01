# Thesis

This paper has been completed and published by the University of Helsinki
at [HELDA](http://urn.fi/URN:NBN:fi-fe201804208656).

# Thesis Paper

This repository includes all the progress that has been made on my master's
thesis at the University of Helsinki. This will be mostly used as a method
for backing up progress, and as such branches and other fun things that
_should_ be used for coding projects will be mostly ignored.

## Editing/Format

This project was written entirely by myself.
As such, my own personal quirks and desires for file format are observed.
They aren't entirely listable, but should be determined easily enough.
If you are for whatever editing these files, please observe my formatting
standards as much as possible.

A quick run-down of the major points or things that can't easily be determined:
1. This was written in Vim with `tabstop=4`, but NOT `expandtab`.
2. Paragraphs are started and ended with a single line of `%%%`.
3. Each separate sentence within a paragraph is separated by a single line of
   `%`.
4. Each line is word-wrapped (often manually using colorcolumn) to 80
   characters.

## Compiling

This was compiled using pdflatex from TexLive 2016 (v.3.14159265-2.6-1.40.17)
on a Mac.

You will need to retrieve the following files from the University of Helsinki
CS department:
- babelbst.tex
- englbst.tex
- tktl.bst
- tktltiki.cls

Since I was unsure of the copying restrictions, they can be found
at: [GitHub here](https://github.com/UniversityHelsinkiTKTL/tktltiki2)

It is important to note that, if there are any Unicode characters remaining in
the final paper's contents (ÄÖÅ), the input encoding must be changed in the
class file from `latin9` to `utf8`.
