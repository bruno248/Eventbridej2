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
    
     @event = Event.new(params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :administrator_id))
     #@event.administrator_id = current_user.id    
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
  only_user?(current_user)
  @event = Event.find(params[:id])
  if @event.update(params.permit(:title, :description, :user_id))
    redirect_to event_path(@event), notice: "Evenement mis à jour"
  else
    render :edit
  end
  end

  def destroy
  only_user?(current_user)
  @events = Event.find(params[:id])
  @event.destroy
  redirect_to root, notice: "Evenement détruit"
  end


end
