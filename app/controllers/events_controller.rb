class EventsController < ApplicationController

  def new
    @categories = Category.all

  end

  def create
  end

  def show
    @event = Event.find(params[:id])
    if current_user.@events.

    this = current_user.events.joins(:roles).where("roles.name = 'Villager'")
    tasks = []
    this.each do |event|
      tasks << event.tasks
    end
    @tasks = tasks.first
    parent_id = @event.users.first.id
    @parent = User.find(parent_id)
  end

end
