class EventsTasksController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
  end

  def update
    @meetings = []
    @event = Event.find(params["events_task"]["event_id"])
    @event_task = EventsTask.find(params["events_task"]["event_task_id"])
    @event_task.update(start_time: params["events_task"]["start_time"])
      if @event_task.save
      @meetings << @event_task
      flash[:success] = "Time updated!"
      redirect_to :back
    end
  end

  def event_task_params
    params.require(:event_task).permit(:start_time)
  end

  # def index
  #   @event = Event.find(params[:id])
  #   @events_tasks = @event.events_tasks
  # end
end
