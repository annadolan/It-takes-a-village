class EventsController < ApplicationController

  def new
    @categories = Category.all

  end

  def create
  end

  def show
    @event = Event.find(params[:id])
    # right now user sees same event page regardless of role, need to fix that

    # if current_user.events.joins(:roles).where("roles.name = 'New Parent'")
    # else current_user.events.joins(:roles).where("roles.name = 'Villager'")

    villager_events = current_user.events.joins(:roles).where("roles.name = 'Villager'")
    villager_tasks = []
    villager_events.each do |event|
      villager_tasks << event.tasks
    end
    @villager_tasks = villager_tasks.first
    parent_id = @event.users.first.id
    @parent = User.find(parent_id)
  end

end
