require 'rails_helper'

describe Product do

  let(:product) { Product.create!(name: "race bike", price: 200) }
  let(:user) { User.create!(first_name: "Peter", last_name: "Pupsmann", email: "dingsbums@dingsbums.de", password: "123456") }

  before do
    product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "check whether a new db entry has values for mandatory fields " do
    expect(Product.new(description: "Nice bike", price: 200)).not_to be_valid
    expect(Product.create!(name: "Lame Duck",price: 200)).to be_valid
  end

end
