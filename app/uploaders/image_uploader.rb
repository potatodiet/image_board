class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg png webp]
  end

  version(:thumbnail) do
    process(resize_to_fit: [150, 150])
  end
end
