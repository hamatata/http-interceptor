require './spec/spec_helper'

### Recipient

# CSS
$select_recipient_country = "[id='selectRecipientCountry']"
$recipient_full_mame = "recipient-address-input [ng-model='model.contact.fullName']"
$recipient_company = "recipient-address-input [ng-model='model.contact.companyName']"
$recipient_address_line1 = "[ng-model='model.streetLine1']"
$recipient_city = "[ng-model='model.city']"
$recipient_province = "[ng-model='model.province']"
$recipient_state = "[ng-model='model.state']"
$recipient_postal_code = "[ng-model='model.postalCode']"
$recipient_zip_code = "[ng-model='model.zipcode']"
$recipient_email_address = "[ng-model='model.contact.primaryEmail']"
# $recipient_contact_phone_number = "[ng-model='model.contact.primaryEmail']"
$recipient_address_validate_btn = '.btn.btn-info'
$error_message = "[class='help-block ng-binding']"


# XPath
$recipient_accept_and_verify = '//bootstrap-decorator[10]/div/input'
$recipient_save_to_address_book = '//bootstrap-decorator[10]/div/button[1]'