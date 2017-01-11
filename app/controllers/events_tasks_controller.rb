class EventsTasksController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
    @meetings = []
  end

  def update
    @event = Event.find(params["events_task"]["event_id"])
    @event_task = EventsTask.find(params["events_task"]["event_task_id"])
    if @event_task.update(start_time: params["events_task"]["start_time"])
      flash[:success] = "Time updated!"
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
    @meetings = @event.events_tasks
    binding.pry
  end

end
