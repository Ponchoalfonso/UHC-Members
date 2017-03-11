class CommunityController < ApplicationController

  def index
    @communityConfig = CommunityConfig.first
  end

end
