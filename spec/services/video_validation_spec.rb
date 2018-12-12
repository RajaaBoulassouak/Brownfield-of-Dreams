require 'rails_helper'

describe VideoValidation do
  it 'validates video position attribute and updates if nil' do
    video = create(:video)
    video_1 = video.update_attributes(position: nil)
    video_2 = create(:video)

    valid_video = VideoValidation.new(video_1).validate


    expect(valid_video.position).to eq(2)
  end
end