# Copyright 2026 Petr Socha
# 
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3c
# of this license or (at your option) any later version.
# The latest version of this license is in
# https://www.latex-project.org/lppl.txt
# and version 1.3c is part of all distributions of LaTeX
# version 2008 or later.
# 
# This work has the LPPL maintenance status `maintained'.
# The Current Maintainer of this work is Petr Socha.
# Maintenance and bug reports: https://github.com/petrsocha/pslib-latex/issues
# 
# The components of this work are listed in MANIFEST.txt.
# The school logo is a separately licensed third-party asset.

# SPŠ a VOŠ Liberec — optimalizace prvního překladu (latexmk).
# BibLaTeX zapisuje do souboru main.run.xml pomocne stavove radky
# (aktivace Biberu). Jejich prepinani muze vyvolat CTVRTY zbytecny
# pruchod LaTeXu. LaTeXmk jiz pritom sleduje obsah .bcf a .bib,
# na nichz skutecne zavisi aktualizace bibliografie.
#
# Ignorujeme pouze stavove radky BibLaTeXu, nikoliv obecne soubory XML.
$hash_calc_ignore_pattern{'xml'} = '^\s*<(?:internal|external) package="biblatex" priority=';

# TeXcount spoustime jednou pri startu latexmk, ne jednou pri kazdem
# pruchodu pdflatexu. Funguje i bez -shell-escape a pri jobname=output.
# V souboru aktualizujeme obsah jen pri zmene poctu slov.
my $pocet = qx(texcount -1 -sum -merge -q main.tex);
if ($? == 0 && $pocet =~ /^\s*(\d+)\s*$/) {
  my $novy = $1;
  my $stary = '';
  if (open(my $reader, '<', 'pocet-slov.tex')) {
    local $/;
    $stary = <$reader>;
    close($reader);
  }
  if ($stary ne "$novy\n") {
    open(my $writer, '>', 'pocet-slov.tex') or die "Nelze ulozit pocet-slov.tex: $!";
    print {$writer} "$novy\n";
    close($writer);
  }
} else {
  warn "TeXcount nebylo mozne spustit; pocet slov nemusi byt aktualni.\n";
}
