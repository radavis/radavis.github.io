The general process for releasing software involves using Git to push code to
GitHub, and then deploying to production. Assign a version number to a release
before or after a deploy.


## Steps

### 1) Find the Git SHA for a release

For the current commit:

```
$ git rev-parse
```

### 2) Determine the version of the release

Visit `https://github.com/<username>/<repo_name>/releases`

Use the [Semantic Versioning Standard](http://semver.org/) to determine what
version number to assign to this release.

If no releases are specified, start with `v1.0.0`.

### 3) Tag the release and push to GitHub

```
$ git tag -a v1.1.0 -m "v1.1.0" 0bfbf24
$ git push origin --tags
```

### 4) Display a list of changes between tags

```
$ git log v1.0.0..v1.1.0 --no-merges --oneline
```

Copy the output of this command, and paste it into the release notes on GitHub.

### 5) Create a new Release Branch

This is helpful for understanding what code is in a release. You can simply
checkout branch `v5.1.0` instead of checking out a sha.

```
$ bundle exec cap production deploy:revision  # get the sha of the release
$ git checkout <sha>
$ git checkout -b v5.1.0  # use the release number from step #3
$ git push origin head  # share the release branch with the team
```

## Patch Releases

Occasionally, we will need to patch code in production. All patches will need to
go through the normal [Feature Branch Workflow](feature-branch-workflow.md) and
[PR Review](pr-workflow.md) steps.

### 1) Create a "Patch Commit"

Squash the PR so it is one commit.

```
$ git checkout branch-name
$ git log  # count the number of commits (n) since master
$ git reset --soft HEAD~n  # if this PR has two commits, n = 2
$ git commit -m "User story [JIRA-number]"
$ git push origin HEAD  # force push this branch, if necessary w/ --force
```

### 2) Merge the Patch Commit into the latest release

```
$ git rev-parse HEAD  # get the sha of the patch commit
$ git checkout v5.1.0
$ git cherry-pick <sha>
```

### 3) Create a new Release Tag and Release Branch

See steps, above.

### 4) Deploy

```
$ bundle exec cap demo deploy --trace BRANCH="v5.1.1"
$ bundle exec cap production deploy --trace BRANCH="v5.1.1"
```
