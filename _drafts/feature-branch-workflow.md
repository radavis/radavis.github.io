## Follow GitHub Flow

[source](http://scottchacon.com/2011/08/31/github-flow.html#how-we-do-it)

## Creating a new "Feature Branch"

When starting a new feature, create a new [git branch](https://git-scm.com/docs/git-branch)
to keep track of your changes.

1. Switch to the master branch (always branch from master): `git checkout master`
1. Create and checkout a new branch: `git checkout -b your-branch-name`
1. Write some code (and tests) that implement the feature.
1. At regular intervals, push your code to origin (GitHub): `git push origin your-branch-name`

**Note**: You may substitue `HEAD` for `your-branch-name`. `HEAD` refers to the
current commit.

```
$ git push origin HEAD  # is equivalent to
$ git push origin your-branch-name
```

## Switching Feature Branches

Ideally, you will work on a feature until it is complete. Occasionally, you may
need to switch gears and work on a different feature.

### Option A: Reload The Database

1. Commit the changes on your current branch: `git commit -m "descriptive commit message, here"`
1. Push your changes to origin (GitHub): `git push origin your-branch-name`
1. Switch to the master branch: `git checkout master`
1. Create a new branch for your work off of master: `git checkout -b new-branch-name`
1. Drop and re-create your development database: `bundle exec rake db:drop db:create`
1. Load a database snapshot from Production.
1. Migrate the database: `bundle exec rake db:migrate`

### Option B: Step Back Migrations

1. Commit the changes on your current branch: `git commit -m "descriptive commit message, here"`
1. Push your changes to origin (GitHub): `git push origin your-branch-name`
1. **Important Step**: Roll back the migrations associated with this branch. Set STEP to the number of migrations created in this branch. `rake db:rollback STEP=1`
1. Switch to the master branch: `git checkout master`
1. Retrieve any changes: `git pull`
1. From here, you may create a new branch off of master, or switch to another branch.

If `git pull` does not work as intended, see this
[Stack Overflow answer](https://stackoverflow.com/a/5112408/2675670)
for a solution.

The `rake db:rollback` command takes an optional argument, the `VERSION` of the
database schema you would like to roll back to. If you have only written one
migration, please omit the `VERSION` argument. Set the timestamp of the `VERSION`
argument to the migration before the new migrations in your feature branch.
