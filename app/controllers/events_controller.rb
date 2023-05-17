class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
    @user = User.includes(:events).find_by(id: current_user.id)
  end

  def register
    event = Event.find(params[:id])
    if Registration.where(user_id: current_user.id, event_id: event.id).empty?
      current_user.events << event
    end
    redirect_to root_path, notice: "you have successfully regsitered for the event:"+event.title
  end
end