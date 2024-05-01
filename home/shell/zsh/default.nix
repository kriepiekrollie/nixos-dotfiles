{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    # enableCompletion = true;
    enableVteIntegration = true;
    # autosuggestion.enable = true;
    # syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh-custom/";
      theme = "agnoster-custom";
      plugins = [
        "git"
      ];
    };
    initExtra = ''
      eval "$(thefuck --alias)"
      eval "$(fzf --zsh)"
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh
      source ${pkgs.zsh-forgit}/share/zsh/zsh-forgit/forgit.plugin.zsh
    '';
  };
  home.file.".oh-my-zsh-custom/themes/agnoster-custom.zsh-theme" = {
    source = ./agnoster-custom.zsh-theme;
  };
}

