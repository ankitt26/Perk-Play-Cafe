class Api::V1::AddressesController < ApplicationController
  before_action :set_address, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /addresses
  def index
    @addresses = current_user.addresses

    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    render json: {message: "Address deleted successfully"}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:landmark, :street, :city, :pincode, :state, :country,
                                    :phone).merge(user_id: current_user.id)
  end
end
