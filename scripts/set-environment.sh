# Preemptively force misbehaving apps to follow XDG settings
# See: https://wiki.archlinux.org/title/XDG_Base_Directory#Support.
export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export IPFS_PATH="$XDG_DATA_HOME"/ipfs
export ZDOTDIR=$HOME/.config/zsh
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export LESSHISTFILE=-
