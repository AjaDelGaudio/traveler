class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      flash[:notice] = "Link successfully added!"
      redirect_to new_adventures_path
    else
      flash[:errors] = @link.errors.full_messages.join(" | ")
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:link_address, :link_name)
  end
end
