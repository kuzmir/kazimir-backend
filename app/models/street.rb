class Street < ActiveRecord::Base

  ## Associations

  has_many :places, dependent: :destroy


  ## Validations

  validates :name, presence: true


  ## Scopes

  def present_places
    places.present
  end


  ## Class methods

  def past_places
    places.past
  end


  ## Instance methods

  def path_coordinates
    points = path.chop.split(';')
    points.map!{ |point|
      coords = point.split(',')
      [coords[0].to_f, coords[1].to_f]
    }
  end

  def path_image_string
    path.gsub(/;/, '|').chop
  end


end
