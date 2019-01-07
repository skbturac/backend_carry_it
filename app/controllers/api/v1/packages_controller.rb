class Api::V1::PackagesController < ApplicationController
  before_action :find_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.all
    render json: @packages, status: :ok
  end

  def show
    render json: @package, status: :accepted
  end

  def create
    @package = Package.create(package_params)
    if @package.valid?
      render json: @package, status: :created
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def edit
  end

  def update
    @package.update(package_params)
    if @package.save
      render json: @package, status: :accepted
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    if @package.delete
      render body: nil, status: :no_content
    else
      render json: { message: "Playlist not found" }, status: :not_found
    end
  end

  private

  def package_params
    params.permit(:sender_id, :carrier_id, :service_id, :weight, :height, :lenght, :width, :price, :description, :destintion_address, :destintion_zipcode, :image)
  end

  def find_package
    @package = Package.find(params[:id])
  end
end
