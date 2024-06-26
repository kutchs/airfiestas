class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @events = Event.all
    if params[:query].present?
      @events = @events.where("location ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: 'L\'événement a été créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'L\'événement a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    if @event.user == current_user
      @event.destroy
      redirect_to events_path, notice: 'Événement supprimé avec succès.'
    else
      redirect_to events_path, alert: 'Vous n\'êtes pas autorisé à supprimer cet événement.'
    end
  end

  def register
    @event = Event.find(params[:id])
    current_user.reservations.create(event: @event)
    redirect_to @event, notice: "Vous êtes maintenant inscrit à cet événement."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date_time, :location, :address, :open, :image)
  end
end
