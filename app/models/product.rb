class Product < ApplicationRecord


def self.search(search_term)
  Product.where("name Like ?", "%#{search_term}%")
end
end
