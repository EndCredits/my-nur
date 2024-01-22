{ config, pkgs, lib, ... }:

let
  base = pkgs.appimageTools.defaultFhsEnvArgs;
in
pkgs.buildFHSUserEnv (base // {
      name = "fhs";
      targetPkgs = pkgs: (
        (base.targetPkgs pkgs) ++ [
          pkgs.pkg-config
          pkgs.ncurses
        ]
      );
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
})
