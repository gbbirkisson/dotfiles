local home = os.getenv("HOME")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "desc:Chimei Innolux Corporation 0x14C9", mode = "preferred", position = "860x1440", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "0x0", scale = 1 })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = home .. "/.local/scripts/cwdshell"
local fileManager = "dolphin"
local menu = "wofi -G --show drun"
local bg_rand = home .. "/.local/scripts/hyprpaper-randomize"
local move_all = home .. "/.local/scripts/hypr-move-all"
local swap_ws = home .. "/.local/scripts/hypr-swap-workspace"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("swaync")
	hl.exec_cmd("batsignal")
	-- hl.exec_cmd("hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env(
	"PATH",
	home
		.. "/.local/scripts:"
		.. home
		.. "/.local/bin:"
		.. home
		.. "/.cargo/bin:"
		.. home
		.. "/go/bin:"
		.. os.getenv("PATH")
)
hl.env("WALLPAPERS", home .. "/.local/wallpapers")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({ ecosystem = { enforce_permissions = true } })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 0,

		border_size = 1,

		col = {
			active_border = "rgb(507ba3)",
			inactive_border = "rgb(3e4451)",
		},

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = { enabled = false },
		blur = { enabled = false },
	},

	animations = { enabled = false },
})

-- No border when only one tiled window
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-border-single-tv",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
})
hl.window_rule({
	name = "no-border-single-f",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
})

hl.config({
	dwindle = {
		preserve_split = true,
		force_split = 2, -- Always split on the right
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = "rgb(1e222a)",
		vrr = 1,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,is,no",
		kb_variant = "",
		kb_model = "",
		kb_rules = "",
		kb_options = "caps:swapescape,grp:alt_space_toggle",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = { natural_scroll = false },
	},

	cursor = {
		inactive_timeout = 2,

		-- https://github.com/hyprwm/Hyprland/issues/1520
		-- no_hardware_cursors = true,
		-- use_cpu_buffer = true,
	},

	binds = {
		allow_workspace_cycles = true,
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(bg_rand))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + X", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + V", hl.dsp.layout("preselect d"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("((pgrep 1password && 1password --lock) || true) && hyprlock"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(
	mainMod .. " + ALT + BackSpace",
	hl.dsp.exec_cmd(
		'hyprctl switchxkblayout all next && notify-send -t 1500 -h string:x-canonical-private-synchronous:kblayout "Keyboard" "$(hyprctl devices -j | jq -r \'.keyboards[] | select(.main==true) | .active_keymap\')"'
	)
)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Laptop lid switch
hl.bind(
	"switch:on:Lid Switch",
	hl.dsp.exec_cmd("((pgrep 1password && 1password --lock) || true); hyprlock & systemctl suspend"),
	{ locked = true }
)

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces, move the active window, or move every window on the workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
	hl.bind(mainMod .. " + CTRL + SHIFT + " .. key, hl.dsp.exec_cmd(move_all .. " " .. i))
end

-- Swap this workspace with its neighbour, following the windows
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.exec_cmd(swap_ws .. " -1"))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd(swap_ws .. " +1"))

-- Move workspaces between monitors
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + less", hl.dsp.workspace.move({ monitor = "+1" }))

-- Resize windows
hl.define_submap("resize", function()
	hl.bind("l", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
	hl.bind("h", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))
	hl.bind("Escape", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

-- Log out
hl.define_submap("logout?", function()
	hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
	hl.bind("Escape", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.submap("logout?"))

-- Shut down
hl.define_submap("shutdown?", function()
	hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("systemctl poweroff"))
	hl.bind("Escape", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.submap("shutdown?"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- hyprctl clients
hl.window_rule({ name = "signal-ws", match = { class = "^(signal)$" }, workspace = 6 })
hl.window_rule({ name = "firefox-ws", match = { class = "^(firefox-esr)$" }, workspace = 7 })
hl.window_rule({ name = "spotify-ws", match = { class = "^(spotify)$" }, workspace = 8 })
hl.window_rule({ name = "1password-ws", match = { class = "^(1password)$", float = false }, workspace = 9 })
hl.window_rule({ name = "slack-ws", match = { class = "^(Slack)$" }, workspace = 10 })

-- Drop maximize requests from all windows so apps can't break the tiling layout
hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Prevent invisible XWayland drag-and-drop helper windows from stealing focus
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Screenshot: select region with slurp, capture with grim, annotate with satty
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp -d)" - | satty --filename - --copy-command wl-copy --early-exit --initial-tool arrow --annotation-size-factor 0.4 --font-family monospace --fullscreen'
	)
)
hl.window_rule({ name = "satty", match = { title = "^(satty)$" }, float = true })
