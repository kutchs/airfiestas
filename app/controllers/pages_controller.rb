class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events_sample = Event.order(created_at: :desc).limit(6)
  end
end
