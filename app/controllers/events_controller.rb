class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

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
    redirect_to edit_event_path(@event)
  end

  def update
    @event.update(event_params)
    redirect_to :back
  end

  def get_tasks
    @event = current_user.events.first
    tasks = []
    @event.task.each do |task|
       tasks << {:id => task.id, :title => "#{task.taskable.try(:name)} : #{task.task}", :start => "#{task.created_at}",:end => "#{task.updated_at}" }
     end
   render :text => tasks.to_json

  end

  def edit
    @categories = @event.categories
  end

  def show
    @presenter = EventPresenter.new(current_user, @event)
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, category_ids:[], task_ids:[])
    end

end
