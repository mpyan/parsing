# parser.rb
To run the parser, use the following command:  
`$ ruby parser.rb constitution.txt`
## Output
When the above command is run, the output will be as follows:
```
$ ruby parser.rb constitution.txt
all: 872    7652   45119 constitution.txt
proper: 872    6030   40737
Total Articles: 7
Total Sections: 21
Total Sections per Article:
    Article 1: 10
    Article 2: 4
    Article 3: 3
    Article 4: 4
    Article 5: 0
    Article 6: 0
    Article 7: 0
```
The `all` line lists the total number of lines, words, and charaters in the document.  
The `proper` line lists the same information as the `all` line, but ignoring the following list of words (case-sensitive):
- “I”, “We”, “You”, “They”
- “a”, “and”, “the”, “that”
- “of”, “for”, “with”

For the purpose of counting characters, the whitespaces associated with the ignored words are left untouched and are included in the final count.

The `Total Articles` line lists the total number of **Articles** found in the file, where an "Article" is defined as a block of text with a line heading in the format "Article *N*." where *N* is the article number.

The `Total Sections` line lists the total number of **Sections** found in the file, where a "Section" is defined as a block of text with a line heading in the format "Section *N*" where *N* is the section number.


_**Note:** By the above definition of a "Section", Articles consisting solely of a block of text **without** "Section" headers are considered as having **ZERO "Sections"**, as these blocks of text have not been labeled as "Sections"._

The `Total Sections per Article` line lists the total number of **Sections** found in each Article, using the definitions of "Article" and "Section" outlined above.
