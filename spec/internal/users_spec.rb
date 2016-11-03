require './spec/spec_helper'

describe Users, :type => :feature do

  before(:all) { @users = Users.new }

  context 'finds user correctly by', :users do

    it 'email' do
      email = 'test_user@mail.com'
      user = @users.get_user_by_email(email)
      expect(user['email']).to eql(email)
    end

    it 'name' do
      name = 'test user 2'
      user = @users.get_user_by_name(name)
      expect(user['name']).to eql(name)
    end

  end

end