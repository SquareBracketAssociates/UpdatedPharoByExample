# -*- mode: perl; -*-
$pdflatex = 'lualatex --file-line-error %O %S';
$pdf_mode = 1;

# extract git version info before each compile
system('./gitinfo2.sh > gitHeadLocal.gin');

@default_files = ( 'sbabook' );
