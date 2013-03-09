class Team < ActiveRecord::Base
  attr_accessible :city, :name
  
  has_many :players
  belongs_to :division
end
