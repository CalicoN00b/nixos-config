{ self, inputs, ... }:

{
    flake.nixosModules.theme = { ... }: {
        imports = with self.nixosModules; [
            fonts
            cursor
        ];
    };
}