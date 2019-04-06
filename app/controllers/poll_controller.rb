class PollController < ApplicationController

  def index
    @teams = Team.order(id: :asc)

    voting = Voting.first
    flash.now[:wait] = "Aguarde o início da votação" if voting.wait?
    flash.now[:closed] = "Votação encerrada" if voting.closed?

    @voting_open = voting.open?
    @code = params[:code]
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
      @code = params[:code].downcase
      poll = Poll.where(code: @code).first
      team_id = params[:team_id]

      if team_id.nil?
        flash.now[:alert] = "Escolha uma equipe para votar!"
      elsif poll.nil?
        flash.now[:alert] = "Este código é inválido!"
      else
        if poll.team_id.present?
          if poll.team_id == team_id.to_i
            flash.now[:warning] = "Você já votou nessa equipe."
          else
            flash.now[:warning] = "Você atualizou seu voto."
          end
        end

        flash.now[:notice] = "Obrigado pelo seu voto. Aguarde pelo anúncio do resultado!"
        poll.update(team_id: team_id)
        @code.clear
      end

      @teams = Team.order(id: :asc)
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
