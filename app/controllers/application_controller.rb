class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = AbdulViewTool::Renderer.copyright 'Banjoko Azeez', 'All rights reserved'
  end
end

module AbdulViewTool
  class Renderer
    def self.copyright(name, message)
      "&copy; #{Time.now.year} | <b>#{name}</b> #{message}".html_safe
    end
  end
end
