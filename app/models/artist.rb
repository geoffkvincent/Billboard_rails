class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :billboards, through: :s
end
