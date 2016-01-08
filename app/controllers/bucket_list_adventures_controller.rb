class BucketListAdventuresController < ApplicationController
  def update
    binding.pry
    @bucket_list_adventure = BucketListAdventure.find(params[:id])
    binding.pry
    @bucket_list_adventure.save
  end

end
