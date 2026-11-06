Please use Ghostty, Kitty, or Alacritty as the terminal. **Don't use Foot**.

> [!CAUTION]
> **Remove the theme's `.git` file to apply all the styles**, this until Omarchy finds a proper security fix of this [Omarchy theming](https://github.com/omacom/omarchy/blob/quattro/docs/theming.md) (Omarchy purposely blocks any *.lua files, terminal configs, and vscode.json files from themes installed when the `.git` file is present, because ".git" tells Omarchy that it's a theme from someone
who could run and inject malicious code).
```bash
rm -rf ~/.config/omarchy/themes/0xleovision/.git && omarchy theme set 0xleovision
```
> If it still doesn't look the way it should, back up your `~/.config/hypr/looknfeel.lua`, then revert that file to default or empty it. It may override this config's styling.

# [Blur not working in GTK apps in latest version #16507](https://github.com/hyprwm/Hyprland/discussions/16507)
**Fix in single-line command:**
```bash
mkdir -p ~/.config/gtk-4.0 && printf 'window {\n    backdrop-filter: blur(20px);\n}\n' > ~/.config/gtk-4.0/gtk.css
```
- Create this new file `~/.config/gtk-4.0/gtk.css`
- And write the next code there:
```css
window {
    backdrop-filter: blur(20px);
}
```

# Installation
```bash
omarchy theme install https://github.com/0leodev/omarchy-0xleovision-theme.git
```

# Preview
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/11b24fb8-8a26-4612-97d5-6eeac71f3e7c" />

## Menu
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/cdaab644-fc6b-4aaa-ab4f-f5d48e3f9ff5" />

## Apps (omarchy-dock-apps)
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/379576a6-5a1d-4362-8c98-2656b3f79bac" />

## Popups
<img width="1920" height="670" alt="image" src="https://github.com/user-attachments/assets/30884975-e24e-4726-bfca-85f0e5dff99d" />

## Updating
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/66d51d8e-168e-481f-8ece-208b775f084f" />
