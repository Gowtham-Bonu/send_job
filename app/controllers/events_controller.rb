class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where.not(id: current_user.events.ids)
  end

  def register
    event = Event.find(params[:id])
    if Registration.where(user_id: current_user.id, event_id: event.id).empty?
      current_user.events << event
      if Time.now+5.hours <= event.event_time
        RegisterMailJob.perform_later(current_user, event.title)
      end
    end
    redirect_to root_path, notice: "you have successfully regsitered for the event:"+event.title
  end
end