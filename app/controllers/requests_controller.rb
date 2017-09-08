require 'curb'
require 'oj'
class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_configs
  before_action :authenticate_member!, except: [:new, :create]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    #Calculamos los valores restantes
    #Curl obtiene un string con la informacion que le proporciona la api de mojang
    mojangData = Curl.get("https://api.mojang.com/users/profiles/minecraft/Ponchoalfonso").body_str
    #Oj convierte el string que tenemos un hash el cual podemos manipular
    minecraftUser = Oj.load(mojangData)
    #Colocamos los valores faltantes
    @request.minecraftUUID = minecraftUser["id"]
    @request.ip = request.remote_ip
    @request.status = "Pendiente"

    respond_to do |format|
      if @request.save
        session[:requesting_user_id] = @request.id
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :age, :nickname, :minecraftUUID, :foundUs, :requestReason, :email, :status, :ip)
    end

    def set_configs
      @communityConfig = CommunityConfig.first
    end
end
