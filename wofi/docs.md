wofi(5) File Formats Manual wofi(5)

NAME
wofi - configuration file and styling

DESCRIPTION
Wofi's configuration format is very simple, consisting of key value pairs in snake case. The majority of the config options are the command line options, there are however a small
handful of options only accessible via wofi's config.

       Mode specific options for the built-in modes are documented in wofi(7). They are placed in the config file in the format mode-example_opt=val.  For  example  dmenu  has  an  option
       called parse_action which would be placed in the config as dmenu-parse_action=true.

       Anything  following a # is considered to be a comment unless the # is prefixed with a \. For this reason in order to put a backslash in the config it must be escaped as well giving
       \\.

CONFIG OPTIONS
Most of the options here are the command flags as found in wofi(1) in snake case, however some are unique to the config.

       style=PATH
              Specifies the CSS file to use as the stylesheet.

       stylesheet=PATH
              Specifies the CSS file to use as the stylesheet. This option is NOT the same as style. Absolute paths are absolute however relative paths are relative  to  the  wofi  config
              folder  location  $XDG_CONFIG_HOME/wofi and NOT the current working directory as they are with style. They are also NOT relative to the path as specified by --conf. This op‐
              tion comes from rootbar and is probably more confusing than it's worth. You should probably use style unless you're sure this is what you want.

       color=PATH
              Specifies the colors file to use.

       colors=PATH
              Specifies the colors file to use. This option is NOT the same as color. Absolute paths are absolute however relative paths are relative to the wofi  config  folder  location
              $XDG_CONFIG_HOME/wofi  and  NOT  the  current working directory as they are with color. They are also NOT relative to the path as specified by --conf. This option comes from
              rootbar and is probably more confusing than it's worth. You should probably use color unless you're sure this is what you want.

       show=MODE
              Specifies the mode to run in. A list of modes can be found in wofi(7).

       mode=MODE
              Identical to show.

       width=WIDTH
              Specifies the menu width in pixels or percent of screen size, default is 50%. Pixels are used unless the number ends with a %.

       height=HEIGHT
              Specifies the menu height in pixels or percent of screen size, default is 40%. Pixels are used unless the number ends with a %.

       prompt=PROMPT
              Sets the prompt to be display in the search box, default is the name of the mode.

       xoffset=OFFSET
              Sets the x offset from the location in pixels, default is 0.

       x=OFFSET
              Identical to xoffset.

       yoffset=OFFSET
              Sets the y offset from the location in pixels, default is 0.

       y=OFFSET
              Identical to yoffset.

       normal_window=BOOL
              If true runs wofi in a normal window instead of using wlr-layer-shell, default is false.

       allow_images=BOOL
              If true allows image escape sequences to be processed and rendered, default is false.

       allow_markup=BOOL
              If true allows pango markup to be processed and rendered, default is false.

       cache_file=PATH
              Specifies the cache file to load/store cache, default is $XDG_CACHE_HOME/wofi-<mode name> where <mode name> is the name of the mode,  if  $XDG_CACHE_HOME  is  not  specified
              ~/.cache is used.

       term=TERM
              Specifies the term to use when running a program in a terminal. This overrides the default terminal run order which is kitty, alacritty, wezterm, foot, termite, gnome-termi‐
              nal, weston-terminal in that order.

       password=CHARACTER
              Runs wofi in password mode using the specified character, default is false.

       exec_search=BOOL
              If true activiating a search with enter will execute the search not the first result, default is false.

       hide_scroll=BOOL
              If true hides the scroll bars, default is false.

       matching=MODE
              Specifies the matching mode, it can be either contains, multi-contains, or fuzzy, default is contains.

       insensitive=BOOL
              If true enables case insensitive search, default is false.

       parse_search=BOOL
              If true parses out image escapes and pango preventing them from being used for searching, default is false.

       location=LOCATION
              Specifies the location. See wofi(7) for more information, default is center.

       no_actions=BOOL
              If true disables multiple actions for modes that support it, default is false.

       lines=LINES
              Specifies the height in number of lines instead of pixels.

       columns=COLUMNS
              Specifies the number of columns to display, default is 1.

       sort_order=ORDER
              Specifies the default sort order. There are currently two orders, default and alphabetical. See wofi(7) for details.

       gtk_dark=BOOL
              If true, instructs wofi to use the dark variant of the current GTK theme (if available). Default is false.

       search=STRING
              Specifies something to search for immediately on opening

       monitor=STRING
              Sets the monitor to open on

       pre_display_cmd=COMMAND
              Specifies  a printf-like string which is used on the entries prior to displaying them. This command is only used to represent the label widget's string, and won't affect the
              the output of the selected label.

       orientation=ORIENTATION
              Specifies the orientation, it can be either horizontal or vertical, default is vertical.

       halign=ALIGN
              Specifies the horizontal align for the entire scrolled area, it can be any of fill, start, end, or center, default is fill.

       content_halign=ALIGN
              Specifies the horizontal align for the individual entries, it can be any of fill, start, end, or center, default is fill.

       valign=ALIGN
              Specifies the vertical align for the entire scrolled area, it can be any of fill, start, end, or center, the default is orientation dependent. If vertical then  it  defaults
              to start, if horizontal it defaults to center.

       filter_rate=RATE
              Specifies the rate at which search results are updated in milliseconds, default is 100.

       image_size=SIZE
              Specifies the size of images in pixels when images are enabled, default is 32.

       key_up=KEY
              Specifies the key to use in order to move up. Default is Up(Up arrow). See wofi-keys(7) for the key codes.

       key_down=KEY
              Specifies the key to use in order to move down. Default is Down(Down arrow). See wofi-keys(7) for the key codes.

       key_left=KEY
              Specifies the key to use in order to move left. Default is Left(Left arrow). See wofi-keys(7) for the key codes.

       key_right=KEY
              Specifies the key to use in order to move right. Default is Right(Right arrow). See wofi-keys(7) for the key codes.

       key_forward=KEY
              Specifies the key to use in order to move forward. Default is Tab. See wofi-keys(7) for the key codes.

       key_backward=KEY
              Specifies the key to use in order to move backward. Default is ISO_Left_Tab(Shift+Tab). See wofi-keys(7) for the key codes.

       key_submit=KEY
              Specifies the key to use in order to submit an action. Default is Return. See wofi-keys(7) for the key codes.

       key_exit=KEY
              Specifies the key to use in order to exit wofi. Default is Escape. See wofi-keys(7) for the key codes.

       key_pgup=KEY
              Specifies the key to use in order to move one page up. Default is Page_Up. See wofi-keys(7) for the key codes.

       key_pgdn=KEY
              Specifies the key to use in order to move one page down. Default is Page_Down. See wofi-keys(7) for the key codes.

       key_expand=KEY
              Specifies the key to use in order to expand/contract multi-action entires. There is no default. See wofi-keys(7) for the key codes.

       key_hide_search=KEY
              Specifies the key to use in order to hide/show the search bar. There is no default. See wofi-keys(7) for the key codes.

       key_copy=KEY
              Specifies the key to use in order to copy the action text for the current entry. The default is Ctrl-c. See wofi-keys(7) for the key codes.

       key_custom_(n)=KEY
              Allows  for  configuring  custom  exit  codes. For example setting key_custom_0=Ctrl-0 will make it so if you press Ctrl-0 wofi will set its exit status to 10. This will not
              cause wofi to exit, it will only set its exit code for when it does. 20 of these keys are configurable numbered 0-19. The exit status used is 10+n where n is the number  at‐
              tached to key_custom_n. There are no defaults for these. See wofi-keys(7) for the key codes.

       line_wrap=MODE
              Specifies the line wrap mode to use. The options are off, word, char, and word_char. Default is off.

       global_coords=BOOL
              Specifies whether x and y offsets should be calculated using the global compositor space instead of the current monitor. Default is false. This does not play well with loca‐
              tions and using it with them is not advised.

       hide_search=BOOL
              Specifies whether the search bar should be hidden. Default is false.

       dynamic_lines=BOOL
              Specifies whether wofi should be dynamically shrunk to fit the number of visible lines or if it should always stay the same size. Default is false.

       layer=LAYER
              Specifies the layer to open on. The options are background, bottom, top, and overlay. Default is top

       copy_exec=PATH
              Specifies the executable to pipe copy data into. $PATH will be scanned, this is not passed to a shell and must be an executable. Default is wl-copy.

       single_click=BOOL
              Specifies whether or not actions should be executed on a single click or a double click. Default is false.

       pre_display_exec=BOOL
              This modifies the behavior of pre_display_cmd and causes the command in question to be directly executed via fork/exec rather than through the shell.

CSS SELECTORS
Any GTK widget can be selected by using the name of its CSS node, these however might change with updates and are not guaranteed to stay constant. Wofi also provides certain wid‐
gets with names and classes which can be referenced from CSS to give access to the most important widgets easily. wofi(7) contains the current widget layout used by wofi so if you
want to get into CSS directly using GTK widget names look there for info.

       #window
              The name of the window itself.

       #outer-box
              The name of the box that contains everything.

       #input
              The name of the search bar.

       #scroll
              The name of the scrolled window containing all of the entries.

       #inner-box
              The name of the box containing all of the entries.

       #img
              The name of all images in entries displayed in image mode.

       #text
              The name of all the text in entries.

       #unselected
              The name of all entries currently unselected. A better way of doing this is to do #entry and combine that with #entry:selected

       #selected
              The name of all entries currently selected. A better way of doing this is to do #entry:selected

       .entry
              The class attached to all entries. This is attached to the inside property box and is old, you probably want #entry instead

       #entry
              The name of all entries.

       #expander-box
              The name of all boxes shown when expanding entries with multiple actions

COLORS
The colors file should be formatted as new line separated hex values. These values should be in the standard HTML format and begin with a hash. These colors will be loaded however
wofi doesn't know what color should be used for what so you must reference them from your CSS.

       You can reference these from your CSS by doing --wofi-color<n> where <n> is the line number - 1. For example to reference the color on line 1 you would do --wofi-color0.

       The colors can also be referenced by doing --wofi-rgb-color<n> where <n> is the line number - 1. The difference between these is the format used to replace the macro.

       --wofi-color<n> is replaced with an HTML color code in the format #FFFFFF. --wofi-rgb-color<n> is replaced with comma separated rgb values in the format 255, 255, 255. The  correct
       usage  of  --wofi-rgb-color<n>  is  to  wrap  it  in  rgb()  or  rgba().  Note  that  it  does  not  return  an  alpha  value  so  combining  it  with rgba() should be done like so
       rgba(--wofi-rgb-color0, 0.8). This would set the color to line 1 with an opacity of 80%.

                                                                                                                                                                                    wofi(5)
