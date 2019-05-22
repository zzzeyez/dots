# macos dotfiles
![screenshot](screenshot/screenshot.png)
here is the [wallpaper](screenshot/wallpaper.png) and `wal` [colorscheme](screenshot/colors.json) shown in the screenshot. the colorscheme can be loaded with `wal --theme ./colors.json`

## features
+ three-finger dragging, tap to click, two-finger tap to right click
+ vry fast trackpad and key repeat
+ snappy animations + disabled transparency
+ gray highlight and accent colors
+ load random wallpapers, palettes and menubars via keybinds
+ cohesive colors (safari start page, terminals, menubar)

keyboard shortcuts select styles or fetch all my colorschemes and wallpapers from the web.  caps-lock key controls my terminal programs, and cmd key controls everything else.  colors are applied to all my apps via `.scss` files, `sassc`, sourcing `.sh` files

## key bindings
### workspace
+ (cmd + 1-5) switch to workspace 1-5
+ (cmd + shift + 1-5) move window to workspace 1,5 and switch there as well
+ (cmd + arrows) scroll through windows on current worksace
+ (cmd + shift + arrows) move windows on current workspace

### terminal programs
+ (caps-lock) -> alt-key (controls `tmux`, `irssi` `weechat` and `ncmpcpp`
+ (alt + arrows) switch windows (left/right for `tmux`, up/down for rest)
+ (alt + enter) ctrl + b (so it functions as `tmux` leader)

### wallpapers
+ (cmd + 0) random [wallpaper](https://github.com/zzzeyez/bin) for current workspace
+ (cmd + shift + 0) random `wallpaper` for all workspaces
+ (rcmd + 0) `wal` palette solid color as `wallpaper`
+ (rcmd + shift + 0) download unsplash.com wallpaper via [new-roses](https://github.com/zzzeyez/new-roses)
+ (cmd + shift + d) save `new-roses` wallpaper to ~/pictures/wallpapers

### colorschemes
+ (cmd + shift + w) disable [darkmode](https://github.com/zzzeyez/bin) and download + apply dark palette via [colorlovers](https://github.com/zzzeyez/colorlovers)
+ (cmd + shift + e) enable `darkmode`, download + apply light `colorlovers` palette
+ (cmd + shift + r) load random saved `colorlovers` palette
+ (cmd + shift + s) saves `colorlovers` palette

### menubar + notifications
+ (cmd + shift + x) load random [xanthia](https://github.com/zzzeyez/xanthia) + [pecan](https://github.com/zzzeyez/pecan) style
+ (cmd + shift + h) [toggle](https://github.com/zzzeyez/bin) `xanthia` + `pecan` (also applies `chunkwm` menubar offset via [wal-set](https://github.com/zzzeyez/bin))

## install
i regularly reformat my laptop, run `dots.sh` and pick up where i left off

it (interactively) clones my github repositories to `~/scripts`, installs `homebrew`, installs my `brew` packages, python packages and (`oh-my-zsh` plugins.  it then symlinks all my dots from this repo to the default config locations and starts my `brew` services

**./dots.sh** install everything (asking for permission for each task)

**./install/brew_packages** list of homebrew packages

**./install/macos_settings** list of macos settings

**./install/zsh_plugins** list of zsh plugins (installed to `~/.oh-my-zsh/custom/plugins`)

**./install/save_home** list of files to save if deleting home directory

**./install/save_library** list of files to save if deleting `~/Library`

**./install/make_directories** list of folders to recreate if deleting home

to enable workspace switching you will need to add the 5 workspaces (click the f5 key) and then enable the default shortcuts in system preferences -> keyboard -> shortcuts

as is the case with all dotfiles: configs are a very personal thing and my workflow might not be what you prefer.  i suggest that you look through the install files and pick at which features you want.  or feel free to run `dots.sh` — it will walk you through the process and ask you which features you want

## misc
`weechat`, `irssi`, `ncmpcpp`, `wallpaper`, `colorlovers` and other programs that i'm forgetting to list all send notifications via `notify-send`.  `notify-send` is a linux program with lots of plugins available to trigger it.  i made [my own version](https://github.com/zzzeyez/xanthia) to mimic it on macos (complete with image support)

`dots.sh -u` will take a screenshot.  it will save it to this repo, then copy both `/tmp/wallpaper.png` and `colors.json` here as well.  `dots.sh -y` will non-interactively delete everything (except those listed in `./install/save_home`) in `~/`, recreate the `~/` directories listed in `./install/make_directories`, recreate symlinks to dotfiles, update `brew` packages and reapply `./install/macos.sh` settings

## to do + issues i'm experiencing (maybe you can help)
+ caps-lock -> alt-key bind reverts upon reset.  seeking new terminal method..
+ custom `oh-my-zsh` theme is buggy (is this just how it is?)
+ unable to `sudo echo` paths to `/etc/paths.d/paths`
+ make `./install/brew.sh` and `./install/macos.sh` interactive
