#!/usr/local/bin/python
from bs4 import BeautifulSoup

import sys

preadress = "http://www.pm.lth.se/"

filename = sys.argv[1]
# print "Opening file " + filename

file = open(filename, "r")

soup = BeautifulSoup(file, 'html.parser')

for link in soup.find_all("a"):
    print preadress + link.get("href")

# use '> output.txt' to save to file
# And then use wget -i output.txt


