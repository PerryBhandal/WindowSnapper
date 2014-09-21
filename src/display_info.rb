class Monitors

  def initialize
    @monitors = []
  end

  def whichMonitor(startX)

    @monitors.each do |monitor|
      if startX >= monitor[:start] and startX <= monitor[:end]
        puts "Window at position #{startX} is on monitor #{monitor[:name]}"
      end
      
    end

  end

  def addMonitor(name, startX, width)
    @monitors.push({:name => name, :start => startX, :end => (startX+width-1)})
  end

end

