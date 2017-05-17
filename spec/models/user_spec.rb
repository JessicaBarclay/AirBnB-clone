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

    it 'can find a user with a valid recovery token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it 'can\'t find a user with a token over 1 hour in the future' do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end

    it 'saves a password recovery token time when we generate a token using Timecop' do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end
  end
end
