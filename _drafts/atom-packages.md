### Creating Atom Packages

Atom is built using web technologies. Knowledge of HTML, CSS, and JavaScript is
necessary.

* In Atom: CMD+SHIFT+P > Package Generator > `~/code/name-of-package`
* Create a symlink to this folder in `~/.atom/packages`

### Application Flow

* Atom starts
* Atom loads packages (including yours)
  - Atom reads your package.json
  - Atom loads keymaps, menus, styles, and the main module
* User executes `name-of-package:toggle`
  - Atom executes the `activate` method in the main module
  - Hidden modal view is created in the UI
  - `name-of-package:toggle` package command is executed, revealing the modal
* User executes `name-of-package:toggle` again
  - Atom hides modal
* Atom gets shut down, triggers package serializations  
