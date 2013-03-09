class Player < ActiveRecord::Base
  attr_accessible :atbats, :games, :givenname, :hitbypitch, :hits, :pb, :rbi, :runs, :struckout, :surname, :walks
  belongs_to :season
  belongs_to :team
end
