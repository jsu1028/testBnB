class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update]
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
      if @listing.save
        flash[:success] = "Successful - listing saved!"
        redirect_to listings_path
      else
        flash[:error] = "Failed - listing not saved!"
        render :index
      end
  end

  def show
    @booking = @listing.bookings.new
  end

  def edit

  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Successfully updated listing"
      redirect_to @listing
    else
      flash[:danger] = "Error updating listing"
      render :edit
    end
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :max_guests, :price, {photos: []})
  end
end
