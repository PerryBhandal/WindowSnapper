# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^(tests/.+_test\.rb)$}) { |m| system("clear; ruby #{m[1]}") }
  watch(%r{^src/(/.+)\.rb$}) do |m|
    testPath = "tests/#{m[1]}_test.rb"
    if File.exist?(testPath)
      system("clear; ruby #{testPath}")
    end
  end
end

