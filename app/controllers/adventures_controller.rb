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
      @bucket_lists = BucketList.where(user_id: current_user.id)
      @adventure.bucket_list_adventures.build
    end
  end

  def create
    @adventure = Adventure.new(adventure_params)
    @bucket_lists = BucketList.where(user_id: current_user.id)
    @adventure.is_achieved ||= false
    @adventure.user_id = current_user.id
    @bucket_list_adventure = @adventure.bucket_list_adventures[0]

    if @adventure.save
      @bucket_list_adventure.adventure_id = @adventure.id
      flash[:notice] = "Excellent! Another adventure awaits!"
      redirect_to @adventure
    else
      flash[:errors] = @adventure.errors.full_messages.join(" | ")
      render :new
    end
  end

  def show
    @adventure = Adventure.find(params[:id])
    bucket_list_adventure = @adventure.bucket_list_adventures[0]
    bucket_list = BucketList.where(id: bucket_list_adventure.bucket_list_id)
    @bucket_list = bucket_list[0]
  end

  def all_public
    binding.pry
    @adventures = Adventure.where(is_shared: true)
    binding.pry
  end


  def edit
    @adventure = Adventure.find(params[:id])
    @bucket_lists = BucketList.where(user_id: current_user.id)
  end

  def update
    @adventure = Adventure.find(params[:id])
    @adventure.update(adventure_params)

    if @adventure.save
      redirect_to root_path
      flash[:info] = "Changes saved!"
    else
      flash[:errors] = @adventure.errors.full_messages.join(" | ")
      render :edit
    end
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    if @adventure.destroy
      redirect_to bucket_lists_path
      flash[:success] = "Adventure deleted"
    else
      flash[:warning] = "Adventure NOT deleted"
    end
  end

  private

  def adventure_params
      params.require(:adventure).permit(
        :id,
        :name,
        :address,
        :latitude,
        :longitude,
        :link,
        :is_achieved,
        :is_shared,
        :notes,
        :user_id,
        bucket_list_adventures_attributes: [:bucket_list_id, :adventure_id, :id]
      )
  end
end
