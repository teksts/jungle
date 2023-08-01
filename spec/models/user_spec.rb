require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Validates with a name, email, and password" do
      @user = User.new(name: "Mark", email: "a@a.com", password_digest: "1234")
      @password_confirmation = "1234"
      expect(@user).to be_valid
    end
    it "Is accepted when password matches password confirmation" do
      @user = User.new(name: "Mark", email: "a@a.com", password_digest: "1234")
      @password_confirmation = "1234"
      expect(@user).to be_valid
      expect(@user.password_digest).to eq(@password_confirmation)
    end
    it "Is not accepted when password does not match password confirmation" do
      @user = User.new(name: "Mark", email: "a@a.com", password_digest: "1234")
      @password_confirmation = "123"
      expect(@user).to be_valid
      expect(@user.password_digest).to_not eq(@password_confirmation)
    end
    it "Is not accepted when password confirmation is absent" do
      @user = User.new(name: "Mark", email: "a@a.com", password_digest: "1234")
      @password_confirmation = nil
      expect(@user).to be_valid
      expect(@user.password_digest).to_not eq(@password_confirmation)
    end
    it "Is not accepted when password is absent" do
      @user = User.new(name: "Mark", email: "a@a.com", password_digest: nil)
      @password_confirmation = "1234"
      expect(@user).to be_invalid
    end
    it "Is not accepted when email is absent" do
      @user = User.new(name: "Mark", email: nil, password_digest: "1234")
      @password_confirmation = "1234"
      expect(@user).to be_invalid
    end
    it "Is not accepted when name is absent" do
      @user = User.new(name: nil, email: "a@a.com", password_digest: "1234")
      @password_confirmation = "1234"
      expect(@user).to be_invalid
    end
    it "Is not accepted when email is duplicated" do
      @existing_user = User.create!(name: "Sam", email: "a@a.com", password_digest: "1234")
      @new_user = User.new(name: "Mark", email: "A@A.com", password_digest: "1234")
      @password_confirmation = "1234"
      expect(@new_user).to be_invalid
    end
    it "Is not accepted when password is too short" do
      @user = User.new(name: "Mark", email: "@a.com", password_digest: "123")
      @password_confirmation = "123"
      expect(@user).to be_invalid
    end
  end
end
