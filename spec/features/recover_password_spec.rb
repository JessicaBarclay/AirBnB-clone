feature 'Resetting Password' do

  before do
    sign_up
    Capybara.reset!
  end
  let(:user) { User.first }

  scenario 'assigned a reset token to the user when they recover' do
    sign_up
    click_button 'Log out'
    expect{ recover_password }.to change{ User.first.password_token }
  end

  scenario 'Users can reset lost passwords' do
    visit '/'
    click_button 'Login'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario "When I enter my email I'm told to check my inbox" do
    recover_password
    expect(page).to have_content "Thank you"
  end

  scenario "it doesn't allow you to use the token afte 1 hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is expired"
    end
  end
end
