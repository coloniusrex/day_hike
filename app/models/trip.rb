class Trip < ApplicationRecord
  validates_presence_of :name

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    total_dist = 0
    trails.each {|trail| total_dist += trail.length}
    total_dist
  end

end
