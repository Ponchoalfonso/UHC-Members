class CommunityController < ApplicationController
  before_action :set_member, only: [:show]
  before_action :set_configs

  def index
  end

  def show
  end

  private
    def set_member
      @member = Member.where(nickname: params[:nickname]).first;
    end

    def set_configs
      @communityConfig = CommunityConfig.first
    end

end
