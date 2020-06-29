module Pixitar
  class Avatar
    class InvalidGenderError < StandardError; end
    class MissingImageFilesError < StandardError; end

    attr_reader :image
    attr_reader :assets_path
    attr_reader :image_extention
    attr_reader :gender

    def initialize(image_class = Pixitar::Image.new, opts = {})
      @image = image_class
      @assets_path = opts.fetch(:assets_path, "data/images")
      @image_extention = opts.fetch(:image_extention, "png")
    end

    def face_parts
      [
        :background,
        :clothes,
        :face,
        :hair,
        :mouth,
        :eye
      ]
    end

    def genders
      [
        :male,
        :female
      ]
    end

    def random_gender
      genders.sample
    end

    def male_avatar
      generate_avatar(:male)
    end

    def female_avatar
      generate_avatar(:female)
    end

    def generate_avatar(gender = random_gender, filename = "avatar.png")
      @gender = gender
      raise InvalidGenderError unless genders.include?(gender)

      create_avatar_image(filename)
    end

    private

    def create_avatar_image(filename)
      face_parts.map do |face_part|
        asset = random_asset_for(face_part)
        image.compose(asset)
      end
      image.save(filename)
    end

    def random_asset_for(face_part)
      parts = assets.grep(/#{face_part}/)
      raise MissingImageFilesError, "Missing #{face_part} image files for #{gender} avatars" if parts.empty?

      parts.sample
    end

    def assets
      @assets ||= Dir.glob(path)
    end

    def path
      File.join(assets_path, gender.to_s, "*.#{image_extention}")
    end
  end
end
