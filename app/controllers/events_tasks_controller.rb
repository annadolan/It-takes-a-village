class EventsTasksController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
    respond_to do |format|
     format.html
     format.js
   end
   @meetings = []
  end

  def update
    @event = Event.find(params["events_task"]["event_id"])
    @event_task = EventsTask.find(params["events_task"]["event_task_id"])
    @event_task.update(date: params["events_task"]["date"])
      if @event_task.save
      flash.now[:success] = "Time updated!"
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
    @meetings = @event.events_tasks.last
  end

end
