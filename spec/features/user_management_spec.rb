feature 'User management' do
  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq('MrT@a.team.com')
  end

  scenario 'User is greeted at properties' do
    sign_up
    expect(page).to have_content 'Welcome, pitythefool'
  end
end
