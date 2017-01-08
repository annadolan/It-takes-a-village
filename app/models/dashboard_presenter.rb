class DashboardPresenter

  attr_reader :user_events, :events, :hash

  def initialize(user)
    @user_events = user.user_events
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
