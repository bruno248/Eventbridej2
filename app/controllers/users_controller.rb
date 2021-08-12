class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = Event.where(administrator_id: (params[:id]))
    @user = User.find(params[:id])
  end

  # def edit
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to @user, notice: "Vos informations ont bien été mises à jour."
  #   else
  #     render :edit
  #   end

end

