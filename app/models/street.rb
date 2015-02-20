class Street < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :past_description, presence: true

end
