class Street < ActiveRecord::Base

  ## Associations

  has_many :places, dependent: :destroy


  ## Validations

  validates :name, presence: true


  ## Class methods

  def present_places
    places.present
  end

  def past_places
    places.past
  end

  def places_by_type(type)

    return present_places if type == :present
    return past_places if type == :past

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
