class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

 
  def create
     @event = Event.new(title: params[:title],
      description: params[:description],
      user_id: session[:user_id].to_i)
    if @event.save
      redirect_to event_path(@event), notice: "Evènement créé"
    else
      render :new
    end  
  end

  def edit
  @event = Event.find(params[:id])
  end

  def update
  @event = Event.find(params[:id])
  if @event.update(params.permit(:title, :description, :user_id))
    redirect_to event_path(@event), notice: "Evenement mis à jour"
  else
    render :edit
  end
  end

  def destroy
  @event = Event.find(params[:id])
  @event.destroy
  redirect_to root, notice: "Evenement détruit"
  end


end
