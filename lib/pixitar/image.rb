module Pixitar
  class Image
    attr_reader :image_lib
    attr_reader :image

    def initialize(image_lib = ChunkyPNG::Image, height = 400, width = 400)
      @image_lib = image_lib
      @image = image_lib.new(height, width)
    end

    def compose(filename)
      canvas = image_lib.from_file(filename)
      image.compose!(canvas, 0, 0)
    end

    def save(filename)
      image.save(filename, interlace: true)
    end
  end
end
