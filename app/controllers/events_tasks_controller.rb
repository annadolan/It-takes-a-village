class EventsTasksController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    @events_tasks = @event.events_tasks
   @meetings = []
  end

  def update
    params['events_tasks'].keys.each do |id|
      @event_task = EventsTask.find(id.to_i)
      @event_task.update_attributes(date: params['events_tasks'][id]["date"])
    end
    flash[:success] = "Time updated!"
    redirect_to :back
  end

  def show
    @event = Event.find(params[:id])
    @meetings = @event.events_tasks

    # @tasks = {}
    # @event_tasks.each do |task|
    #   @tasks[task.date] = [Task.find(task.task_id).name]
    # end
    # @tasks
  end

end
