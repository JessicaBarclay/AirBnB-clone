def sign_up
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'pitythefool'
  fill_in :password, with: 'snickers'
  fill_in :password_confirmation, with: 'snickers'
  click_button 'Sign Up'
end

def list_a_space
  visit '/listings'
  fill_in :name, with: 'hideout'
  fill_in :description, with: 'good for making plans, if you can find it'
  fill_in :price, with: 999999
  fill_in :date_from, with: 01/01/81
  fill_in :date_to, with: 02/01/81
  click_button 'List my Space'
end
