require 'rails_helper'

describe CommentVote, type: :model do

  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :comment } 
  end
end
