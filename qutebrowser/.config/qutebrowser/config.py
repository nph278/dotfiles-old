# Startup

c.url.default_page = "about:blank"

# Other URL stuff

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}"
}

# Fonts

c.fonts.default_family = "Fira Mono"
c.fonts.web.family.cursive = "Noto Sans"
c.fonts.web.family.fantasy = "Noto Sans"
c.fonts.web.family.fixed = "Fira Mono"
c.fonts.web.family.sans_serif = "Noto Sans"
c.fonts.web.family.serif = "Noto Sans"
c.fonts.web.family.standard = "Noto Sans"

# Colors

color = {
    "black": "#282C34",
    "red": "#E06C75",
    "green": "#98C379",
    "yellow": "#E5C07B",
    "blue": "#61AFEF",
    "magenta": "#C678DD",
    "cyan": "#56B6C2",
    "white": "#ABB2BF",
    "bright": "#FFFFFF"
}

# c.colors.completion.category.border.bottom = color["black"]
# c.colors.completion.category.border.top = color["black"]
c.colors.completion.item.selected.bg = color["blue"]
# c.colors.completion.item.selected.border.bottom = color["black"]
# c.colors.completion.item.selected.border.top = color["black"]
c.colors.completion.item.selected.fg = color["bright"]
c.colors.completion.item.selected.match.fg = color["black"]
c.colors.completion.match.fg = color["white"]
c.colors.completion.even.bg = color["black"]
c.colors.completion.odd.bg = color["black"]
c.colors.completion.fg = color["white"]
c.colors.completion.scrollbar.bg = color["black"]
c.colors.completion.scrollbar.fg = color["white"]
c.colors.contextmenu.disabled.bg = color["black"]
c.colors.contextmenu.disabled.fg = color["red"]
c.colors.contextmenu.menu.bg = color["black"]
c.colors.contextmenu.menu.fg = color["white"]
c.colors.contextmenu.selected.bg = color["blue"]
c.colors.contextmenu.selected.fg = color["white"]
c.colors.downloads.bar.bg = color["black"]
c.colors.downloads.error.bg = color["red"]
c.colors.downloads.error.fg = color["black"]
c.colors.downloads.start.bg = color["black"]
c.colors.downloads.start.fg = color["white"]
c.colors.downloads.stop.bg = color["black"]
c.colors.downloads.stop.fg = color["white"]
c.colors.downloads.system.bg = "rgb"
c.colors.downloads.system.fg = "rgb"
c.colors.hints.bg = color["yellow"]
c.colors.hints.fg = color["black"]
c.colors.hints.match.fg = color["blue"]
c.colors.keyhint.bg = color["yellow"]
c.colors.keyhint.fg = color["black"]
c.colors.keyhint.suffix.fg = color["black"]
c.colors.messages.error.bg = color["red"]
c.colors.messages.error.border = color["black"]
c.colors.messages.error.fg = color["black"]
c.colors.messages.info.bg = color["blue"]
c.colors.messages.info.border = color["black"]
c.colors.messages.info.fg = color["black"]
c.colors.messages.warning.bg = color["yellow"]
c.colors.messages.warning.border = color["black"]
c.colors.messages.warning.fg = color["black"]
c.colors.prompts.bg = color["green"]
c.colors.prompts.border = color["black"]
c.colors.prompts.fg = color["black"]
c.colors.prompts.selected.bg = color["blue"]
c.colors.statusbar.caret.bg = color["blue"]
c.colors.statusbar.caret.fg = color["bright"]
c.colors.statusbar.caret.selection.bg = color["blue"]
c.colors.statusbar.caret.selection.fg = color["bright"]
c.colors.statusbar.command.bg = color["black"]
c.colors.statusbar.command.fg = color["white"]
c.colors.statusbar.command.private.bg = color["black"]
c.colors.statusbar.command.private.fg = color["white"]
c.colors.statusbar.insert.bg = color["black"]
c.colors.statusbar.insert.fg = color["white"]
c.colors.statusbar.normal.bg = color["black"]
c.colors.statusbar.normal.fg = color["white"]
c.colors.statusbar.passthrough.bg = color["black"]
c.colors.statusbar.passthrough.fg = color["white"]
c.colors.statusbar.private.bg = color["black"]
c.colors.statusbar.private.fg = color["white"]
c.colors.statusbar.progress.bg = color["white"]
c.colors.statusbar.url.error.fg = color["red"]
c.colors.statusbar.url.fg = color["white"]
c.colors.statusbar.url.hover.fg = color["white"]
c.colors.statusbar.url.success.http.fg = color["red"]
c.colors.statusbar.url.success.https.fg = color["white"]
c.colors.statusbar.url.warn.fg = color["yellow"]
c.colors.tabs.bar.bg = color["blue"]
c.colors.tabs.even.bg = color["black"]
c.colors.tabs.even.fg = color["white"]
c.colors.tabs.indicator.error = color["red"]
c.colors.tabs.indicator.start = color["blue"]
c.colors.tabs.indicator.stop = color["green"]
c.colors.tabs.indicator.system = "rgb"
c.colors.tabs.odd.bg = color["black"]
c.colors.tabs.odd.fg = color["white"]
c.colors.tabs.pinned.even.bg = color["black"]
c.colors.tabs.pinned.even.fg = color["white"]
c.colors.tabs.pinned.odd.bg = color["black"]
c.colors.tabs.pinned.odd.fg = color["white"]
c.colors.tabs.pinned.selected.even.bg = color["blue"]
c.colors.tabs.pinned.selected.even.fg = color["bright"]
c.colors.tabs.pinned.selected.odd.bg = color["blue"]
c.colors.tabs.pinned.selected.odd.fg = color["bright"]
c.colors.tabs.selected.even.bg = color["blue"]
c.colors.tabs.selected.even.fg = color["bright"]
c.colors.tabs.selected.odd.bg = color["blue"]
c.colors.tabs.selected.odd.fg = color["bright"]
c.colors.webpage.bg = color["black"]
# c.colors.webpage.darkmode.algorithm = color.black
# c.colors.webpage.darkmode.contrast = color.black
# c.colors.webpage.darkmode.enabled = color.black
# c.colors.webpage.darkmode.grayscale.all = color.black
# c.colors.webpage.darkmode.grayscale.images = color.black
# c.colors.webpage.darkmode.policy.images = color.black
# c.colors.webpage.darkmode.policy.page = color.black
# c.colors.webpage.darkmode.threshold.background = color.black
# c.colors.webpage.darkmode.threshold.text = color.black
c.colors.webpage.preferred_color_scheme = "dark"
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=223428 ",
    "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-social.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-unbreak.txt"]
c.content.blocking.enabled = True
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
]
c.content.blocking.method = 'auto'
c.content.blocking.whitelist = []

# Keybindings

c.bindings.commands = {
    "normal": {
        "J": "tab-prev",
        "K": "tab-next",
        "M": "hint links spawn mpv {hint-url}",
        "Z": "hint links spawn alacritty --command youtube-dl {hint-url}"
    }
}

config.load_autoconfig(False)
