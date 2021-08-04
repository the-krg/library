require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }
    it 'is valid when all attributes are present' do
      expect(user).to be_valid
    end

    %w[first_name last_name book_genre_id].each do |attribute|
      it "is not valid when #{attribute} is not present" do
        user[attribute] = nil

        expect(user).not_to be_valid
      end
    end
  end
end