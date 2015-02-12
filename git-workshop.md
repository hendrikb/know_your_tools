# Git Workshop

---

# Intro - why git?

* **distributed revision control system**
* initially designed and developed by Linus Torvalds for Linux kernel development in 2005
* most widely adopted version control system for software development

* unlike most client–server systems, every Git working directory is a full-fledged repository with complete history and full version-tracking capabilities
* independent of network access or a central server

---

# Theory

> finally figuring out that git commands are strangely named graph manipulation commands--creating/deleting nodes, moving pointers around
> -- Kent Beck https://twitter.com/kentbeck/status/42657237986054144

---

## Workflow

```
| Reposotory |
| Stage |
|Workding Dir|
```

---

## Branches

> git gets easier once you get the basic idea that branches are homeomorphic endofunctors mapping submanifolds of a Hilbert space.
> -- https://twitter.com/tabqwerty/status/45611899953491968

---

## Remotes

Remotes are "other repositories" serving basically the same code base

Often seen:
  * "*origin*", services our code centrally
    are working on
  * "*upstream*", services as original code base when we are working on a fork

---

#  Now, git your hands dirty!

---

## Prerequesites (on Ubuntu)

```
sudo apt-get install git openssh-client
ssh-key-gen -b 4096 -C'your@example.com'
```

---

## Configuring Git

```
git config --global user.name 'Your Name'
git config --global user.email 'your.email@example.com'
```

---

## Basic Commands

```
git help
```

---

```
git init
git status
```

---

## Stuff to stage ...

```
git add
git rm
git mv
```

---

## From Stage to Repository

```
git commit
```

https://xkcd.com/1296/

Variants:

```
git commit -m'use describing message'
git commit -am'go from working dir to repo directly'
```

Pro Tip: https://github.com/erlang/otp/wiki/Writing-good-commit-messages

---

## Undo things

Warning, there be dragons ahead!

```
git reset
git revert
```

---

# Branches, Merges, Conflicts, ...

```
git branches

git checkout

git merge

git rebase

```

---

# Working with remote repositories

```
git remotes
git clone

git pull
git push
```

---

# Specials & best practices

  * git stash
  * git aliases
  * git commit --amend
  * git cherry-pick
  * git instaweb --http=webrick

https://github.com/erlang/otp/wiki/Writing-good-commit-messages

---

# Lost? Git Help!

  * The officials: http://git-scm.com/   -- "ProGit" book
  * Visual guides to git: http://marklodato.github.io/visual-git-guide/index-en.html
  * Git Goodies: http://tokkee.org/talks/froscon12-git-goodies.pdf
  * Git Einführung: http://www.linuxtag.org/2013/fileadmin/www.linuxtag.org/slides/Julius_Plenz_-_Git-Einfuehrung.e141.pdf

---

# Questions?
