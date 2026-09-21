{ ... }:

{
    programs.git = {
        enable = true;

        settings = {
            user = {
                name = "MY_NAME";
                email = "MY_EMAIL";
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
