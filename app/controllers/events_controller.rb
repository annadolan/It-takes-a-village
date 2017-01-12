class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def new
    @presenter = EventPresenter.new(current_user)
    @event = Event.new
    @user_event = @event.user_events.new
  end

  def create
    user_event = current_user.user_events.create do |user_event|
      event = Event.new(event_params)
      user_event.event = event
      user_event.role_id = params[:event][:user_event][:role_id]
    end
    @event = user_event.event
    if @event.persisted?
      redirect_to edit_event_path(@event)
    else
    end
  end

  def update
    @event.update(event_params)
    redirect_to edit_events_task_path(@event)
  end

  def edit

  end

  def show
    @presenter = EventPresenter.new(current_user)
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, category_ids:[], task_ids:[])
    end

end
