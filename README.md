# dotfiles

This is a repository for storing my settings for certain applications (dotfiles) on a code hosting platform.

## Usage

Below is how you can use my settings. Feel free to fork or copy them, but be aware of the limitations that this repository license implies.

You can use the following options to use the dotfiles:

1. [Install on your machine](#install-on-your-machine)

### Install on your machine

#### Clone the repo

To use my configuration files (dotfiles), you must clone this repository with the following command:

```
git clone https://github.com/olooeez/dotfiles.git
```

#### Enter the cloned repository

After cloning, you must enter the local repository using the following command:

```
cd dotfiles
```

#### Use GNU Stow to link settings

Install [GNU Stow](https://gnu.org/software/stow) on your system and run it, passing the settings you want to link as arguments. For example, to link my zsh configuration, you would run the command below:

```
stow zsh
```

## Contributing

If you would like to contribute to this project, please feel free to open a pull request. All contributions are welcome!

## License

This project is licensed under the [MIT](https://github.com/olooeez/dotfiles/blob/main/LICENSE) License. See the LICENSE file for details.
