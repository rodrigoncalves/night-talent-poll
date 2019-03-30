class Participant < ApplicationRecord
  belongs_to :team

  def team
    Team.where id: :team_id
  end
end
