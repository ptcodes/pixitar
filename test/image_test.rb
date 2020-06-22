require "test_helper"

class ImageTest < Minitest::Test
  def setup
    @image = Pixitar::Image.new
  end

  def test_initializer_with_default_values
    assert_kind_of ChunkyPNG::Image, @image.image
  end

  def test_compose
    original_image = @image.image.dup
    filename = File.join("test", "images", "male", "eye1.png")
    @image.send(:compose, filename)
    refute_equal original_image, @image.image
  end
end
