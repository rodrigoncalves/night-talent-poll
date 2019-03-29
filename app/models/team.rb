class Team < ApplicationRecord
  has_many :participants

  def votes
    Poll.where(team_id: id).sum(:value)
  end
end
