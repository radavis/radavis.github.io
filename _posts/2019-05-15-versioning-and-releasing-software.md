---
layout: post
title: "Versioning and Releasing Software"
date: 2019-05-15 12:30
tags: git, github, semver
---

This is the process I have used to create Versioned Releases of software with
git and GitHub.

The general process for releasing software involves using Git to push code to
GitHub, and then deploying to production. A version number can be assigned to a
release before or after a deploy.

## Steps

### 1) Obtain the short Git SHA-1 hash for a release

For the current commit:

```
$ git rev-parse --short HEAD
0bfbf24  # resulting Git SHA
```

### 2) Determine the version of the release

Visit `https://github.com/<username>/<repo_name>/releases`

Use the [Semantic Versioning Standard](http://semver.org/) to determine what
version number to assign to this release.

If no releases are specified yet, start with `v1.0.0`.

### 3) Tag the release and push to GitHub

```
$ git tag -a v1.1.0 -m "v1.1.0" <SHA>
$ git push origin --tags
```

### 4) Display a list of changes between tags (changelog)

```
$ git log v1.0.0..v1.1.0 --no-merges --oneline
```

Copy the output of this command, and paste it into the release notes on GitHub.

One nice side-effect of titling pull requests with the Version Control issue
number, user story, and squash-merging PRs is that the output of this command
can become the changelog, and ties back to issues in your Version Control system.

### 5) Create a new Release Branch

This is helpful for understanding what code is in a release. You can simply
checkout branch `v5.1.0` instead of checking out a Git SHA.

```
$ git checkout <SHA>
$ git checkout -b v1.1.0  # use the release number from step #3
$ git push origin head  # share the release branch with the team
```

## Patch Releases

Occasionally, it is necessary patch production code. All patches should
go through the normal Feature Branch Workflow and PR Review steps.

### 1) Create a "Patch Commit"

Squash the PR so it is one commit.

```
$ git checkout <branch-name>
$ git log  # and count the number of commits (n) since master
$ git reset --soft HEAD~n  # if this PR has two commits, n = 2
$ git commit
$ git push origin HEAD  # force push this branch, if necessary w/ --force
```

### 2) Merge the Patch Commit into the latest release

```
$ git rev-parse --short HEAD  # get the SHA of the patch commit
$ git checkout v5.1.0
$ git cherry-pick <SHA>
```

### 3) Create a new Release Tag and Release Branch

See steps, above.

### 4) Deploy
