require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:type) { UserType.create!(name: "pleb") }
  describe "has_secure_password" do
    let!(:user) { User.create!(username: "username", password: "password", type: type) }

    describe '#authenticate' do
      it "returns the user object if correct password is supplied" do
        expect(user.authenticate("password")).to be user
      end

      it "returns false if the incorrect password is supplied" do
        expect(user.authenticate("bad_password")).to be false
      end
    end
  end
end
