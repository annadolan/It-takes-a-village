class EventsTasksController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
  end

  def update
    params['events_tasks'].keys.each do |id|
      @event_task = EventsTask.find(id.to_i)
      @event_task.update_attributes(date: params['events_tasks'][id]["date"])
    end
    flash[:success] = "Time updated!"
    redirect_to events_tasks_path
  end

  def show
    @event = Event.find(params[:id])
    @meetings = @event.events_tasks
  end

end
