## changing author and email after pushing commits
gitfarm doesn't allow `git push --force`, so you can't rewrite.

***always make sure your local repo `.git/config` has proper user/email!!!***

here's what you do, with code snippets below:

1. `git clone` to a new backup repo location
2. use the github script for `filter-branch`
    + https://help.github.com/articles/changing-author-info/
    + this rewrites history, but keeps dates and comments, tags
3. you can't `pull --rebase`, the bad keeps returning
4. branching and deleting mainline
    + create a new branch 'newmain'
    + push to gitfarm
    + delete local 'mainline'
    + delete gitfarm mainline manually
    + create 'mainline' again
    + push to gitfarm
    + delete local 'newmain'
    + delete gitfarm 'newmain'

**your gitfarm repo show be the way you want it now.**

### steps in code

```bash
# change author and email for commits, rewriting history, for wrong emails
# only works if server rules allow git push --force
# https://help.github.com/articles/changing-author-info/
git clone <repo location>   # does not need to be bare, bc gonna create branches
git clone <repo, another for backup>

# in the rewrite repo:
sh git-author-rewrite.sh

# skip -- this doesn't work on controlled remote server
git push --force --tags origin 'refs/heads/*'
cd ..
trash <repo.git>

### delete branch and remote tracking branch, recreate same name branch
git checkout -b newmain
git push --set-upstream origin newmain
git branch -D mainline
git branch -d -r origin/mainline
# on gitfarm I also manually deleted the branch 'mainline'
git checkout -b mainline
git push --set-upstream origin mainline
git branch -D newmain
git branch -d -r origin/newmain
# and then delete 'newmain' manually on gitfarm
```

trash your backup repos now.
