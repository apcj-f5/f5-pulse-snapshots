REPO_URLS=\
		https://github.com/f5devcentral/f5-automation-labs.git \
		https://github.com/f5devcentral/vscode-f5.git

rank:
	node tools/git-pulse-rank.js

clones:
	mkdir build || true; \
	cd build; \
	for url in $(REPO_URLS); do \
		git clone $$url || true; \
	done

snapshots:
	cd build; \
	for dir in */; do \
		cd $$dir && git pull && time bash ../../tools/git-pulse; \
		cp *-pulse.* ../..; \
		cd ..; \
	done;

