{ lib, ...}:
{
   xsession.windowManager.i3.enable = true;
   xsession.windowManager.i3.config.keybindings = lib.mkOptionDefault {
      "mod1+b" = "exec firefox";
      "mod1+p" = "exec rofi -show drun";
   };
   xsession.windowManager.i3.config.terminal = "alacritty";
   xsession.windowManager.i3.config.bars = [];
}
