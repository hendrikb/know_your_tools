# screen vs. tmux

screen and tmux are terminal multiplexers

---

# WTF is a terminal multiplexer?

> A terminal multiplexer is a software application that can be used to multiplex several virtual consoles, allowing a user to access multiple separate terminal sessions inside a single terminal window or remote terminal session.

-- Wikipedia

(... still, WTF?)

---
## Advantages

* **Multiple Windows**: Open ONE terminal session (e.g. via SSH login) but have MULTIPLE 'windows'
* **Persistence**: Keep terminal sessions OPEN while you log out of the system or lose the connection
* **Session Sharing**  with multiple users

---
## Disadvantages

* Need to learn a bunch of keystrokes
* Occasional issues with terminal-related mechanisms (e.g. colors) or scripts
* Working with scroll buffers and clipboard often a pain
* Tending to "forget" running applications in screens (?)

---

# GNU screen

* GPL licensed, originally from 1987
* state of the art, does its job
* still under active development, current version 4.2.1    

---

## GNU screen: typical use case

```
$here> ssh web1@myhost.eu
  # start new screen session,
$myhost> screen 
  # screen turns blank
$myhost> make --some=stuff --foo --bar
  # [ ... ] long running programm
  # ... SSH connection breaks down ... 
$here> ssh web1@myhost.eu
  # pick up running screen session from the background
$myhost> screen -r
  # [ ... ] you see output of make command above; wait...
  # later: exit screen
$myhost> exit
  # close SSH connection
$myhost> exit
```

---

## GNU screen: important key strokes
There's a bazillion of keystrokes INSIDE a running screen session: 

```
man screen
```

* Ctrl-a and then c → create a new, empty window
* Ctrl-a and then N → go to N'th window
* Ctrl-a and then A → set a name for this window (e.g. "download")
* Ctrl-a and then " → show+navigate list of windows in a screen session
* Ctrl-a and then d → detach from current screen session


---

## GNU screen: further features
* Join other user's running screen session and start typing there (or just watch)
* Log contents of a screen to a log file
* Multiple "clipboard buffers"
* Split a window vertically/horizontally
* ...

---

# tmux

* contains most features of GNU screen, but is BSD licensed
* richer feature set
* but not a drop-in replacement since keystrokes and commands are different

---

## Differences to GNU screen

* some vi like commands
* link/rearrange windows between tmux sessions
* "menues" to select from sessions, windows or clients

---
## tmux: important key strokes

* Ctrl-b and then c → create a new, empty window
* Ctrl-b and then N → go to N'th window
* Ctrl-b and then , → set a name for this window (e.g. "download")
* Ctrl-b and then d → detach from current screen session
* Ctrl-b and then " → split pane into top and bottom panes
* Ctrl-b and then % → split pane into left and right panes
* Ctrl-b and then o → change to the next pane
* Ctrl-b and then t → show a huge clock :)

---

## tmux: scriptable
tmux is heavily scriptable from the "outside"

```
tmux new-session -d 'vim /etc/passwd' \;
  split-window -d \;
  attach
```

---

## tmux DEMO

---

# fin
go and learn stuff, read the man pages - and start with tmux

---

# Hint: markdown to impress

<a
href='https://raw.githubusercontent.com/hendrikb/know_your_tools/master/screen_vs_tmux.md'>This document</a> is originally written in <a href='http://daringfireball.net/projects/markdown/'>markdown</a> but can be rendered into an
<a href="http://bartaz.github.io/impress.js/">impress.js</a> presentation using <a
href="https://github.com/egonSchiele/mdpress">mdpress</a>
