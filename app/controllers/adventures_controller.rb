class AdventuresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :edit]

  def index
    if params[:q] == nil
      flash[:notice] = "Please enter something to search for."
    elsif params[:q].present?
      @adventures = Adventure.search(params[:q])
    else
      @adventures = Adventure.all
    end
  end

  def new
    if current_user.bucket_lists.count == 0
      redirect_to new_bucket_list_path
      flash[:notice] = "You don't have any bucket lists yet."
      flash[:notice] = "You'll need to create a bucket list first."
    else
      @adventure = Adventure.new
      @adventure.bucket_list_adventures.build
    end
  end

  def create
    @adventure = Adventure.new(adventure_params)
    @bucket_list_adventures = @adventure.bucket_list_adventures

    @is_achieved = @adventure.bucket_list_adventures.last.is_achieved
    if @is_achieved == nil
      @is_achieved = false
    end

    if @adventure.save
      flash[:notice] = "Excellent! Another adventure to happen!"
      redirect_to new_adventure_path
    else
      flash[:errors] = @adventure.errors.full_messages.join(" | ")
      render :new
    end
  end

  def all_public
    @bucket_lists = BucketList.where(is_public: true)
  end


  private

  def adventure_params
      params.require(:adventure).permit(
        :name,
        :address,
        :latitude,
        :longitude,
        bucket_list_adventures_attributes: [:bucket_list_id, :notes, :is_achieved]
      )
  end
end
