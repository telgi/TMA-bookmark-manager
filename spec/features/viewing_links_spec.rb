feature 'displays list of bookmarks' do
  scenario 'User can see bookmark titles' do
    visit '/'
    expect(page).to have_content 'makersacademy'
    expect(page).to have_content 'google'
  end
end
