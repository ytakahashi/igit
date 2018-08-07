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

### Basic usage

Basic operation on fzf window.  

| Key                                                         | Description            |
| :---------------------------------------------------------- | :--------------------- |
| <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>n</kbd>                   | Move cursor down       |
| <kbd>Ctrl</kbd>+<kbd>k</kbd>/<kbd>p</kbd>                   | Move cursor up         |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>/<kbd>g</kbd> or <kbd>Esc</kbd> | Exit                   |

`igit` specific operation on fzf window.

| Key                           | Description                                                                     |
| :---------------------------- | :------------------------------------------------------------------------------ |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>  | See selected file/branch/commit                                                 |
| <kbd>Alt</kbd>+ `key`         | Put git command using selected file/branch/commit onto the editing buffer stack |

### igit help

Show available commands.

### igit add

Show current status and add selected files.

| Key                                             | Description            |
| :---------------------------------------------- | :--------------------- |
| <kbd>Ctrl</kbd>+<kbd>i</kbd> or <kbd>Tab</kbd>  | Mark/Unmark files      |
| <kbd>Alt</kbd>+<kbd>a</kbd>                     | Add selected files     |

### igit branch

Show local and remote branchs.

| Key                                        | Description                               |
| :----------------------------------------- | :---------------------------------------- |
| <kbd>Alt</kbd>+<kbd>d</kbd>                | Delete selected branch                    |
| <kbd>Alt</kbd>+<kbd>c</kbd>                | Switch to selected branch                 |
| <kbd>Alt</kbd>+<kbd>m</kbd>                | Merge selected branch into current branch |

### igit cherry-pick

Show commit log and cherry-pick selected commit.

| Key                                        | Description            |
| :----------------------------------------- | :--------------------- |
| <kbd>Alt</kbd>+<kbd>c</kbd>                | Cherry-pick the commit |

### igit diff

Shows current status and see diff of selected file.

### igit log

Show log of branch.  

| Key                                        | Description                 |
| :----------------------------------------- | :-------------------------- |
| <kbd>Alt</kbd>+<kbd>r</kbd>                | Reset (hard) to the commit  |

### igit stash

Show stashes.

| Key                                        | Description                  |
| :----------------------------------------- | :--------------------------- |
| <kbd>Alt</kbd>+<kbd>a</kbd>                | Apply selected stash         |
| <kbd>Alt</kbd>+<kbd>d</kbd>                | Drop selected stash          |

## Key Bingings

Following key bindings are available.

| Key                                                         | Command                |
| :---------------------------------------------------------- | :--------------------- |
| <kbd>Ctrl</kbd>+<kbd>g</kbd> <kbd>Ctrl</kbd>+<kbd>a</kbd>   | igit add               |
| <kbd>Ctrl</kbd>+<kbd>g</kbd> <kbd>Ctrl</kbd>+<kbd>b</kbd>   | igit branch            |
| <kbd>Ctrl</kbd>+<kbd>g</kbd> <kbd>Ctrl</kbd>+<kbd>l</kbd>   | igit log               |
| <kbd>Ctrl</kbd>+<kbd>g</kbd> <kbd>Ctrl</kbd>+<kbd>s</kbd>   | igit stash             |
