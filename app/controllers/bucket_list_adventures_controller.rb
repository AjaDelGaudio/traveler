class BucketListAdventuresController < ApplicationController
  def update
    @bucket_list_adventure = BucketListAdventure.find(params[:id])
    if @bucket_list_adventure.is_achieved == false
      @bucket_list_adventure.is_achieved = true
    else
      @bucket_list_adventure.is_achieved = false
    end
    @bucket_list_adventure.save
  end
end
