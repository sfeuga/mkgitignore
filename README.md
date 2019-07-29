# mkGitignore - Easy create a ".gitignore" in the current directory

mkGitignore is a GPLv3 tool to use the https://www.gitignore.io API from the cli

__This is not an official tool from gitignore.io__


## How to use

Run `mkgitignore --keywords vim,ruby` in your terminal to create a `.gitignore` file setup for vim and ruby.

Run `mkgitignore --help` to get some help. To read more informations, run `man mkgitignore`.


## How to install

__Requirements:__
- [GNU Bash](https://www.gnu.org/software/bash)
- [curl](https://curl.haxx.se)
- [GNU troff (groff)](https://www.gnu.org/software/groff/)

1. Download [latest](https://github.com/sfeuga/mkgitignore/releases/latest) version or clone this repo
2. Run `sudo make install` from the downloaded and extracted folder
3. Open a new shell or run `source ~/.{ba,z}shrc` to get completion.
4. Optional: To install the [cheat file](https://github.com/cheat/cheat) run `curl -sFLo $HOME/.cheat/mkgitignore --create-dirs https://raw.githubusercontent.com/sfeuga/mkgitignore/master/mkgitignore.cheat`

You can also setup a git alias to create a default `.gitignore` with `git config --global alias.mkg '!mkgitignore -d'`
and then type `git mkg` to generate your default `.gitignore` or type `git mkg -k ruby` to use "default" and "ruby"
keywords.

Run `mkgitignore --display-default` to see which default values are set and see `man mkgitignore` to create a
`.mkgitignorerc` file to override default values.

## Reporting bugs

Please use the GitHub issue tracker for any bugs or feature suggestions:

<https://github.com/sfeuga/mkgitignore/issues>

## TODO

- [ ] Add automated test ([bats](https://github.com/sstephenson/bats) ?)
- [ ] Add an option to create a `.mkgitignorerc`. Ex: `mkgitignore -E -k vim,ruby,linux` will run `echo "keywords='vim,ruby,linux'" > ~/.mkgitignorerc`

## Contributing

Please submit patches to code or documentation as GitHub pull requests!

Contributions must be licensed under the GNU GPLv3.
The contributor retains the copyright.


## Copyright

mkgitignore is licensed under the GNU General Public License, v3.
A copy of this license is included in the file [COPYING](COPYING)
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Copyright (C) 2019 [Stephane FEUGA OSHIMA](https://github.com/sfeuga) <sfeuga@member.fsf.org>."
