require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end
  
  describe 'Relationships' do 
    it { should have_one :gh_user}
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'Class Methods' do
    it 'can retrieve user\'s bookmarked tutorials and group them by tutorial name then sort them by video position' do
      user_1 = User.create(first_name: 'Grace', last_name: 'Hopper', email: 'og@coder.com', password: 'hamburger1')
      user_2 = User.create(first_name: 'Ada', last_name: 'Lovelace', email: 'ada@coder.com', password: 'hamburger2')
      tutorial_1 = Tutorial.create(title: 'Generic Title 1', description: 'Generic Description 1', thumbnail: 'lazy url 1', playlist_id: 1)
      tutorial_2 = Tutorial.create(title: 'Generic Title 2', description: 'Generic Description 2', thumbnail: 'lazy url 2', playlist_id: 1)
      video_1 = Video.create(title: 'Awesome Title 1', description: 'Awesome Description 1', video_id: 'abc123', thumbnail: 'generic_url_1', tutorial_id: tutorial_1.id)
      video_2 = Video.create(title: 'Awesome Title 2', description: 'Awesome Description 2', video_id: 'xyz789', thumbnail: 'generic_url_2', tutorial_id: tutorial_2.id)
      bookmark_1 = Bookmark.create(user_id: user_1.id, video_id: video_1.id)
      bookmark_1 = Bookmark.create(user_id: user_1.id, video_id: video_2.id)

      expect(user_1.bookmarks.count).to eq(2)
      expect(user_1.videos.count).to eq(2)
      expect(user_1.bookmarked_tutorials[0].title).to eq(tutorial_1.title)
      expect(user_1.bookmarked_tutorials[1].title).to eq(tutorial_2.title)
    end
  end
end
