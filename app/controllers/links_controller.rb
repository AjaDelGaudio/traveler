class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
  end
end
