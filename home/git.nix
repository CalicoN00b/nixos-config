{ pkgs, ... }:

{
    home.packages = with pkgs; [
        serie
        diffnav
        onefetch
    ];

    programs = {
        git = {
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

        lazygit.enable = true;

        delta = {
            enable = true;
            enableGitIntegration = false;

            options = {
                line-numbers = true;
                side-by-side = true;
                diff-so-fancy = true;
                navigate = true;
            };
        };

        zsh.shellAliases = {
            g = "lazygit";
            gf = "onefetch --number-of-file-churns 0 --no-color-palette";

            gs = "git status";
            gcl = "git clone";
            gd = "git diff | diffnav";

            ga = "git add";
            gaa = "git add --all";

            gc = "git commit";
            gcm = "git commit -m";

            gpl = "git pull";
            gplo = "git pull origin";

            gps = "git push";
            gpso = "git push origin";

            glg = "serie";
            glog = "git log --oneline --decorate --graph";
            glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
        };
    };
}
