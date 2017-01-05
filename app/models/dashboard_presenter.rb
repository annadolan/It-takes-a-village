class DashboardPresenter

  attr_reader :events

  def initialize(user)
    @events = user.events
  end


end
