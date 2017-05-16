feature 'User management' do
  scenario 'User cannot sign up with invalid information' do
    expect{ sign_up_with_nil_email }.not_to change(User, :count)
  end

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq('MrT@a.team.com')
  end

  scenario 'User cannot sign up with an invalid email adress' do
    expect{ sign_up_with_invalid_email }.not_to change(User, :count)
  end
end
