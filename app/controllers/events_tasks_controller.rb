class EventsTasksController < ApplicationController
  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
  end

  def create
  end

  def index
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
  end
end
