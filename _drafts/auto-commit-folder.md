# Auto-commit Folder

* Watch folder(s) for changes
  - `_drafts`
* Delay x seconds (debounce)
* Run a series of commands
  - `git add _drafts`
  - `git commit -m 'auto-commit _drafts 20190204 120005'`
  - `git push origin HEAD`

## Tech Options

* [inotifywait](https://linux.die.net/man/1/inotifywait)
* [gitwatch](https://github.com/gitwatch/gitwatch) - installing `coreutils` fails
* [etckeeper](http://etckeeper.branchable.com/) - typically used for the `etc` folder
* [entr](http://eradman.com/entrproject/)
* custom script, [inspiration](https://stackoverflow.com/a/35421105/2675670)
