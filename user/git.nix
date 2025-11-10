{ ... }:

{
    programs = {
        git = {
            enable = true;
            userName = "Ian Galaviz";
            userEmail = "brianatthehouse@gmail.com";

            signing = {
                signByDefault = true;
                key = "~/.ssh/id_ed25519.pub";
            };

            extraConfig = {
                init.defaultBranch = "main";
                gpg.format = "ssh";
            };
        };

        ssh = {
            enable = true;
            addKeysToAgent = "yes";

            extraConfig = ''
                IdentityFile ~/.ssh/id_ed25519
            '';
        };
    };

    services.ssh-agent.enable = true;
}
