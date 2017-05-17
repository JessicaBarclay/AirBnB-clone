feature 'User management' do

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq('MrT@a.team.com')
  end

  scenario 'User cannot sign up without and email address' do
    expect{ sign_up_with_nil_email }.not_to change(User, :count)
  end

  scenario 'User cannot sign up with an invalid email adress' do
    expect{ sign_up_with_invalid_email }.not_to change(User, :count)
  end

  scenario 'User cannot sign up with mis-matching passwords' do
    expect{ sign_up_with_invalid_password_confirmation }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Passwords do not match')
  end

  scenario 'User can log out after sign up' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content('Thank you for visiting MakersBnB')
    expect(page).not_to have_content('Welcome, pitythefool')
  end
end


feature 'User log in' do

  let!(:user) do
    User.create(email: 'mrt@example.com',
                username: 'MrT',
                password: '12345',
                password_confirmation: '12345')
  end
  scenario 'User can log in with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content('Welcome, MrT')
    expect(page).not_to have_content('Thank you for visiting MakersBnB')
  end
end
