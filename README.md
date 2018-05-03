# igit

`igit` - interactive git command using fzf


## Requirements

- zsh
- [fzf](https://github.com/junegunn/fzf) 


## Install

### With [zplug](https://github.com/zplug/zplug) :hibiscus:

```zsh
zplug "ytakahashi/igit"
```

### Manually

Clone this repository and load `igit.plugin.zsh` from `.zshrc`

```.zshrc
source /path/to/igit.plugin.zsh
```

## Usage

### igit help

Show available commands.  

### igit add

Show current status and add selected files.  

| Key                                             | Description            |
| ----------------------------------------------- | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>i</kbd> or <kbd>Tab</kbd>  | Select/Unselect        |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>       | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>       | Up                     |
| <kbd>Enter</kbd>                                | See diff               |
| <kbd>Ctrl</kbd>+<kbd>a</kbd>                    | Add selected files     |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                    | Cancel                 |


### igit branch

Show local branchs and delete a selected branch.  
This command requires subcommand.  

- `igit branch delete`: deletes selected branch

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | Delete                 |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>               | See diff               |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


### igit checkout

Show local and remote branchs and switch to a selected branch.  
If remote branch is selected, new local branch is created and switch to the branch.  

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | Checkout               |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


### igit diff

Shows current status and see diff of selected file.  
Preview window shows the current content of a file.  

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | See diff               |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


### igit merge

Show local and remote branchs and merge selected branch into current branch.  

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | Merge                  |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


### igit stash

Show stashes. This command requires subcommand.
  
- `igit stash apply`: applies selected stash to current branch
- `igit stash drop`: deletes selected stash

| Key                                        | Description                  |
| ------------------------------------------ | ---------------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                         |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                           |
| <kbd>Enter</kbd>                           | Apply/Drop                   |
| <kbd>Ctrl</kbd>+<kbd>d</kbd>               | See diff with current branch |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                       |

