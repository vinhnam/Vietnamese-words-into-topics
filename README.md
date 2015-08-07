# Vietnamese-words-into-topics.
A small project I've started while learning Big Data. It has no real purpose other than educational.

# Current Process are: 
1. Download vietnamese wiko dump file.

2. using wikiextractor (python) to remove wiki code. result at:
https://drive.google.com/open?id=0B321EOsFcy2YNnJHMDNLaVVaMm8

3. Convert XML escape characters to UTF-8 using php:
https://drive.google.com/open?id=0B321EOsFcy2YMHVfUGJSTUpRNG8

4. Tokenizer wiki plain text. Tokenized file uploaded at:
https://drive.google.com/open?id=0B321EOsFcy2YeVZyZFJfTW1sdWM 
Compound word are connected by underscore. 
Feel free to create a xml tokenized file yourself, just be aware that it gonna take really long without hadoop.

5. using word2vector to generate the vector. Binary file already here, we still need a text file
https://drive.google.com/open?id=0B321EOsFcy2YRl9FLXpxeWpzOE0

 .....to be continued ... 
# Some friends of us can be named.
https://www.mediawiki.org/wiki/Alternative_parsers

https://www.wiwiki-20150702-pages-meta-current.xml.bz2 

https://www.emeditor.com/download/

http://mim.hus.vnu.edu.vn/phuonglh/softwares/vnTokenizer

https://code.google.com/p/word2vec/
