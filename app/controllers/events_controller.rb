class EventsController < ApplicationController

  def new
    @categories = Category.all

  end

  def create
  end

  def show
    this = current_user.events.joins(:roles).where("roles.name = 'Villager'")

    tasks = []
    this.each do |event|
      tasks << event.tasks
    end
    @tasks = tasks.first
  end

end
