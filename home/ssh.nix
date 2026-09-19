{ ... }:

{
    programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        settings = {
            "Host *" = {
                AddKeysToAgent = "yes";
                IdentityFile = "~/.ssh/id_ed25519";
            };
        };
    };

    services.ssh-agent.enable = true;
}