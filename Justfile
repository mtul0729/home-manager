# just is a command runner, Justfile is very similar to Makefile, but simpler.

# use nushell for shell commands
set shell := ["nu", "-c"]

############################################################################
#
#  Common commands(suitable for all machines)
#
############################################################################

# update flake inputs
up input=" ":
  nix flake update {{input}}

# remove all generations older than {{days}} days
clean days="7":
  home-manager expire-generations -{{days}}days

# Garbage collect all unused nix store entries
gc:
  # garbage collect all unused nix store entries
  nix store gc --debug
  nix-collect-garbage --delete-old

# Remove all reflog entries and prune unreachable objects
gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

############################################################################
#
#  Misc, other useful commands
#
############################################################################

# format the nix files in this repo
fmt:
  nix fmt

path:
   $env.PATH | split row ":"


helix-test: helix-clean
  rsync -av --copy-links --chmod=D2755,F744 dotfiles/helix/ $"($env.HOME)/.config/helix/"

# if tested, remove the helix config before switch
helix-clean:
  rm -rf $"($env.HOME)/.config/helix"
