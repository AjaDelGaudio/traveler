class BucketListAdventuresController < ApplicationController
  def update
    @bucket_list_adventure = BucketListAdventure.find(params[:id])
    @bucket_list_adventure.update(bucket_list_params)
    binding.pry
  end

  private

  def bucket_list_params
    params.require(:bucket_list_params).permit(
      :bucket_list_id,
      :adventure_id,
      :id
    )
  end
end
