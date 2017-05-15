feature 'User management' do
  scenario 'User can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
  end
end
