{
  inputs,
  pkgs,
  ...
}:
let
  mkConfig = import ../utils/mkConfig.nix;
in
{
  home = {
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.11"; # Please read the comment before changing."
    packages = with pkgs; [
      bat
      commitizen
      delta
      emmet-language-server
      fd
      fzf
      gh
      ghq
      git
      gopls
      lazygit
      lua-language-server
      meteor-git
      neovim
      nixd
      nixfmt
      ripgrep
      inputs.riot-v3-language-server.packages.${pkgs.stdenv.hostPlatform.system}.default
      stylelint-lsp
      stylua
      tmux
      tree-sitter
      typescript-language-server
      vim
      vscode-langservers-extracted
    ];
    sessionVariables = {
    };
  };
  xdg.configFile = {
    git = mkConfig "git";
    lazygit = mkConfig "lazygit";
    nix = mkConfig "nix";
    nvim = mkConfig "nvim";
    tmux = mkConfig "tmux";
    vim = mkConfig "vim";
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
