# require_relative '../../config/environments/test.rb'
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do 
      @category = Category.create!(name: 'Shrubs')
    end
    it "Validates with all fields filled" do
      @product = Product.new(name: "plant", price: 1, quantity: 1, category: @category)
      expect(@product).to be_valid
    end
    it "Invalid if missing category" do
      @product = Product.new(name: "plant", price: 1, quantity: 1, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "Invalid if missing quantity" do
      @product = Product.new(name: "plant", price: 1, quantity: nil, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "Valid if missing price" do
      @product = Product.new(name: "plant", price: nil, quantity: 1, category: @category)
      expect(@product).to be_valid
    end
    it "Invalid if missing name" do
      @product = Product.new(name: nil, price: 1, quantity: 1, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
