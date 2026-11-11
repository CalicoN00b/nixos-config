# NixOS Configuration

This is CalicoN00b's personal configuration for NixOS.

> [!CAUTION]
> This is a PERSONAL config, so I'm NOT gonna provide instructions for other people to install.
> All instructions will be for me and me only, so don't complain to me if it doesn't work for you.

# Installation

For a new host, create a new folder under `modules/hosts` with your desired hostname
(technically name doesn't matter, but it helps for keeping track).

Move the hardware configuration of your host into the directory:

```bash
mv /etc/nixos/hardware-configuration.nix modules/hosts/{hostname}/_hardware-configuration.nix
```

Create a `configuration.nix` file in the host's folder, which will hold system specific configurations,
such as hostname, state version, packages, services, etc. Look at other hosts for reference.

Create a `default.nix` file in the host's folder, which will contain the actual NixOS System configuration.
This should really just import the other flake modules to build the system. It must contain core, hyprland, and your system specific configuration.
Look at other hosts for reference.

Once you are done building the new system config, rebuild your system. The first time you do so,
you should specify the name of the flake nixosConfiguration, but in future you won't need do.

```bash
sudo nixos-rebuild switch --flake .#{hostname}
```

Then, reboot your system and you should be fine.

# Post-Installation

Some things won't have their configuration done through nix, and thus will need manual configuration.
I had done some of them before through nix, but I've decided it's easier to let me
manually do them so nix can't get in the way.

## Git

Set up your ssh key and add it to Github. Make sure you also add your ssh key as a signing key as well.
Set up user name and user email. Make sure you sign commits by default with your ssh key.

## Vesktop

Transfer over a backup of your settings from another machine, or just make a new one through the Vesktop settings.

## Librewolf

Customize it the way you like, which is basically just the shortcuts on the home page, and also make it
so that it doesn't close when you close the last tab. And also Dark Reader and make downloads ask where to go.
Also since it's Librewolf make sure it will save your history between sessions.

# Enjoy

That should be everything. Once again, this is a ***PERSONAL CONFIG***, so if you've read this far and you're not me,
what are you doing? If you have issues with it, don't come to me about it, I'm not going to be offering support
for my ***PERSONAL CONFIG***.