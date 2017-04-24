## merge repo into another one
- i often have a repo full of lessons, scripts or disjointed things that don't need to be built like a package
- easy because only master branch, and no other users have accessed the repo
- in this case, i wanted to bring private sql development scripts into a shared repo for work
- I wanted to:
      + change the author/commit names and emails to my new login
      + merge an old repo into a new one that would be hosted at new employer
      + all the old files history and commits must come too

###### rsrc
[change a repo author information](https://help.github.com/articles/changing-author-info/)

### voight-kampff
steps:
1. set up new repo on host site
  + repo permissions, ownership, etc.
2. clone the repo to local machine
3. examine config of new repo
4. change author/committer names/emails from old repo
  + following step from github 

#### 1. set up new repo via UI
#### 2. clone new repo to local machine
```bash
git clone ssh://git.newcompany/repo/new_repo

# note the configurations of the git folder
cd new_repo
less .git/config
-- less_view settings---
git config --list --local # another way to look at git settings

git remote -v 
origin      ssh://git.newcompany/repo/new_repo (fetch)
origin      ssh://git.newcompany/repo/new_repo (push)

# we are going to use this remote to push our old repo branch
```

test: let's work on a file and commit it

```bash
echo "this is a foo-file" > foo-repo-test.md
git add foo-repo-test.md
git commit -m 'added foo to this mess'
git push origin mainline

# have a look at the upstream hosted repo, file was pushed
```

#### 3. examine new repo configs

#### 4. modify old repo author data
the github tutorial from RSRC above is used here

```bash
git clone --bare https://github.com/repo/tannhauser.git           # no working directory
cd tannhauser.git
git config --list

# this command transforms the repo
# this changed version assumes there was only one author on the repo
git filter-branch --env-filter 'export GIT_COMMITTER_NAME="newname"; export GIT_COMMITTER_EMAIL="login@company.com"; export GIT_AUTHOR_NAME="newname"; export GIT_AUTHOR_EMAIL="login@company.com"' --tag-name-filter cat -- --branches --tags

# check if all the old names are gone
grep -r "oldname"
```

OK the old repo is ready.

##### 5. change configs in old repo
```bash
# add new remote host to config
vim ./.git/config
...
[remote "origin"]
      url = ssh://git.newcompany.com/repo/new_repo          # here is what we are changing, the hosted repo endopoint, could be https://
      fetch = +refs/heads/*:refs/remotes/origin/*

# from tannhauser.git, but with new remotes
git push --tags origin 'refs/heads/*'                       # the new repo host doesn't allow force as in github tutorial
```

so we have pushed the old repo (with new author/email) to the new repo.

In my case, my github repo was branch master, while new repo uses 'mainline'. so i still have to merge the two commits, but there shouldn't be a conflict because the new repo is empty.

now you can get rid of the bare repo. the original old repo still lives on github.
`$> trash tannhauser.git`

##### 6. now the new repo
- the old repo is pushed to the new repo host
- pull it down to local repo and 

```bash
git branch remote
      mainline
      master
# again, original old repo push should have been to mainline but forgot the branch name difference
# 'master' is the branch I'm merging into current branch 'mainline'
# i need to pull down the master branch
git pull origin master --allow-unrelated-histories          # that's important, because new repo timeline is newer
git branch
      *mainline
      master
git merge master --allow-unrelated-histories

git log
# its looking good
grep -r "oldname"
      # no result
git status
```

### tears in rain
now you should be able to work with the repo as usual. the master branch is no longer needed, everything is mainline now.

```bash
subl new_script.py
git status
git add new_script.py
git commit -m 'new_script.py'
git push origin mainline
git log --oneline --decorate --graph --all --date=short
```

yup, it all looks good, proceeding forward from the merge. I can get rid of master now.

```bash
git branch -d master
git push origin :master                                     # this deletes brach from remote host
      To ssh://git.newcompany.com/repo/new_repo
      - [deleted]         master
```

`DONE`
