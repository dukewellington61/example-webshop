require 'rails_helper'

describe Product do

    product = FactoryBot.create(:product)
  
  before do    
    
    user = FactoryBot.create(:admin)
    @l = FactoryBot.create(:comment, rating: 1, body: "Awful bike!", user: user, product: product)
    @m = FactoryBot.create(:comment, rating: 3, body: "Ok bike!", user: user, product: product)
    @h = FactoryBot.create(:comment, rating: 5, body: "Great bike!", user: user, product: product)
  end

   
    it "returns the comment with highest rating" do
      expect(product.highest_rating_comment).to eq @h
    end

    it "returns the comment with lowest rating" do
      expect(product.lowest_rating_comment).to eq @l
    end    

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "checks whether a new db entry has values for mandatory fields" do
      expect(Product.new(description: "Nice bike", price: 200)).not_to be_valid
      expect(Product.create!(name: "Lame Duck", price: 200)).to be_valid
    end

    it "checks whether a new db entry has value for price greater than 0" do
      expect(Product.new(name: "Lame Duck", price: 0)).not_to be_valid
    end
 end   

  

  

