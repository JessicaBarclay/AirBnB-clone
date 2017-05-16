def sign_up
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'pitythefool'
  fill_in :password, with: 'snickers'
  fill_in :password_confirmation, with: 'snickers'
  click_button 'Sign Up'
end
