class Categorie < ApplicationRecord
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/def.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	has_many :items
end
