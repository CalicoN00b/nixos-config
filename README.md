# NixOS Configuration

This is the NixOS configuration for my NixOS setup.

# Setup

1. Install NixOS. On my machine, I installed the KDE Plasma DE through the installer, so it is the only one that I can "guarantee" will work.
2. Install Home-Manager. I installed it using the [Standalone Installation](https://nix-community.github.io/home-manager/installation/standalone.html).
3. Create an SSH key. Obviously, since this is currently a private repository, you'll need it to clone this repository.

## Inside the repository

```bash
git clone git@github.com:CalicoN00b/nixos-config
cd nixos-config
```

Most importantly, ***MAKE SURE THE HARDWARE-CONFIGURATION IS USING THE HARDWARE-CONFIGURATION FOR YOUR SYSTEM***. You can make sure of that by running this command:
```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```
If you don't do this, you will seriously mess up your system (ask me how I know).

In `configuration.nix`, change these three things:
1. `networking.hostName` to your desired host name
2. `users.users.igalaviz` to `user.user.<your-username>`
3. `system.stateVersion` to the version of your original NixOS install (e.g. if you installed NixOS 25.11 *originally*, change it to 25.11)

In `home.nix`, change these three things:
1. `home.username` to your username
2. `home.homeDirectory` to your home directory
3. `home.stateVersion` to the version of your original Home-Manager install (e.g. if you installed Home-Manager 25.11 *originally*, change it to 25.11)

In `flake.nix`, change these things:
1. `nixosConfigurations.nixos` to your hostname just defined in `configuration.nix`.
2. `homeConfigurations.igalaviz` to your username
3. Upgrade the version of `nixpgs.url` and related inputs to the latest version (e.g. if `nixpgs.url = ...-25.11` and the latest NixOS version is 26.05, change it to `nixpgs.url = ...-26.05`)

In `user/git.nix`, change these four things:
1. `settings.user.name` to your name
2. `settings.user.email` to your email
3. `signing.key` to the location of your public ssh key
4. `matchBlocks."*".identityFile` to the location of your private ssh key

# Installation

Once you have changed everything necessary to change, and configured it otherwise to your liking, you can use this config. To do so, run these two commands:
```bash
nix flake update # OPTIONAL! updates the flake's inputs.
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```

## Imperative Configuration

### Yazi

Yazi can do its configuration through nix, but it is not something I care to figure out for right now.
There is a config available in this repository. To link this config for yazi to use, run this command.
This will replace any yazi config currently in ~/.config/

```bash
ln -sf /path/to/cloned/repository/imperative-configs/yazi/ ~/.config/
```

### Vesktop

Vesktop also can do its configuration through nix, but I also don't care to figure that out right now either.
For now, if you would like to load my settings into it, simply import `imperative-configs/vesktop/vencord-settings-backup-2026-09-16.json` in the Backup & Restore section in the Vesktop settings.

### KDE Plasma

I'm uncertain if the config for KDE Plasma can be done through nix, so you'll just have to do the config for this manually, sorry.

# Enjoy!

Congratulations, you now have my (objectively awesome) NixOS setup!