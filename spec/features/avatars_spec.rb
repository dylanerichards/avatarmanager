require 'rails_helper'

feature 'avatars' do
  scenario 'creating an avatar' do
    visit root_path
    click_on 'new avatar'
    
    expect {
      attach_file 'Photo', '/Users/DylanRichards/Pictures/iPhoto Library.photolibrary/Masters/2014/08/29/20140829-061646/IMG_6679.JPG'
      fill_in 'Name', with: 'Dylan'
      fill_in 'Description', with: 'Richards'
      click_on 'Create Avatar'
    }.to change(Avatar, :count).by 1
  end

  scenario 'deleting an avatar' do
    visit root_path
    click_on 'new avatar'

    attach_file 'Photo', '/Users/DylanRichards/Pictures/iPhoto Library.photolibrary/Masters/2014/08/29/20140829-061646/IMG_6679.JPG'
    fill_in 'Name', with: 'dylan'
    fill_in 'Description', with: 'richards'
    click_on 'Create Avatar'

    click_link 'dylan'
    expect {
      click_link 'delete'
    }.to change(Avatar, :count).by -1

  end
end
