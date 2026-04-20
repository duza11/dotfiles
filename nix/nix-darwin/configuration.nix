{
  self,
  inputs,
  username,
  ...
}:
{
  system = {
    stateVersion = 6;

    # ビルド時の設定ファイルのコミット位置を記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # Mac 本体のユーザー設定を変更する際に必要
    primaryUser = username;
  };

  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.vim-overlay.overlays.default
    ];
    config.unfree = true;
  };

  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 12;
        Minute = 0;
      };
      options = "--delete-older-than-7d";
    };
    optimise = {
      automatic = true;
      interval = {
        Hour = 12;
        Minute = 0;
      };
    };
  };
}
