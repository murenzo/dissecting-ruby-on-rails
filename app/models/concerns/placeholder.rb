module Placeholder
  extend ActiveSupport::Concern

  def image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}"
  end
end
