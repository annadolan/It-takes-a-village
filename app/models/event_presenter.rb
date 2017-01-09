class EventPresenter

  attr_reader :villager_tasks, :parent

  def initialize(user)
    @villager_tasks = find_villager_tasks(user)
    # @parent = find_parent(event)
  end

  def find_villager_tasks(user)
    villager_events = user.events.joins(:roles).where("roles.name = 'Villager'")
    villager_tasks = []
    villager_events.each do |event|
      villager_tasks << event.tasks
    end
    @villager_tasks = villager_tasks.first
  end

  # def find_parent(event)
  #   parent_id = event.users.first.id
  #   @parent = User.find(parent_id)
  # end

end
