class RecentsController < ApplicationController
  before_action :set_recent, only: [:show, :edit, :update, :destroy]
  before_action :set_configs
  before_action :authenticate_member!

  # GET /recents
  # GET /recents.json
  def index
    @recents = Recent.all
  end

  # GET /recents/1
  # GET /recents/1.json
  def show
  end

  # GET /recents/new
  def new
    @recent = Recent.new
  end

  # GET /recents/1/edit
  def edit
  end

  # POST /recents
  # POST /recents.json
  def create
    @recent = Recent.new(recent_params)

    #Certificamos el autor
    @recent.author = Member.find(current_member.id).nickname

    respond_to do |format|
      if @recent.save
        format.html { redirect_to @recent, notice: 'Recent was successfully created.' }
        format.json { render :show, status: :created, location: @recent }
      else
        format.html { render :new }
        format.json { render json: @recent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recents/1
  # PATCH/PUT /recents/1.json
  def update
    respond_to do |format|
      if @recent.update(recent_params)
        format.html { redirect_to @recent, notice: 'Recent was successfully updated.' }
        format.json { render :show, status: :ok, location: @recent }
      else
        format.html { render :edit }
        format.json { render json: @recent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recents/1
  # DELETE /recents/1.json
  def destroy
    @recent.destroy
    respond_to do |format|
      format.html { redirect_to recents_url, notice: 'Recent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recent
      @recent = Recent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recent_params
      params.require(:recent).permit(:title, :body, :author, :photo)
    end

    def set_configs
      @communityConfig = CommunityConfig.first
    end
end
