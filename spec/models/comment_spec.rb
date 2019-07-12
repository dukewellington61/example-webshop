require 'rails_helper'

describe Comment do

	 before do 
	 	@product = FactoryBot.create(:product)
	 	@user = FactoryBot.create(:user)
	 end

  	it "is valid if all of these (body, user, product, rating) are present" do
  		expect(Comment.new(body: "bla", user: @user, product: @product, rating: 1)).to be_valid  		 		
  	end

  	it "is not valid if rating value is not an an integer" do
      @comment = FactoryBot.build(:comment, rating: "no integer")
  		expect(@comment).not_to be_valid		 		
  	end 
end

