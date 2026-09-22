# NixOS Configuration

This is CalicoN00b's personal configuration for NixOS.

# Installation

> [!CAUTION]
> This is a personal config, so please use at your own risk.
> What works for me may not work for you!

> [!WARNING]
> I don't know if this config works on Virtual Machines.
> I tried it on a NixOS VM and it complained about something I couldn't figure out.

## 1. Install NixOS.

I installed NixOS using the KDE Graphical Installer and installed the KDE Version of NixOS.
It may work for other DE's (such as no desktop or whatever), but I haven't tested it,

## 2. Clone the repository

```bash
nix-shell -p git # Temporatily installs git
git clone https://github.com/CalicoN00b/nixos-config # Clones the repository
cd nixos-config # Enters the cloned repository
```

The repo can be located anywhere on the system, but I like to keep mine under `~/nixos-config`

## 3. Run the installation script

First, inspect the script so you know what it does. Obviously I've tested it myself
and it should work and not be malicious, but you should always understand what you're running
before you run it on your machine.

In the repo, run this command:

```bash
./install.sh
```

If you for some reason can't run the script, run `chmod +x install.sh`, and then rerun the script.

The script will guide you through changing your username, changing your hostname, and changing your git user name and user email.

## 4. Reboot

After you have installed the system, reboot the system.

# Imperative Configuration

After installing this config, some configuration will still need to be done manually.
Some examples are yazi, vesktop, and librewolf.
Yazi and vesktop both have configs under `imperative-configs`, which you can figure out how to use yourself.
NOTE: THE YAZI CONFIG DOES NOT CURRENTLY WORK

# Enjoy!

Congratulations, you now have my (objectively awesome) NixOS setup!