# Know your Tools!

  * the command line is the fastest way to command a computer
  * know core functionalities of frequently used command line tools!
  * there are tools for everything, but finding the right one can be hard

# In Essence

  * UNIX tool philosophy: do one thing and do it right
  * everything is solvable in different ways, but it shouldn't always be ruby!

# GREP

  The grep utility searches any given input files, selecting lines that match
  one or more patterns.

There are loads of grep variants:

  * egrep - supports extended regex - use this!
  * fgrep - fast regex implementation - but limited regex set!
  * zgrep/zegrep/zfgrep - same as above, but can read zipped input files!

##  man grep

grep supports a quinquadecillion nice options, see the man page - examples:

  * only-matching
  * color (nett zum Regex aufbauen!)
  * files-with-matches
  * invert-match


## typical grep usage examples

```egrep -irl 'buyer_name' * | xargs vim```

```egrep --only-matching '[^;]+@[^;]+' empf.csv```

```egrep -v '[^;]+@[^;]+' empf.csv > wrong_emails```

# tr

'Translate characters'
Eingabe → Ersetzung (Löschung, ...) → Ausgabe
Einzelne Wörter/Zeichen können verarbeitet werden
echo 'Hallo Welt' | tr [a-z] [A-Z]





liest Input zeilenweise und bearbeitet ihn entsprechend angegebener Kommandos
Kommandos sind sehr vielfältig & mächtig → man sed … Google!
Besonders für schnelle Ersetzungen geeignet:

sed 's/berlin/Berlin/i' ortsnamen.txt > out.txt
To give you an Idea:
sed -n '30,35p' mail.rb


cut | sort | uniq


xargs


wc



AWK



