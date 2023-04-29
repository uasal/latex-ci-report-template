git submodule update --recursive --remote


# convert markdown and restructured text into tex
shopt -s globstar nullglob
for f in **/*.md
#for f in find * -type f -name '*.md'
do
    echo " running pandoc on $f "
    pandoc "$f" -o "${f%.md}.tex"
done

for f in **/*.rst

do
    echo " running pandoc on $f "
    pandoc "$f" -o "${f%.rst}.tex"
done

pandoc "pearl_requirements/dist/L2.markdown" -o "pearl_requirements/dist/L2.tex"
# setup gitinfo
sed -i -e 's/\r$//' gitinfo2-hook.sh
./gitinfo2-hook.sh

# compile .tex file
xelatex instrument_guide.tex
makeindex instrument_guide.glo -s instrument_guide.ist -t instrument_guide.glg -o instrument_guide.gls
bibtex instrument_guide
xelatex instrument_guide.tex
xelatex instrument_guide.tex
