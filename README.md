# known-host
known-host utility for oh my zhs tool

## Installation
Clone the following repo in the custom plugins directory of your oh-my-zsh installation:

```shell
cd ~/.oh-my-zsh/custom/plugins
git clone repo
```

## Usage
To use the `known-host` utility, you need to add it to your plugins list in your `.zshrc` file. For example:

```shell
plugins=(git known-host)
```
Restart your terminal or run `source ~/.zshrc` to apply the changes


## Commands
The `known-host` utility provides the following commands:

### `known-host -d <line>`
This will remove the host line that matches the provided host name from your `~/.ssh/known_hosts` file.