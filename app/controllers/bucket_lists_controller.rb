class BucketListsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :edit]

  def index
    @bucket_lists = BucketList.where(user_id: current_user.id)
    @bucker_lists_count = @bucket_lists.count
  end

  def show
    @bucket_list = BucketList.find(params[:id])
    binding.pry
  end

  def all_public
    @bucket_lists = BucketList.where(is_public: true)
    @adventures = Adventure.all
  end

  def new
    @bucket_list = BucketList.new
  end

  def create
    @bucket_list = BucketList.new(bucket_list_params)
    @bucket_list.user = current_user

    if @bucket_list.is_public == nil
      @bucket_list.is_public = false
    end

    if @bucket_list.save
      redirect_to bucket_lists_path
      flash[:notice] = "You started a new Bucket List!"
    else
      flash[:errors] = @bucket_list.errors.full_messages.join(" | ")
      render :new
    end
  end

  def edit
    @bucket_list = BucketList.find(params[:id])
  end

  def update
    @bucket_list = BucketList.find(params[:id])
    @bucket_list.update(bucket_list_params)

    if @bucket_list.save
      redirect_to root_path
      flash[:info] = "Changes saved!"
    else
      @bucket_list = BucketList.where(user: current_user)[0]
      flash[:warning] = "Every list needs a title."
      render :edit
    end
  end

  def destroy
    @bucket_list = BucketList.find(params[:id])
    if @bucket_list.destroy
      flash[:success] = "Bucket List deleted"
      redirect_to bucket_lists_path
    end
  end


  private

  def bucket_list_params
      params.require(:bucket_list).permit(
        :title,
        :description,
        :is_public,
        :user_id
      )
  end
end
