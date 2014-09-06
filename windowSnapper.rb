# Panel height is the height of our top panel. To find it, run
# xdotool getmouselocation while you have your mouse at the botom of the panel.
# Enter the y value to the constant below.
PANEL_HEIGHT = 25

position = nil
height = nil

def getScreenDimensions()
	screenSizeStr = `xdpyinfo | grep 'dimensions:'`
	dimensionsCut = screenSizeStr.scan(/dimensions.*?(\d+).(\d+) /)
	horizontal = dimensionsCut[0][0].to_i
	vertical = dimensionsCut[0][1].to_i-PANEL_HEIGHT
	return { :horizontal => horizontal, :vertical => vertical}
end

if ARGV[0] != nil
	position = ARGV[0]
end

if ARGV[1] != nil
	height = ARGV[1]
end

screenDimensions = getScreenDimensions()

#Reset our maximization state. Can't swap while maximized.
system("wmctrl -r :ACTIVE: -b remove,maximized_horz,maximized_vert")

if position == "left"
	system("wmctrl -r :ACTIVE: -e 0,0,0,#{screenDimensions[:horizontal]/2},#{screenDimensions[:vertical]}")
elsif position == "right"
	system("wmctrl -r :ACTIVE: -e 0,#{screenDimensions[:horizontal]/2},0,#{screenDimensions[:horizontal]/2},#{screenDimensions[:vertical]}")
end
