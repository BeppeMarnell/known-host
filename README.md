# known-host
known-host utility for oh my zhs tool

## Installation
Copy the `known-host` directory that you find here into your custom plugins directory. This directory is likely `~/.oh-my-zsh/plugins/`.

## Usage
To use the `known-host` utility, you need to add it to your plugins list in your `.zshrc` file. For example:

```shell
plugins=(git known-host)
```

## Commands
The `known-host` utility provides the following commands:

### `known-host -d <line>`
This will remove the host line that matches the provided host name from your `~/.ssh/known_hosts` file.