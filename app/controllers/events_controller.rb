class EventsController < ApplicationController

  before_action :set_event, only: [:show]

  def new
    @categories = Category.all
    @event = Event.new
    @roles = [Role.find_by(name: "Organizer"), Role.find_by(name: "New Parent")]
    @user_event = @event.user_events.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_events << current_user.user_events.new(event: @event, role_id: params[:event][:user_event][:role_id])
    @event.save
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
