class Api::V1::ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    render json: @services, status: :ok
  end

  def show
    render json: @service, status: :accepted
  end

  def user_services
    @user_services = Service.all.where(carrier_id: current_user.id)
    render json: @user_services, status: :ok
  end

  def create
    @service = Service.new(service_params)
    @carrier_id = current_user.id
    @service.carrier_id = @carrier_id
    if @service.save && @service.valid?
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def edit
  end

  def update
    # byebug
    @service.update(service_params)
    if @service.save
      render json: @service, status: :accepted
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    if @service.delete
      render body: nil, status: :no_content
    else
      render json: { message: "Service not found" }, status: :not_found
    end
  end

  private

  def service_params
    params.require(:service).permit(:status, :price, :destination_address, :package_id, :carrier_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
