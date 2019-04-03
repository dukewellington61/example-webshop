class Product < ApplicationRecord
 before_destroy :not_referenced_by_any_line_item
 has_many :line_items
 has_many :carts, through: :line_items
 has_many :orders, through: :line_items
 has_many :comments, dependent: :destroy
 

 validates :name, presence: true
 validates :price, :numericality => {:greater_than => 0}


def self.search(search_term)

	if Rails.env.development?
  		Product.where("name LIKE ?", "%#{search_term}%")
  	else
  		Product.where("name ilike ?", "%#{search_term}%")
end
end

def highest_rating_comment
  	comments.rating_desc.first
end

def lowest_rating_comment
  	comments.rating_asc.first
end

def average_rating
  comments.average(:rating).to_f
end

private

def not_referenced_by_any_line_item
  unless line_items.empty?
    errors.add(:base, "Line items present")
    throw :abort
  end
end

end
