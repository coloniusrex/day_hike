class Trip < ApplicationRecord
  validates_presence_of :name

  has_many :trips_trails
  has_many :trails, through: :trips_trails

  def total_distance
    total_dist = 0
    trails.map {|trail| total_dist += trail.length.to_i}
    total_dist
  end

  def average_distance
    (total_distance.to_f / trails.length).round(1)
  end

  def longest_trail
    return trails.max_by{ |trail| trail.length } unless trails.empty?
  end

  def shortest_trail
    return trails.min_by{ |trail| trail.length } unless trails.empty?
  end

end
