class Api::V1::ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update]

  def index
    @services = Service.all
    render json: @services, status: :ok
  end

  def show
    render json: @service, status: :accepted
  end

  def create
    byebug
    @service = Service.create(service_params)
    if @service.valid?
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def edit
  end

  def update
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
    params.permit(:status, :price, :destination_address, :destination_zipcode, :package_id, :sender_id, :carrier_id, :receiver_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
