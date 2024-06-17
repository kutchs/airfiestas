class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.order(created_at: :desc).limit(6)
  end
end
