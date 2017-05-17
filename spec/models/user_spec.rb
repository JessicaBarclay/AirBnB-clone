describe User do

  let!(:user) do
    User.create(email: 'mrt@example.com',
                username: 'MrT',
                password: '12345',
                password_confirmation: '12345')
  end

  it 'logs in a user when correct information is entered' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'doesn\'t allow user to log in with invalid information' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end

  context 'password recovery' do

    it 'saves a password recovery token when we generate a token' do
      expect{ user.generate_token }.to change{ user.password_token }
    end
  end
end
