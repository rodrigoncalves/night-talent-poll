class PollController < ApplicationController

  def index
    @teams = Team.all

    voting = Voting.first
    flash.now[:wait] = "Aguarde o início da votação" if voting.wait?
    flash.now[:closed] = "Votação encerrada" if voting.closed?

    @voting_open = voting.open?
  end

  def codes
    @polls = Poll.order(id: :asc)
    @votes_count = Poll.votes_count
  end

  def update
    voting = Voting.first
    @voting_open = voting.open?

    if !voting.open?
      redirect_to :poll_index
    else
      poll = Poll.where(code: params[:code]).first
      team_id = params[:team_id]

      if team_id.nil?
        flash.now[:alert] = "Escolha uma equipe para votar!"
      elsif poll.nil?
        flash.now[:alert] = "Este código é inválido!"
      elsif poll.team_id.nil?
        poll.update(team_id: team_id)
        flash.now[:notice] = "Obrigado pelo seu voto. Aguarde pelo anúncio do resultado!"
      else
        poll.update(team_id: team_id)
        flash.now[:warning] = "Você atualizou seu voto."
      end

      @teams = Team.all
      render :index
    end
  end

  def result
    @teams = Team.all
    @teams = @teams.sort_by { |t| -t.votes } # sort by number of votes
    @votes_count = Poll.valid_votes
    @voting = Voting.first
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

  def update_status
    voting = Voting.first
    voting.status = params[:status].to_i
    voting.save
    redirect_to :result
  end

end
