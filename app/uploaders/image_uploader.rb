class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage(:file)

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  version(:thumbnail) do
    process(:resize_to_fit => [150, 150])
  end
end
