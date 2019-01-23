class Api::V1::PackagesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.all
    render json: @packages, status: :ok
  end

  def show
    render json: @package, status: :accepted
  end

  def user_packages
    @user_packages = current_user.packages
    render json: @user_packages, status: :ok
  end

  def awaiting_packages
    # @awaiting_packages = Package.all.where.not(status: "Picked-Up")

    sql = "SELECT packages.* FROM packages
    LEFT JOIN services ON packages.id = services.package_id
    WHERE services.status IS NULL"
    @awaiting_packages = ActiveRecord::Base.connection.execute(sql)
    package_array = []
    @awaiting_packages.each_row do |row|
      package_array << Package.find(row[0])
    end
    render json: package_array, status: :ok

  end

  def user_receiving_packages
    @user_receiving_packages = Package.all.where(receiver_id: current_user.id)
    render json: @user_receiving_packages, status: :ok

  end

  def create
    @package = Package.new(package_params)
    @sender_id = current_user.id
    @package.sender_id = @sender_id
    @receiver = User.find_by(username: params[:user][:receiver_id])
    @package.receiver_id = @receiver.id
    if @package.save && @package.valid?
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
      render json: { message: "Package not found" }, status: :not_found
    end
  end

  private

  def package_params
    params.require(:user).permit(:weight, :height, :status, :length, :description, :image, :delivery_date, :sender_id, :receiver_id)
  end

  def find_package
    @package = Package.find(params[:id])
  end
end

# lsof -PiTCP -sTCP:LISTEN
# kill -9 4979
