# NixOS Configuration

This is the NixOS configuration for my NixOS setup.

# Setup

1. Install NixOS. On my machine, I installed the KDE Plasma DE through the installer, so it is the only one that I can "guarantee" will work.
2. Install Home-Manager. I installed it using the Standalone Installation.
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

In `home.nix`, change these three things:
1. `home.username` to your username
2. `home.homeDirectory` to your home directory
3. `home.stateVersion` to the version of your original Home-Manager install (e.g. if you installed Home-Manager 25.11 *originally*, change it to 25.11)

In `flake.nix`, change these two things:
1. `nixosConfigurations.nixos` to your hostname
2. `homeConfigurations.igalaviz` to your username

In `configuration.nix`, change these three things:
1. `networking.hostName` to your desired host name
2. `users.users.igalaviz` to `user.user.<your-username>`
3. `system.stateVersion` to the version of your original NixOS install (e.g. if you installed NixOS 25.11 *originally*, change it to 25.11)

In `user/git.nix`, change these four things:
1. `settings.user.name` to your name
2. `settings.user.email` to your email
3. `signing.key` to the location of your public ssh key
4. `matchBlocks."*".identityFile` to the location of your private ssh key

# Installation

Once you have changed everything necessary to change, and configured it otherwise to your liking, you can use this config. To do so, run these two commands:
```bash
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```

If you want to update the inputs before the installation, run `nix flake update` before running those two commands.

Congratulations, you now have my (objectively awesome) NixOS setup!
