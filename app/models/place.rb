class Place < ActiveRecord::Base

  ## Definitions

  PRESENT = :present
  PAST = :past

  ## Associations

  belongs_to :street


  ## Validations

  validates :name, presence: true
  validates :place_type, presence: true


  ## Scopes

  scope :present, -> { where(place_type: Place::PRESENT) }
  scope :past, -> { where(place_type: Place::PAST) }

end
