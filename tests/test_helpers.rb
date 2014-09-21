class TestHelpers 

  BASE_TEST_DIR = "tests/"

  def TestHelpers.getFile(filePath)
    return File.readlines(BASE_TEST_DIR+filePath)
  end

end

