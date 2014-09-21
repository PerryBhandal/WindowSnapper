require_relative "./display_info.rb"

class XrandrParser

  def initialize(xrOut)
    @xrOut = xrOut
  end

  def getMonitors
    monitors = Monitors.new
    @xrOut.each do |line|
      if line.include?(" connected ")
        monitorInfo = line.scan(/^(.*?) connected (\d+)x(\d+)\+(\d+)\+(\d+) \(/).at(0)
        monitors.addMonitor(monitorInfo[0], monitorInfo[3].to_i, monitorInfo[1].to_i, monitorInfo[4].to_i, monitorInfo[2].to_i)
      end
    end

    monitors
  end
end

