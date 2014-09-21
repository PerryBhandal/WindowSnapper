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

  ####
  # Three horizontal multi-monitor test
  ####

  def testMonitorOneWindowLowerBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP1", getMonitorName(monitors, 0, 0))
  end

  def testMonitorOneWindowUpperBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP1", getMonitorName(monitors, 1919, 1199))
  end

  def testMonitorTwoWindowLowerBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP2", getMonitorName(monitors, 1920, 1199))
  end

  def testMonitorTwoWindowUpperBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP2", getMonitorName(monitors, 3839, 1199))
  end

  def testMonitorThreeWindowLowerBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP3", getMonitorName(monitors, 3840, 1199))
  end

  def testMonitorThreeWindowUpperBound
    monitors = createThreeHoriMonitors
    assert_equal("DFP3", getMonitorName(monitors, 5759, 1199))
  end


  private

  def createSingleMonitor
    monitors = Monitors.new
    monitors.addMonitor("DFP1", 0, 1920, 0, 1200)
    monitors
  end

  def createThreeHoriMonitors
    monitors = Monitors.new
    monitors.addMonitor("DFP1", 0, 1920, 0, 1200)
    monitors.addMonitor("DFP2", 1920, 1920, 0, 1200)
    monitors.addMonitor("DFP3", 3840, 1920, 0, 1200)
    monitors
  end

  def getMonitorName(monitors, startX, startY)
    return monitors.getWindowMonitor(startX, startY)[:name]
  end

end 
