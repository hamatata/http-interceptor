require 'spec_helper'

describe 'sign in', :type => :feature do

  before(:all) do
    users = Users.new
    @user = users.get_user_by_name('main_user')
  end

  it 'signs me in', :wip do
    visit 'http://ui-dev.horizon.pitneycloud.com'
    within('#login_Form') do
      fill_in 'username', with: @user['email']
      fill_in 'password', with: @user['password']
    end
    click_button 'signinButton'

    sleep 1
    click '#header-createLabel'
    click 'a[data-translate="CARRIER.USPS.MENU_TITLE"]'

    fill_in 'createLabel-fullNameRecipient', with: 'Sachin Tendulkar'
    fill_in 'createLabel-companyNameRecipient', with: 'BCCI'
    fill_in 'createLabel-streetLine1Recipient', with: '37 Executive Drive'
    fill_in 'createLabel-cityRecipient', with: 'Danbury'
    state = '#createLabel-stateContainerRecipient'
    state_input = state + ' ' + 'input'
    click state
    fill_in_css(state_input, 'CT')
    fill_in 'createLabel-postalCodeRecipient', with: '06810'
    fill_in 'createLabel-phoneRecipient', with: '1'*10

    click 'pb-email-notification .control-indicator'
    click_button 'createLabel-verifyRecipient-and-continue'
    sleep 2
    click '.modal-dialog #createLabel-verifyAddress-suggested'

    click '[data-translate="PARCEL.TOOLBAR.USPS.SFRB.NAME"]'
    click_button 'accept-parcel-form-button'
    click_button 'createLabel-print-btn'
    click_button 'createLabel-labeloptions-print-btn'
    sleep 5
    make_screenshot


  end
end
