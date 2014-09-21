class Monitors

  def initialize
    @monitors = []
  end

  def getWindowMonitor(startX, startY)
    @monitors.each do |monitor|
      if (startX >= monitor[:startX] and startX <= monitor[:endX]) and (startX >= monitor[:startY] and startY <= monitor[:endY])
        return monitor
      end
    end

    #If we reach this point, we've asked for a window with starting dimensions that are unrecognized.
    raise(ArgumentError, "%d or %d is not within any monitor's dimensions" % [startX, startY])
  end

  def addMonitor(name, startX, width, startY, height)
    monitorInfo = {}
    monitorInfo[:startX] = startX
    monitorInfo[:endX] = (startX + width) - 1
    monitorInfo[:startY] = startY
    monitorInfo[:endY] = (startY + height)
    monitorInfo[:name] = name
    @monitors.push(monitorInfo)
  end

end
