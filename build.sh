
# Pdflatex
PDFLATEX='xelatex -interaction=nonstopmode -shell-escape -file-line-error'
GREP='grep ".*:[0-9]*:.*"' # показывает на выходе только ошибки

# Файлы/Папки
PDF_NAME='document.pdf'
TEX='tex'
IMG='tex/inc/img'
MAINTEX='report'

# Сборка latex
cd tex
$PDFLATEX $MAINTEX > /dev/null
BIBOUTPUT=$(bibtex $MAINTEX)
# Показывать output bibtex'a только в случае ошибок
if [[ "$BIBOUTPUT" =~ "error" ]]; then
    echo "$BIBOUTPUT"
fi
$PDFLATEX $MAINTEX > /dev/null
$PDFLATEX $MAINTEX

cp $MAINTEX.pdf ../$PDF_NAME
cd ..

# Clear

RM=rm
find $TEX/ -regextype posix-egrep -type f ! -regex ".*\.(sty|tex|clo|cls|bib|bst|gitignore)" -exec $RM {} \; ;
