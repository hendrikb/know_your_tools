# Know your Tools!

  * the command line is the fastest way to command a computer
  * know core functionalities of frequently used command line tools!
  * there are tools for everything, but finding the right one can be hard

---
# In Essence

  * UNIX tool philosophy: do one thing and do it right
  * everything is solvable in different ways, but it shouldn't always be ruby!

---
# grep

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
  * ```--color```<br />→ helps you to "build" regular expressions from scratch
  * ```--files-with-matches```
  * ```--invert-match```<br />→ really nice "detour" for hard regular expressions. build a simple one and only print lines that DO NOT match it

---
## Some real-life grep usage examples

  * ```vim `egrep -irl 'buyer_name' *` ```<br />→ WAY cooler than most ack/ag usage
  * ```egrep --only-matching '[^;]+@[^;]+' customers.csv``` <br />→ Just give me the email addresses
  * ```egrep -v '[^;]+@[^;]+' receipients.csv > wrong_emails```<br />→ I know a fact, and want lines that do not match the fact...

---
# tr - translate characters

  * Does anybody here know about this tool?
  * Input → Character Processing → Output    (Captain Obvious to the rescue!)

---
## Examples

*All taken from ```man tr```*

  * ```tr -cs "[:alpha:]" "\n" < file1``` <br />→ Create a list of the words in file1, one per line
  * ```tr "[:lower:]" "[:upper:]" < file1``` <br />→ Translate the contents of file1 to upper-case
  * ```tr -cd "[:print:]" < file1``` <br />→ Strip out non-printable characters from file1
  * ```tr "[=e=]" "e"``` <br />→ Remove diacritical marks from all accented variants of letter e

---
# sed - stream line editor

  * reads input line by line and processes it with respect to a given list of commands
  * ```sed 's/Karl-Marx-Stadt/Chemnitz/i' cities.txt > out.txt```<br />→ very common: search-and-replace with regex
  * ```sed -n '30,35p' mail.rb```<br />→ BUT, the list of commands is VERY BIG, yet, easy

---
To make sure, you got me right:

  * sed is a **full featured** text editor - **without a GUI!**
  * Commands are similar to Vim - they all have the same roots (see: <a
    href="http://blog.sanctum.geek.nz/actually-using-ed/">Blog Post: Actually
    Using ED</a>)


---
# cut | sort | uniq

## cut
  * treat text input file as a 'table' and only print certain columns
  * excellent for cutting down CSV files!
  * ```cut -f 3,4 -d';' mailings.csv``` <br /> → print third and fourth columns of mailings.csv (where fields are seperated by a semicolon)

---
## sort
  * take all input and sort it... (oh wow)
  * BUT, see ```man sort``` to get an idea how powerful GNU sort is!
  * ```sort -k2 -t';' -f -M -r email_dates.csv``` <br />→ this reverse-sorts lines in email_dates.csv (with ; as seperator) with respect to (case-insensitive) month names!

---
## uniq
read all input at once and collaps repeating lines *there* to one line *here*

```
[16:06] ✔ hendrik code → echo -e 1\\n1\\n2
1
1
2
[16:06] ✔ hendrik code → echo -e 1\\n1\\n2 | uniq
1
2
```

---
These tools are often used together! E.g.:

```
# print uniq email addresses from mailings.csv
# (where email addresses are in the CSV's 1st column)

grep '@' mailings.csv | cut -f1 -d';' | \
tr "[:upper:]" "[:lower:]" | sort | uniq 
```

---
# wc

  * "word count" - but generally counts file size, words, lines, ...
  * great way to verify filtering results
    * e.g. "After grep'ing email addresses there should be **fewer** lines in the output file than in the input file..."

```
[16:55] ✔ hendrik code → wc -l mailings.csv
72654 mailings.csv
[16:55] ✔ hendrik code → grep '@' mailings.csv | wc -l
48436
```

---
# AWK

  * AWK is GREAT for data/text file processing, e.g. CSV
    * scripting language that applies logic to **each line** of a data file
    * pre- and postprocessing is possible
  * AWK has a very simple syntax, the only THING is the kinda unusual way of processing input!
  * Bonus: AWK is VERY FAST!

---
## Real World AWK example:

```
#!/usr/bin/env awk -f

BEGIN {  FS=";" }

{
  # email addresses are in first column of CSV!
  email = tolower($1)
  if (length(emails[email]) == 0) {
    print $0
  }
  emails[email] = "already seen"
}

END {
  print "I saw " length(emails) " unique email addresses"
}
```

---
# To be continued

USE your shell!

 * ```tail -f```
 * ```head```
 * ```for file in * ; do echo $file ; done```
 * ```alias s='git status'```
 * Pipe your outputs a lot from command to command, no disk utilization needed!
 * Modify your PS1 prompt to immediately see git repository status or exit
   codes:<br />```[14:10] ✔ hendrik [master *] know_your_tools → ...```
 * ... and read the ```man``` pages

---
# To be continued II

* learn for yourself how awesome ```screen``` is: ```man screen```
* another nice monitoring tool is ```watch```<br />```watch -n1 date```
* Run previous commands quicker with a bang:<br />

```
[17:09] ✔ hendrik code → date +%H:%M:%S
17:09:59
[17:09] ✔ hendrik code → echo something different
something different
[17:10] ✔ hendrik code → !da
date +%H:%M:%S
17:10:05
```

---
# Hint: markdown to impress

<a
href='https://raw.githubusercontent.com/hendrikb/know_your_tools/master/unix.md'>This document</a> is originally written in <a href='http://daringfireball.net/projects/markdown/'>markdown</a> but can be rendered into an
<a href="http://bartaz.github.io/impress.js/">impress.js</a> presentation using <a
href="https://github.com/egonSchiele/mdpress">mdpress</a>
