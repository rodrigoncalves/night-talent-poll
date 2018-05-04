class PollController < ApplicationController

  def index
    @teams = Team.all
  end

  def update
    poll = Poll.where(code: params[:code]).first
    @teams = Team.all

    if poll.nil?
      flash.now[:alert] = "The code is not valid"
      render :index
    elsif poll.team_id.nil?
      poll.update(team_id: params[:team_id])
      flash.now[:notice] = "Thanks for voting"
      render :index
    else
      flash.now[:alert] = "You have already voted"
      render :index
    end
  end

end
