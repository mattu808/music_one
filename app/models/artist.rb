class Artist < ApplicationRecord
    has_many :rankings, dependent: :destroy
    has_many :songs, through: :rankings
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end