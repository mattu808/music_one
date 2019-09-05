class Song < ApplicationRecord
    has_many :rankings, dependent: :destroy
    has_many :artists, through: :rankings
  end
