# Know your Tools!

  * the command line is the fastest way to command a computer
  * know core functionalities of frequently used command line tools!
  * there are tools for everything, but finding the right one can be hard

---
# In Essence

  * UNIX tool philosophy: do one thing and do it right
  * everything is solvable in different ways, but it shouldn't always be ruby!

---
# GREP

  The grep utility searches any given input files, selecting lines that match
  one or more patterns.

There are loads of grep variants:

  * egrep - supports extended regex - use this!
  * fgrep - fast regex implementation - but limited regex set!
  * zgrep/zegrep/zfgrep - same as above, but can read zipped input files!

... who knew?

---
## Read the docs: man grep

grep supports a quinquadecillion nice options, see the man page - examples:

  * ```--only-matching```
  * ```--color``` (really nice to "build" regular expressions from scratch)
  * ```--files-with-matches```
  * ```--invert-match``` (really nice "detour" for hard regular expressions. build a simple one and only print lines that DO NOT match it)

---
## Some real-life grep usage examples

  * WAY cooler than most ack/ag usage: ```vim `egrep -irl 'buyer_name' *` ```
  * Just give me the email addresses: ```egrep --only-matching '[^;]+@[^;]+' customers.csv```
  * I know a fact, and want lines that do not match the fact...: ```egrep -v '[^;]+@[^;]+' receipients.csv > wrong_emails```

---
# tr - translate characters

  * Does anybody here know about this tool?
  * Input -> Processing -> Output    (Captain Obvious to the rescue!)

---
## Examples

  * ```tr -cs "[:alpha:]" "\n" < file1``` -> Create a list of the words in file1, one per line
  * ```tr "[:lower:]" "[:upper:]" < file1``` -> Translate the contents of file1 to upper-case.
  * ```tr -cd "[:print:]" < file1``` -> Strip out non-printable characters from file1.
  * ```tr "[=e=]" "e"``` -> Remove diacritical marks from all accented variants of the letter 'e':

---
# sed - stream line editor

  * reads input line by line and processes it with respect to a given list of commands
  * very common: search-and-replace with regex: ```sed 's/Karl-Marx-Stadt/Chemnitz/i' cities.txt > out.txt```
  * BUT, the list of commands is VERY BIG, yet, easy: ```sed -n '30,35p' mail.rb```

To make sure, you got me right:

  **sed is a full featured text editor - without a GUI!**


---
# cut | sort | uniq

  * cut
    * treat text input file as a 'table' and only print certain columns
    * ```cut -f 3,4 -d';' mailings.csv``` => print third and fourth columns of mailings.csv (where fields are seperated by a semicolon)
  * sort
    * take all input and sort it... (oh wow)
    * BUT, see man sort to get an idea how powerful GNU sort is!
    * ```sort -k2 -t';' -f -M -r email_dates.csv``` this reverse-sorts lines in email_dates.csv (with ; as seperator) with respect to (case-insensitive) month names!
  * uniq
   * read all input at once and collaps repeating lines *there* to one line *here*
   * ```echo -e 1\\n1\\n2 | uniq```

---
These tools are often used together! E.g.:

```
# print uniq email addresses from mailings.csv
# (where email addresses are in the CSV's 1st column)

grep '@' mailings.csv | cut -f1 -d';' | sort | uniq 
```

---
# wc

  * "word count" - but generally counts file size, words, lines, ...
  * great way to verify filtering results
    * e.g. "After UNIQing email addresses there should be fewer lines in the output file than in the input file..."



---
# AWK

  * but AWK is GREAT for data/text file processing
  * is a scripting language that applies logic to each line of a data file
  * AWK is a VERY SIMPLE language, the only THING is the kinda unusual way of processing input!

---
## Real World AWK example:

```
#!/usr/bin/env awk -f

BEGIN {  FS=";" }

{
  email = tolower($1)
  if (length(emails[email]) == 0) {
    print $0
  }
  emails[email] = "already seen"
}
```

---
# To be continued

USE your shell!

 * ```tail -f```
 * ```head```
 * ```for file in * ; do echo $file ; done```
 * ```alias s='git status'```
 * ...
