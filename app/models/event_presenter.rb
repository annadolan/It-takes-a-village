class EventPresenter

  attr_reader :villager_tasks, :parent, :categories

  def initialize(user, event)
    @villager_tasks = find_villager_tasks(user)
    @categories = Category.all
    @parent = find_parent(event)
    @roles = [Role.find_by(name: "Organizer"), Role.find_by(name: "New Parent")]
  end

  def find_villager_tasks(user)
    villager_events = user.events.joins(:roles).where("roles.name = 'Villager'")
    villager_tasks = []
    villager_events.each do |event|
      villager_tasks << event.tasks
    end
    @villager_tasks = villager_tasks.first
  end

  def find_parent(event)
    parent_id = event.users.first.id
    @parent = User.find(parent_id)
  end

end
