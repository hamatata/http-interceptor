require './spec/spec_helper'

def login(user_email)

end

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
