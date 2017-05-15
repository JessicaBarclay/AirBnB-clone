feature 'Visit homepage' do
  scenario 'I can see a greeting on the homepage' do
    visit '/'
    expect(page).to have_content('Welcome to MakersBnB')
  end
end
