{ ... }:

{
    programs = {
        git = {
            enable = true;

	    settings = {
		user = {
		    name = "Ian Galaviz";
		    email = "brianatthehouse@gmail.com";
		};

		init.defaultBranch = "main";
		gpg.format = "ssh";
	    };

            signing = {
                signByDefault = true;
                key = "~/.ssh/id_ed25519.pub";
            };
        };

        ssh = {
            enable = true;
	    enableDefaultConfig = false;
            
	    matchBlocks."*" = {
		addKeysToAgent = "yes";
		identityFile = "~/.ssh/id_ed25519";
	    };

	    matchBlocks."ssh.calicoctl.net" = {
		proxyCommand = "/nix/store/nr2252sfmyhd9f08n8k9b22mn2agmz4r-cloudflared-2025.11.1/bin/cloudflared access ssh --hostname %h";
	    };
        };
    };

    services.ssh-agent.enable = true;
}
