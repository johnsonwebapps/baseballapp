class Division < ActiveRecord::Base
  attr_accessible :name
  has_many :teams
  belongs_to :league
end
