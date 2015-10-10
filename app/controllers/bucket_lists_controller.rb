class BucketListsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
    @bucket_lists = BucketList.where(user_id: current_user.id)
    @bucker_lists_count = @bucket_lists.count
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
      flash[:notice] = "Congrats! You started a new Bucket List!"
    else
      flash[:errors] = @bucket_list.errors.full_messages.join(" | ")
      render :new
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
