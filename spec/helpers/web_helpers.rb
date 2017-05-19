def sign_up(*)
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'pitythefool'
  fill_in :password, with: 'snickers'
  fill_in :password_confirmation, with: 'snickers'
  click_button 'Sign Up'
end

def sign_up_with_nil_email
  visit '/'
  fill_in :email, with: nil
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'example'
  click_button 'Sign Up'
end

def sign_up_with_invalid_email
  visit '/'
  fill_in :email, with: 'i23rf9dfoi34'
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'example'
  click_button 'Sign Up'
end

def sign_up_with_invalid_password_confirmation
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'doggo'
  click_button 'Sign Up'
end

def log_in(email:, password:)
  visit '/'
  click_button 'Login'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def list_a_space
  visit '/listing'
  click_button 'List a Space'
  fill_in :name, with: 'hideout'
  fill_in :description, with: 'good for making plans, if you can find it'
  fill_in :price, with: 999999
  fill_in :availablefrom, with: "2018-01-01"
  fill_in :availableto, with: "2018-01-02"
  click_button 'List my Space'
end

def recover_password
  visit '/'
  click_button 'Login'
  click_link 'I forgot my password'
  fill_in :email, with: "MrT@a.team.com"
  click_button "Submit"
end

def set_password(password:, password_confirmation:)
  visit("/users/reset_password?token=#{user.password_token}")
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def make_a_request
  sign_up
  list_a_space
  click_link 'View Listing'
  fill_in :requestfrom, with: "2018-01-01"
  fill_in :requestuntil, with: "2018-01-02"
  click_button 'Request to Book'
end

def make_a_request_while_logged_out
  sign_up
  list_a_space
  click_button 'Log out'
  visit '/listing'
  click_link 'View Listing'
  fill_in :requestfrom, with: "2018-01-01"
  fill_in :requestuntil, with: "2018-01-02"
  click_button 'Request to Book'
end
