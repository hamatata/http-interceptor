require './spec/spec_helper'

def click(css_locator)
  find(css_locator).click
end

def click_by_id(id)
  find('#' + id).click
end

def fill_in_css(css, text)
  element = find(css)
  element.set(text)
  element.native.send_keys(:return)
end

def press_enter(css)
  find(css).native.send_keys(:return)
end

def login(user)
  within('#login_Form') do
    fill_in 'username', with: user['email']
    fill_in 'password', with: user['password']
  end
  click_button 'signinButton'
end

def navigate_to_usps
  click '#header-createLabel'
  click 'a[data-translate="CARRIER.USPS.MENU_TITLE"]'
end

def fill_recipient_address
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
end

def click_email_notification
  click 'pb-email-notification .control-indicator'
end

def verify_recipient_and_continue
  click_button 'createLabel-verifyRecipient-and-continue'
  #sleep 2
  click '.modal-dialog #createLabel-verifyAddress-suggested'
end

def select_parcel
  click '[data-translate="PARCEL.TOOLBAR.USPS.SFRB.NAME"]'
  click_button 'accept-parcel-form-button'
end

def click_create_label
  click_button 'createLabel-print-btn'
end

def click_print_button
  click_button 'createLabel-labeloptions-print-btn'
end

