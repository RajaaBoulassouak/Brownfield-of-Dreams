require 'rails_helper'

describe VideoValidation do
  it 'validates video position attribute and updates if nil' do
    tutorial= create(:tutorial)
    valid_video = create(:video, tutorial_id: tutorial.id)
    invalid_video = create(:video, tutorial_id: tutorial.id)
    invalid_video.update_attributes(position: nil)
    
    expect(invalid_video.position).to eq(nil)

    VideoValidation.new(invalid_video).validate
    
    expect(valid_video.position).to eq(0)
    expect(invalid_video.position).to eq(1)
  end
end