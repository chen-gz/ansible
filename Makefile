.PHONY: git

# url := <URL_TO_YOUR_REPO>  # Replace with the actual URL of the Git repository
url := ssh://gitea@git.ggeta.com:2002/guangzong/ansible.git

git:
# Clone the repository to /tmp
	git clone $(url) /tmp/repo

# Use rsync to synchronize files from the current directory to /tmp/repo
	rsync -av --delete --exclude .git/ ./ /tmp/repo/
	
# set git file mode to false
	cd /tmp/repo && git config core.fileMode false

# Navigate to /tmp/repo and add changes all changes to the Git repository
	cd /tmp/repo && git add .

# Navigate to /tmp/repo and commit the changes
	cd /tmp/repo && git commit -m "update"

# Navigate to /tmp/repo and push the changes to the remote repository
	cd /tmp/repo && git push
