feature 'Validating links are URL' do
  scenario 'When someone adds a link that is not a real link, raises error' do
    visit '/'
    fill_in('url', with: 'thisisntawebsite')
    click_button 'Add link'
    expect(page).to have_content 'This is not a valid URL'
  end
end
