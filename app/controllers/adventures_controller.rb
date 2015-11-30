class AdventuresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :edit, :search]

  def index
    @adventures = Adventure.all
  end

  def search
    if params[:q].nil? || params[:q] == ""
      flash[:notice] = "Please enter a search term."
      render "homes/index"
    elsif params[:q].present?
      search_results = Adventure.search(params[:q])
      @adventures = search_results.select do |result|
        bla = result.bucket_list_adventures.first
        bucket_list = bla.bucket_list
        user = bucket_list.user
        user == current_user
      end
    end
  end

  def new
    if current_user.bucket_lists.count == 0
      redirect_to new_bucket_list_path
      flash[:notice] = "You don't have any bucket lists yet."
    else
      @adventure = Adventure.new
      @adventure.bucket_list_adventures.build
    end
  end

  def create
    @adventure = Adventure.new(adventure_params)
    @bucket_list_adventures = @adventure.bucket_list_adventures
    bla = adventure_params[:bucket_list_adventures_attributes]["0"]
    @bucket_list = BucketList.find(bla[:bucket_list_id])

    @is_achieved = @adventure.bucket_list_adventures.last.is_achieved
    @is_achieved ||= false

    if @adventure.save
      flash[:notice] = "Excellent! Another adventure awaits!"
      redirect_to bucket_list_path(@bucket_list)
      binding.pry
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
