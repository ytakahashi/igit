# fgit

interactive git command using fzf

## Description

`fgit` makes your git commands interactive.

## Requirement

Install [fzf](https://github.com/junegunn/fzf) before using fgit.


## Usage

### fgit add

Show current status and add selected files.  

| Key                                             | Description            |
| ----------------------------------------------- | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>i</kbd> or <kbd>Tab</kbd>  | Select/Unselect        |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>       | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>       | Up                     |
| <kbd>Enter</kbd>                                | See diff               |
| <kbd>Ctrl</kbd>+<kbd>a</kbd>                    | Add selected files     |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>                    | Cancel                 |


### fgit branch

Show local branchs and delete a selected branch.  
This command requires option.  

- `fgit branch -d`: behaves like git branch -d `<BRANCH_NAME>`
- `fgit branch -D`: behaves like git branch -D `<BRANCH_NAME>`

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | Delete                 |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


### fgit checkout

Show local and remote branchs and switch to a selected branch.  
If remote branch is selected, new local branch is created and switch to the branch.  

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | Checkout               |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |

### fgit diff

Shows current status and see diff of selected file.  
Preview window shows the current content of a file.  

| Key                                        | Description            |
| ------------------------------------------ | ---------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>  | Down                   |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>  | Up                     |
| <kbd>Enter</kbd>                           | See diff               |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | Cancel                 |


