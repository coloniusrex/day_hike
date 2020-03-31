class Trip < ApplicationRecord
  validates_presence_of :name

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    total_dist = 0
    trails.map {|trail| total_dist += trail.length.to_i}
    total_dist
  end

  def avg_distance
    (total_distance.to_f / trails.length).round(1)
  end

end
