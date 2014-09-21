require "test/unit"
require "mocha/test_unit"

require_relative "../src/display_info"

class TestDisplayInfo < Test::Unit::TestCase

  #####
  # Single monitor tests
  #####

  def testSingleMonXYLowerBound
    monitors = createSingleMonitor
    assert_equal("DFP1", getMonitorName(monitors, 0, 0))
  end

  def testSingleMonXYLowerBoundPlusOne
    monitors = createSingleMonitor
    assert_equal("DFP1", getMonitorName(monitors, 1, 1))
  end

  def testSingleMonXYUpperBound
    monitors = createSingleMonitor
    assert_equal("DFP1", getMonitorName(monitors, 1919, 1199))
  end

  def testSingleMonXYUpperBoundMinusOne
    monitors = createSingleMonitor
    assert_equal("DFP1", getMonitorName(monitors, 1918, 1198))
  end

  def testExceptionSingleMonXYLowerBoundMinusOne
    monitors = createSingleMonitor
    assert_raise(ArgumentError) {getMonitorName(monitors, -1, -1)} 
  end

  def testExceptionSingleMonXYUpperBoundPlusOne
    monitors = createSingleMonitor
    assert_raise(ArgumentError) {getMonitorName(monitors, 1920, 1200)} 
  end


  private

  def createSingleMonitor
    monitors = Monitors.new
    monitors.addMonitor("DFP1", 0, 1920, 0, 1200)
    monitors
  end

  def getMonitorName(monitors, startX, startY)
    return monitors.getWindowMonitor(startX, startY)[:name]
  end

end 
