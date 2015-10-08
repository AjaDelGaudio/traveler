class BucketListsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @bucket_lists = BucketLists.all
  end

  def new
    @bucket_list = BucketList.new
  end

  def create
    @bucket_list = BucketList.new(bucket_list_params)

    if @bucket_list.is_public == nil
      @bucket_list.is_public = false
    end

    if @bucket_list.save
      flash[:notice] = "Congrats! You started a new Bucket List!"
      redirect_to new_bucket_list_path
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
        :is_public
      )
  end
end
