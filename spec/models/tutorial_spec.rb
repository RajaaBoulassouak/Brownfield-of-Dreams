require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'Methods' do 
    it 'not_classroom_content' do
      tutorial1 = create(:tutorial)
      tutorial2 = create(:tutorial)
      tutorial3 = create(:tutorial, classroom: true)

      video1 = create(:video, tutorial_id: tutorial1.id)
      video2 = create(:video, tutorial_id: tutorial1.id)
      video3 = create(:video, tutorial_id: tutorial2.id)
      video4 = create(:video, tutorial_id: tutorial2.id)
      video5 = create(:video, tutorial_id: tutorial3.id)
    
      actual = Tutorial.not_classroom_content
      expected = [tutorial1, tutorial2]
      
      expect(expected).to eq(actual)
      expect(expected.count).to eq(2)
    end 
  end
end
