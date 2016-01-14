#!/bin/bash
# Converts md file to HTML and adds some css.

if [ $# -eq 0 ]
  then
    echo "A file name needs to be specified as argument."
    exit 1
fi
cssfile='buttondown.css'

# Check if css file exists
if [ ! -f $cssfile ]; then
    echo "File $cssfile not found. Downloading."
    curl -O 'https://gist.githubusercontent.com/ryangray/1882525/raw/2a6e53f645b960f0bed16d686ba3df36505f839f/buttondown.css'
fi

mdfile=$1'.md'
file=$1'.html'

echo ' Converting using pandoc.'
# Table of contents, mathjax, css file, output to .html file.
pandoc $mdfile --toc --mathjax -c $cssfile -o $file
echo " Created $file"

echo ' Add container div after body tag.'
sed -i.bak "s/<body>/<body><div class='container'>/" $file
sed -i.bak "s#</body>#</body></div>#" $file

echo ' Add rule to css file.'
echo '.container { width: 800px; margin: 20px auto; }' >> $cssfile

