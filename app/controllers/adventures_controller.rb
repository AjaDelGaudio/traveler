class AdventuresController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :edit]

  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.new(adventure_params)

    if @adventure.is_achieved == nil
      @adventure.is_achieved = false
    end

    if @adventure.save
      redirect_to new_adventure_path
      flash[:notice] = "Excellent! Another adventure to happen!"
    else
      flash[:errors] = @adventure.errors.full_messages.join(" | ")
      render :new
    end
  end

  private

  def adventure_params
      params.require(:adventure).permit(
        :name,
        :address,
        :latitude,
        :longitude,
        :is_achieved,
        :notes,
        :bucket_list_id
      )
  end
end