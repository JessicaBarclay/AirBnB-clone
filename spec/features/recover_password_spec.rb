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

  scenario "it doesn't allow you to use the token after 1 hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario "it allows you to reset password with valid token" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content "Please enter your new password"
  end

  scenario 'it lets you enter a new password with a valid token' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "new"
    fill_in :password_confirmation, with: "new"
    click_button "Submit"
    expect(page).to have_content "Log into MakersBnB!"
  end

  scenario 'it lets you sign in after password reset' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button 'Submit'
    log_in(email: "MrT@a.team.com", password: "newpassword")
    expect(page).to have_content "Welcome, pitythefool"
  end

   scenario 'it lets you know if your passwords don\'t match' do
     recover_password
     visit("/users/reset_password?token=#{user.password_token}")
     fill_in :password, with: "newpassword"
     fill_in :password_confirmation, with: "wrongpassword"
     click_button "Submit"
     expect(page).to have_content("Your token is invalid")
   end

  #  scenario 'it resets token upon succesful password update' do
  #    recover_password
  #    set_password(password: 'newpassword', password_confirmation: 'newpassword')
  #    visit("/users/reset_password?token=#{user.password_token}")
  #    expect(page).to have_content "Your token is invalid"
  #  end
end
