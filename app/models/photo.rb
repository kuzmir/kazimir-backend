class Photo < ActiveRecord::Base

  ## Associations

  belongs_to :place

  has_attached_file :image,
                    styles: { :large => "1920x1080>", :medium => "960x550>", small: "640x360>", tiny: "320x180>", thumb: '100x100'},
                    default_url: "/photos/:style/missing.png",
                    url: "/system/photos/:hash.:extension",
                    hash_secret: Rails.application.secrets.secret_key_base

  ## Validations
  validates :title, presence: true
  validates_attachment :image, presence: true,
                    content_type: {content_type: /\Aimage\/.*\Z/}


end
