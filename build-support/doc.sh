#!/usr/bin/env bash
set -euo pipefail
scriptDir=$(cd $(dirname $0); pwd)
rootDir=$scriptDir/..

# Allow user to specify which ducttape package to use ducttape
if (( $# >= 1 )); then
    DUCTTAPE_DIR=$1
else
    DUCTTAPE_DIR=$rootDir
fi

docdir=tutorial

java -cp $DUCTTAPE_DIR/ducttape.jar ducttape.doc.DucttapeDoc ./tutorial --latex > $docdir/tutorial.tex
java -cp $DUCTTAPE_DIR/ducttape.jar ducttape.doc.DucttapeDoc ./tutorial --markdown > $docdir/TUTORIAL.md
cd $docdir
pdflatex tutorial.tex
pdflatex tutorial.tex # Get the table of contents right

echo >&2 "Tutorial documentation written to: $docdir/tutorial.pdf and $docdir/TUTORIAL.md"
