require './spec/spec_helper'

class Users

  def initialize
    @users = read_json_file('./config/users.json')
  end

  # TODO: finish this if it is needed at all
  # # you can specify any value - name | email
  # def exist?(key_value)
  #   key = ''
  #   user = @users.find {|key, value| value == key_value}
  # end

  def get_user_by_email(email)
    user = @users.find {|user| user['email'] == email}
    raise "There is no user with email: '#{email}'" if user.nil?
    user
  end

  def get_user_by_name(name)
    user = @users.find {|user| user['name'] == name}
    raise "There is no user with name: '#{name}'" if user.nil?
    user
  end

  private
  def get_user_password(email)
    user = get_user_by_email(email)
    user['password']
  end

end
