class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:update, :validate]
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def new
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.build
  end

  def create
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path, notice: 'La réservation a été créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: 'La réservation a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  def validate
    @reservation.update(status: "validated")
    redirect_to reservations_path, notice: 'La réservation a été validée avec succès.'
  end
end
