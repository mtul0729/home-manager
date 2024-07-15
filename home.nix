{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./shell.nix
    ./applets.nix
    ./helix.nix
    ./fonts.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "myul";
  home.homeDirectory = "/home/myul";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Allow unfree packages. 
  # see https://nixos.wiki/wiki/Unfree_Software
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "wpsoffice"
      "vista-fonts-chs"
    ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome

    # Noto 系列字体是 Google 主导的，名字的含义是「没有豆腐」（no tofu），因为缺字时显示的方框或者方框被叫作 tofu
    # Noto 系列字族名只支持英文，命名规则是 Noto + Sans 或 Serif + 文字名称。
    # 其中汉字部分叫 Noto Sans/Serif CJK SC/TC/HK/JP/KR，最后一个词是地区变种。
    # noto-fonts # 大部分文字的常见样式，不包含汉字
    # noto-fonts-cjk # 汉字部分
    noto-fonts-emoji # 彩色的表情符号字体
    # noto-fonts-extra # 提供额外的字重和宽度变种

    # 思源系列字体是 Adobe 主导的。其中汉字部分被称为「思源黑体」和「思源宋体」，是由 Adobe + Google 共同开发的
    source-sans # 无衬线字体，不含汉字。字族名叫 Source Sans 3 和 Source Sans Pro，以及带字重的变体，加上 Source Sans 3 VF
    source-serif # 衬线字体，不含汉字。字族名叫 Source Code Pro，以及带字重的变体
    source-han-sans # 思源黑体
    source-han-serif # 思源宋体
    #vistafonts-cht # 微软正黑体
    vistafonts-chs # 微软雅黑体

    # nerdfonts
    # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/data/fonts/nerdfonts/shas.nix
    (nerdfonts.override {
      fonts = [
        # symbols icon only
        "NerdFontsSymbolsOnly"
        # Characters
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];
    })
    julia-mono
    dejavu_fonts

    #nix related
    nil # LSP
    alejandra #formater
    nurl #checksum fetcher

    #misc
    unar
    jq
    poppler
    fd
    ripgrep
    ffmpegthumbnailer
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".wezterm.lua".source = dotfiles/wezterm.lua;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/myul/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
