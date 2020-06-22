require "test_helper"

class PixitarTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Pixitar::VERSION
  end

  def setup
    @avatar = Pixitar::Avatar.new
  end

  def test_initializer_with_default_values
    assert_kind_of Pixitar::Image, @avatar.image
    assert_equal "images", @avatar.assets_path
    assert_equal "png", @avatar.image_extention
  end

  def test_predefined_parts_is_array
    assert_kind_of Array, @avatar.face_parts
  end

  def test_predefined_parts_is_not_empty
    refute_empty @avatar.face_parts
  end

  def test_predefined_genders_is_array
    assert_kind_of Array, @avatar.genders
  end

  def test_predefined_genders_with_correct_values
    assert_equal [:male, :female], @avatar.genders
  end

  def test_random_gender
    assert_includes [:male, :female], @avatar.random_gender
  end

  def test_avatar_generation_with_invalid_gender
    assert_raises Pixitar::Avatar::InvalidGenderError do
      @avatar.generate_avatar(:human)
    end
  end

  def test_random_asset_for_with_empty_files
    assert_raises Pixitar::Avatar::MissingImageFilesError do
      @avatar.stub(:assets, []) do
        @avatar.send(:random_asset_for, :eye)
      end
    end
  end

  def test_random_asset_for_with_valid_files
    asset = @avatar.stub(:assets, ["images/male/eye1.png"]) {
      @avatar.send(:random_asset_for, :eye)
    }
    assert_equal "images/male/eye1.png", asset
  end

  def test_assets_to_return_list_of_files
    assets = @avatar.stub(:path, "test/images/male/*.png") {
      @avatar.send(:assets)
    }
    assert_kind_of Array, assets
    assert_equal ["test/images/male/eye1.png"], assets
  end

  def test_path_generation
    avatar = Pixitar::Avatar.new(Pixitar::Image.new, {assets_path: "images", image_extention: "png"})
    avatar.stub(:gender, :male) do
      assert_equal "images/male/*.png", avatar.send(:path)
    end
  end
end
