require 'rails_helper'

describe 'A registered user' do
  it 'can add videos to their bookmarks' do
    tutorial= create(:tutorial, title: "How to Tie Your Shoes")
    video = create(:video, title: "The Bunny Ears Technique", tutorial: tutorial)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    expect {
      click_on 'Bookmark'
    }.to change { Bookmark.count }.by(1)

    expect(page).to have_content("Bookmark added to your dashboard")
  end

  it "can't add the same bookmark more than once" do
    tutorial= create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'
    expect(page).to have_content("Bookmark added to your dashboard")
    click_on 'Bookmark'
    expect(page).to have_content("Already in your bookmarks")
  end

  it "display user\'s bookmarks grouped by tutorial description and ordered by video position" do
    tutorial_1= create(:tutorial)
    tutorial_2= create(:tutorial)
    video_1 = create(:video, tutorial_id: tutorial_1.id)
    video_2 = create(:video, tutorial_id: tutorial_2.id)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial_1)
    click_on 'Bookmark'
    
    visit tutorial_path(tutorial_2)
    click_on 'Bookmark'

     visit '/dashboard'

     expect(page).to have_content('Bookmarked Segments')
     within(".tutorial-#{tutorial_1.id}") do
      expect(page).to have_content(tutorial_1.description)
    end
     within(".video-#{video_1.id}") do
      expect(page).to have_content(video_1.title)
    end
     within(".tutorial-#{tutorial_2.id}") do
      expect(page).to have_content(tutorial_2.description)
    end
     within(".video-#{video_2.id}") do
      expect(page).to have_content(video_2.title)
    end
  end
end
