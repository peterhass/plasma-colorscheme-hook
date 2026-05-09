# Plasma Colorscheme Hook

Lightweight D-Bus companion service for KDE Plasma 6's native day/night global theme switching. Listens to `xdg-desktop-portal` `color-scheme` changes and executes custom scripts in `~/.local/share/light-mode.d/` and `~/.local/share/dark-mode.d/`.

## Setup

```bash
make install
make enable
```

## How it works

- Monitors `org.freedesktop.portal.Desktop` for `color-scheme` changes via `gdbus monitor`.
- Maps `uint32 1` → dark mode, `uint32 2` (and `0`) → light mode.
- Runs all executable files in the matching directory sequentially.
- Maintains state in `~/.cache/plasma-colorscheme-hook-state` to avoid duplicate runs.
- Logs to stderr (visible via `journalctl --user -u plasma-colorscheme-hook`).

## Directories

- `~/.local/share/light-mode.d/` — scripts to run when switching to light mode
- `~/.local/share/dark-mode.d/` — scripts to run when switching to dark mode
