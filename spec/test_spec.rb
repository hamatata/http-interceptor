require 'spec_helper'

describe 'sign in', :type => :feature do

  before(:all) do
    users = Users.new
    @user = users.get_user_by_name('main_user')
  end

  it 'signs me in', :wip do

    proxy_start

    visit 'http://ui-dev.horizon.pitneycloud.com'
    sleep 2
    login(@user)
    #puts page.execute_script('if (localStorage && localStorage.clear) localStorage.clear()')

    sleep 1
    navigate_to_usps
    fill_recipient_address
    click_email_notification
    verify_recipient_and_continue
    select_parcel
    click_create_label
    click_print_button

    proxy_stop
  end
end
