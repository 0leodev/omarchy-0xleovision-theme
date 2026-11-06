# 0xleovision

> [!IMPORTANT]
> Use **Ghostty**, **Kitty**, or **Alacritty** as your terminal. **Foot is not supported.**

## Install

### Quick install (recommended)

Installs the theme with all fixes applied.

Run:

```bash
omarchy theme install https://github.com/0leodev/omarchy-0xleovision-theme.git \
  && rm -rf ~/.config/omarchy/themes/0xleovision/.git \
  && omarchy theme set 0xleovision \
  && mkdir -p ~/.config/gtk-4.0 \
  && printf 'window {\n    backdrop-filter: blur(20px);\n}\n' > ~/.config/gtk-4.0/gtk.css
```

What it does:

1. Installs the theme.
2. Removes `.git` so all styles are applied.
3. Activates the theme.
4. Adds the GTK blur fix.

### Basic install

Installs the theme only without fixes.

Run:

```bash
omarchy theme install https://github.com/0leodev/omarchy-0xleovision-theme.git
```

## Fixes explained

### Why remove `.git`?

Omarchy blocks `*.lua` files, terminal configs, and `vscode.json` from themes that still have a `.git` directory, because it treats them as third-party themes that could run malicious code. Removing it is a temporary workaround until Omarchy provides a proper fix. See [Omarchy theming](https://github.com/omacom/omarchy/blob/quattro/docs/theming.md).

Run:

```bash
rm -rf ~/.config/omarchy/themes/0xleovision/.git && omarchy theme set 0xleovision
```

### Blur not working in GTK apps

> [!NOTE]
> Known Hyprland bug: [Blur not working in GTK apps in latest version #16507](https://github.com/hyprwm/Hyprland/discussions/16507).

Run:

```bash
mkdir -p ~/.config/gtk-4.0 && printf 'window {\n    backdrop-filter: blur(20px);\n}\n' > ~/.config/gtk-4.0/gtk.css
```

Or create `~/.config/gtk-4.0/gtk.css` manually with:

```css
window {
    backdrop-filter: blur(20px);
}
```

## Troubleshooting

> [!TIP]
> If the theme still doesn't look right, back up `~/.config/hypr/looknfeel.lua`, then reset it to default or empty it. It may override the theme's styling.

## Preview

![Desktop preview](https://github.com/user-attachments/assets/11b24fb8-8a26-4612-97d5-6eeac71f3e7c)

### Menu

![Menu preview](https://github.com/user-attachments/assets/cdaab644-fc6b-4aaa-ab4f-f5d48e3f9ff5)

### Apps (omarchy-dock-apps)

![Dock apps preview](https://github.com/user-attachments/assets/379576a6-5a1d-4362-8c98-2656b3f79bac)

### Popups

![Popups preview](https://github.com/user-attachments/assets/30884975-e24e-4726-bfca-85f0e5dff99d)

### Updating

![Update screen preview](https://github.com/user-attachments/assets/66d51d8e-168e-481f-8ece-208b775f084f)
