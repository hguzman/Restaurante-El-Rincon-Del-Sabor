class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    authorize Client
    @clients = Client.paginate(page: params[:page], per_page:4)
  end

  def new
    @clients = Client.new
    authorize @clients
  end

  def edit

  end

  def show
  end

  def create
    @clients = Client.new(client_params)

    respond_to do |format|
      if @clients.save
        format.html {redirect_to clients_url, notice: 'Cliente creado exitosamente'}
        format.json {render :show, status: :created, location: @clients}
      else
        format.html {render :new}
        format.json {reder json: @clients.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @clients.update (client_params)
        format.html {redirect_to clients_url, notice: 'El clientes se ha actualizado exitosamente'}
        format.json {reder :show, status: :ok, location: @clients}
      else
        format.html {render :edit}
        format.json {render json: @clients.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @clients.destroy
    respond_to do |format|
      format.html {redirect_to clients_url, notice: 'Cliente eliminado con éxito'}
      format.json { head :no_content}

    end
  end

  private

  def set_client
    @clients = Client.find(params[:id])

  end

  def client_params
    params.require(:client).permit(:nombre, :correo, :direccion, :cedula, :telefono, :estado)

  end
end
