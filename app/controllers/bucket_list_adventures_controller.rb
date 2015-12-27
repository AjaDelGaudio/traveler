class BucketListAdventuresController < ApplicationController
  def update
    @bucket_list_adventure = BucketListAdventure.find(params[:id])
    @bucket_list_adventure.save
  end
end
