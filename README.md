# custom-multi-bashrc
A bashrc that loads split components based on the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
Inspired by [Quentin ADAM on medium.com's post](https://medium.com/@waxzce/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff)

# Mutliple Toggle-able Configs
The `bashrc` here is meant to be placed in the traditional `~/.bashrc` location.

From there, `$XDG_CONFIG_HOME/bash` is referenced.

`$XDG_CONFIG_HOME/bash/bashrc` is meant to house *multiple* different config files. You can use this to your advantage by splitting your configuration into components instead of one large file.

Files marked executable are sourced, while files *not* marked executable will be ignored. This means that you can toggle on and off individual portions of your configuration using `chmod +x` and `chmod -x`

`$XDG_CONFIG_HOME/bash/bash-completion` works exactly the same, but is inteaded for files containing completion scripts. This seperate directory essentially exists for the sake of organization.

# History Relocated
`$HISTFILE` is set to `$XDG_DATA_HOME/bash/history` instead of `~/.bash_history`

It's not configuration, it's *data*.

# Extras
Some extra .bashrc files are included for convenience.

## `config-manager-function.bashrc`
A big ol' function that adds some quality of life quick access to working with this multi-bashrc system.

This is not included in the main `.bashrc` to prevent clutter and bloat. Not everyone will need or want this, but it can be handy!

For a list of available options, see `bashrc-config --help` after it has been sourced.

## `alias-flatpak-exports.bashrc`
Iterates through files in `/var/lib/flatpak/exports/bin` and attempts to alias them to logical command names if they're not already taken.

If they **are** already taken, will attempt the long name (IE `tld.domain.app` instead of just `app`)

If the long name is ALSO taken, then no alias is created.

This is done for those who don't want to do `flatpak run tld.domain.app` so that you can just run `app`

run `alias | grep 'flatpak'` after this file has been sourced to see aliases it created for you.
