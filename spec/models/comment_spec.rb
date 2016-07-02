require 'rails_helper'

describe Comment, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :content } 
  end

  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_one  :parent }
    it { is_expected.to have_many :replies }
    it { is_expected.to have_many :votes }
  end
end
