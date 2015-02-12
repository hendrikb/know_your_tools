# Git Workshop
## Intro - why git?

  Git is a **distributed revision control system** with an emphasis on speed, data integrity, and support for distributed, non-linear workflows.[8] Git was initially designed and developed by Linus Torvalds for Linux kernel development in 2005, and has since become the most widely adopted version control system for software development.[9]

  As with most other distributed revision control systems, and unlike most client–server systems, every Git working directory is a full-fledged repository with complete history and full version-tracking capabilities, independent of network access or a central server. 
  
  -- Wikipedia (English): git


## Theory

finally figuring out that git commands are strangely named graph manipulation commands--creating/deleting nodes, moving pointers around
 -- Kent Beck https://twitter.com/kentbeck/status/42657237986054144




Graphic:

| Reposotory |
| Stage |
|Workding Dir|




--
# Getting Started

## Setup and Git configuration

sudo apt-get install git tig
git config
ssh-key-gen -b 4096 -C'your@example.com'




git init


git status
git add
git rm
git mv
git commit
https://xkcd.com/1296/


git remotes

git clone
git pull
git push

git reset
git revert



git branches

git gets easier once you get the basic idea that branches are homeomorphic endofunctors mapping submanifolds of a Hilbert space. -- https://twitter.com/tabqwerty/status/45611899953491968


git checkout

git merge

git rebase


git instaweb

Specials & best practices

  * git add -p
  * git stash
  * git aliases
  * git commit --amend
  * git cherry-pick
  * git instaweb --http=webrick
  

## Lost? Git Help!

  * The officials: http://git-scm.com/   -- "ProGit" book
  * Visual guides to git: http://marklodato.github.io/visual-git-guide/index-en.html
  * Git Goodies: http://tokkee.org/talks/froscon12-git-goodies.pdf
  * Git Einführung: http://www.linuxtag.org/2013/fileadmin/www.linuxtag.org/slides/Julius_Plenz_-_Git-Einfuehrung.e141.pdf
