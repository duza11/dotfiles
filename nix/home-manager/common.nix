{
  inputs,
  pkgs,
  ...
}:
{
  home = {
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.11"; # Please read the comment before changing."
    packages = with pkgs; [
      delta
      fzf
      ghq
      git
      lazygit
      neovim
      ripgrep
      tmux
      vim
    ];
    sessionVariables = {
    };
  };
  xdg.configFile = {
    git = {
      source = ../../.config/git;
      recursive = true;
    };
    lazygit = {
      source = ../../.config/lazygit;
      recursive = true;
    };
    nix = {
      source = ../../.config/nix;
      recursive = true;
    };
    nvim = {
      source = ../../.config/nvim;
      recursive = true;
    };
    tmux = {
      source = ../../.config/tmux;
      recursive = true;
    };
    vim = {
      source = ../../.config/vim;
      recursive = true;
    };
  };

  programs.home-manager.enable = true;
}
