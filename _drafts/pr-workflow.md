# Pull Request Workflow

1. Assign a [Jira Story](https://workbar.atlassian.net/) to yourself and click "Start Progress."
1. Create a new branch, write code to satisfy the requirements of the Jira Story, along with backing tests. Verify the feature works by manually testing it in your local development environment.
1. When committing your code, include the relevant Jira Story Number at the end of your commit message. (e.g. - "add validations to user model [WOBBE-1024]")
1. Push your code to GitHub regularly (at the end of each day and when the feature is complete).
1. Create a Pull Request prefixed with `[WIP]` (Work In Progress). This will trigger [Codeship](https://app.codeship.com/projects/232692) to run the full test suite.
1. Announce to the team that you will be utilizing the Staging Server. 
1. Follow the instructions for creating a [database snapshot](https://github.com/techpoint/wobbe/blob/master/docs/database-snapshots.md) of production data, and load it into the staging database.
1. Deploy your code to Staging and verify the feature manually.
1. Add any necessary documentation for this feature.
1. Once you are satisfied that your code meets the requirements of the Jira Story, and CI tests are passing, update your Pull Request from `[WIP]` to `[RFR]` (Ready For Review).
1. Assign **one** member of the development team to review the Pull Request.
1. At this point, the code will be **accepted and merged**, or **rejected**. If your Pull Request is rejected, please make the necessary corrections and notify the reviewer.
1. Once the Pull Request has been merged, update the Jira Story: click "Stop Progress" and then "Resolve Issue" and mark as "Done."

## Valid Reasons to Reject a Pull Request

* The big green "Merge" button isn't displayed (conflicts with master branch).

Instructions for fixing conflicts with master:

```
$ git checkout master
$ git pull origin master
$ git checkout your-branch-name
$ git merge master  # fix any merge conflicts. pair with someone if you are stuck.
$ git push origin your-branch-name
```

* The Pull Request does not meet our style guidelines.
* Pull Request failed CI build.

## Merging on GitHub

In order to keep our commit history clean, utilize the
["squash and merge" feature](https://github.com/blog/2141-squash-your-commits).
This will make it so that there is a one-to-one relationship with our Jira Tickets
and git commits.

## Important links

* [Jira](https://workbar.atlassian.net/)
* [Codeship](https://app.codeship.com/projects/232692)
