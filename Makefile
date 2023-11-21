.PHONY: git 

all: git

# url := <URL_TO_YOUR_REPO>  # Replace with the actual URL of the Git repository
url := ssh://gitea@git.ggeta.com:2002/guangzong/ansible.git
# Generate a random string as folder name
folder := $(shell cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

git:
# Clone the repository to /tmp
	git clone $(url) /tmp/$(folder)

# Use rsync to synchronize files from the current directory to /tmp/repo
	rsync -av --delete --exclude .git/ ./ /tmp/$(folder)/
	
# set git file mode to false
	cd /tmp/$(folder) && git config core.fileMode false

# Navigate to /tmp/repo and add changes all changes to the Git repository
	cd /tmp/$(folder) && git add .

	cd /tmp/$(folder) && git commit -m "update"
	cd /tmp/$(folder) && git push

.PHONY: pc_desktop/software.yml
pc_desktop/software.yml:
	ansible-playbook -i hosts ./pc_desktop/software.yml
	
.PHONY: pc_desktop/nordvpn/start.yml
pc_desktop/nordvpn/start.yml:
	ansible-playbook -i hosts ./pc_desktop/nordvpn/start.yml

.PHONY: pc_desktop/nordvpn/stop.yml

pc_desktop/nordvpn/stop.yml:
	ansible-playbook -i hosts ./pc_desktop/nordvpn/stop.yml

