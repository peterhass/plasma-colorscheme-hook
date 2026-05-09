install:
	install -D --mode=0755 ./plasma-colorscheme-hook $(HOME)/.local/bin/plasma-colorscheme-hook
	install -D --mode=0644 ./plasma-colorscheme-hook.service $(HOME)/.config/systemd/user/plasma-colorscheme-hook.service

	systemctl --user daemon-reload

enable:
	systemctl --user enable --now plasma-colorscheme-hook.service
