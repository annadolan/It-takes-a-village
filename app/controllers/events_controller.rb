class EventsController < ApplicationController

  before_action :set_event, only: [:show]

  def new
    @categories = Category.all

  end

  def create
  end

  def show
    @presenter = EventPresenter.new(current_user, @event)
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

end
