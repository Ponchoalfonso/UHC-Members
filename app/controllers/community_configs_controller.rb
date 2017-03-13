class CommunityConfigsController < ApplicationController
  before_action :set_community_config, only: [:show, :edit, :update, :destroy]
  before_action :set_configs
  before_action :authenticate_member!

  # GET /community_configs
  # GET /community_configs.json
  def index
    @community_configs = CommunityConfig.all
  end

  # GET /community_configs/1
  # GET /community_configs/1.json
  def show
  end

  # GET /community_configs/new
  def new
    @community_config = CommunityConfig.new
  end

  # GET /community_configs/1/edit
  def edit
  end

  # POST /community_configs
  # POST /community_configs.json
  def create
    @community_config = CommunityConfig.new(community_config_params)

    respond_to do |format|
      if @community_config.save
        format.html { redirect_to @community_config, notice: 'Community config was successfully created.' }
        format.json { render :show, status: :created, location: @community_config }
      else
        format.html { render :new }
        format.json { render json: @community_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_configs/1
  # PATCH/PUT /community_configs/1.json
  def update
    respond_to do |format|
      if @community_config.update(community_config_params)
        format.html { redirect_to @community_config, notice: 'Community config was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_config }
      else
        format.html { render :edit }
        format.json { render json: @community_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_configs/1
  # DELETE /community_configs/1.json
  def destroy
    @community_config.destroy
    respond_to do |format|
      format.html { redirect_to community_configs_url, notice: 'Community config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_config
      @community_config = CommunityConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_config_params
      params.require(:community_config).permit(:name, :description, :about, :backgroundOne, :backgroundTwo, :backgroundThree, :logo)
    end

    def set_configs
      @communityConfig = CommunityConfig.first
    end

end
