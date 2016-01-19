all: bash-insights git-workshop ruby-prof screen_vs_tmux unix

bash-insights: bash-insights.md
	mdpress bash-insights.md

git-workshop: git-workshop.md
	mdpress git-workshop.md
	cp -rf images git-workshop

ruby-prof: ruby-prof.md
	mdpress ruby-prof.md

screen_vs_tmux: screen_vs_tmux.md
	mdpress screen_vs_tmux.md

unix: unix.md
	mdpress unix.md

