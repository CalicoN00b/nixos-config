{ ... }:

{
    programs.git = {
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
}
