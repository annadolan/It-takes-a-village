class EventsController < ApplicationController

  before_action :set_event, only: [:show]

  def new
    @categories = Category.all
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    
  end

  def show
    @presenter = EventPresenter.new(current_user, @event)
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, category_ids:[])
    end

end
