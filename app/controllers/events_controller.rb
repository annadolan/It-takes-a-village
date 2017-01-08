class EventsController < ApplicationController

  before_action :set_event, only: [:show]

  def new
    @categories = Category.all

  end

  def create
  end

  def show
    @presenter = EventPresenter.new(current_user)
    parent_id = @event.users.first.id
    @parent = User.find(parent_id)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

end
