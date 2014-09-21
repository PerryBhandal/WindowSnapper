class WindowInfo

  def WindowInfo.getStartPosition
    dimensions = {}
    xwinOutput = `xwininfo -id $(xdotool getactivewindow)`
    xwinOutput = xwinOutput.split("\n")

    xwinOutput.each do |line|
      if line.include?("Absolute upper-left X:")
        dimensions[:startX] = line.scan(/Absolute upper-left X:.*?(\d+)/).at(0).at(0).to_i
      elsif line.include?("Absolute upper-left Y:")
        dimensions[:startY] = line.scan(/Absolute upper-left Y:.*?(\d+)/).at(0).at(0).to_i
      end
    end

    dimensions
  end

end
