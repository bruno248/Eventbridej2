class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = Event.where(administrator_id: (params[:id]))
    @user = User.find(params[:id])
  end


end

