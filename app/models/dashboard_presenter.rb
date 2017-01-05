class DashboardPresenter

  attr_reader :events, :hash

  def initialize(user)
    @events = user.events
    @hash = make_map_hash(user)
  end

  def make_map_hash(user)
    @hash = Gmaps4rails.build_markers(user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({:id => user.id})
    end
  end

end
