class PollController < ApplicationController

  def index
    @teams = Team.all
  end

  def codes
    @polls = Poll.all
    @votes_count = Poll.votes_count
  end

  def update
    poll = Poll.where(code: params[:code]).first
    @teams = Team.all

    if poll.nil?
      flash.now[:alert] = "Este código é inválido"
      render :index
    elsif poll.team_id.nil?
      poll.update(team_id: params[:team_id])
      flash.now[:notice] = "Obrigado pelo seu voto. Aguarde pelo anúncio do resultado!"
      render :index
    else
      flash.now[:alert] = "Você já votou"
      render :index
    end
  end

  def result
    @teams = Team.all
    @teams = @teams.sort_by { |t| -t.votes } # sort by number of votes
    @votes_count = Poll.valid_votes
    respond_to do |format|
      format.html
      format.json {
        render json: {
          teams: @teams.to_json(methods: [:votes]),
          votes_count: @votes_count
        }
      }
    end
  end

end
