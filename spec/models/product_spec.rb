require 'rails_helper'

describe Product do

  let(:product) { Product.create!(name: "race bike") }
  let(:user) { User.create!(email: "model_test@test.com", password: "123456") }

  before do
    product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
    Product.new(description: "Nice bike")
    User.new(first_name: "Peter")
    Order.new(total: 10.0)
    Product.create!(name: "Lame Duck", description: "Slow and Plumb", image_url: "800px-Dutch_bicycle.jpg", colour: "black", price: "749.95")

  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "check whether a new db entry has all the necessary content" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
    expect(Product.create!(name: "Lame Duck", description: "Slow and Plumb", image_url: "800px-Dutch_bicycle.jpg", colour: "black", price: "749.95")).to be_valid
    expect(User.new(first_name: "Peter")).not_to be_valid
    expect(Order.new(total: 10.0)).not_to be_valid
    expect(Comment.new(body: "Awful bike!")).not_to be_valid


  end

end
