require_relative "./xrandr_parser.rb"
require_relative "./window_info.rb"

position = ARGV[0]

xrandrOut = `xrandr`.split("\n")

monitors = XrandrParser.new(xrandrOut).getMonitors
windowPosition = WindowInfo.getStartPosition
windowMonitor = monitors.getWindowMonitor(windowPosition[:startX], windowPosition[:startY])

#Reset our maximization state. Can't swap while maximized.
system("wmctrl -r :ACTIVE: -b remove,maximized_horz,maximized_vert")

if position == "left"
  system("wmctrl -r :ACTIVE: -e 0,#{windowMonitor[:startX]},0,#{windowMonitor[:width]/2},#{windowMonitor[:height]}")
elsif position == "right"
  system("wmctrl -r :ACTIVE: -e 0,#{windowMonitor[:startX]+windowMonitor[:width]/2},0,#{windowMonitor[:width]/2},#{windowMonitor[:height]}")
elsif position == "top"
  system("wmctrl -r :ACTIVE: -e 0,-1,0,-1,#{windowMonitor[:height]/2}")
elsif position == "bottom"
  system("wmctrl -r :ACTIVE: -e 0,-1,#{windowMonitor[:height]/2},-1,#{windowMonitor[:height]/2}")
end

