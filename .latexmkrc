#!/usr/bin/env perl

#$latex        = 'platex -kanji=utf8 -synctex=1 -halt-on-error -interaction=nonstopmode %S';
#$latex_silent = 'platex -kanji=utf8 -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex       = 'pbibtex';
$dvipdf       = 'dvipdfmx %O -o %D %S';
$makeindex    = 'mendex %O -o %D %S';
$max_repeat   = 5;
$pdf_mode     = 3;
  # 2 -> generates pdf via ps2pdf
  # 3 -> generates pdf via dvipdfmx

  # for sotsuron
$latex        = 'platex -kanji=utf8';
$latex_silent = 'platex -kanji=utf8';

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

$pdf_previewer = "xdg-open";
