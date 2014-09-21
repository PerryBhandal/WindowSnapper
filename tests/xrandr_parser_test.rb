require "test/unit"
require "mocha/test_unit"

require_relative "test_helpers"
require_relative "../src/xrandr_parser"

class TestXrandrParser < Test::Unit::TestCase

  def testDesktopThreeScreens
    xrOut = TestHelpers.getFile("./xrandr_output/three_1920_1200_monitors.txt")
    xrParser = XrandrParser.new(xrOut) 
    xrParser.getMonitors
  end

end 
