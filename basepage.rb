require 'FormPage'

class BrowserContainer
  def initialize(browser)
    @browser = browser
  end
end

class Site < BrowserContainer
  URL = ""

  def form_page()
    @form_page = WelcomePage.new(@browser)
  end

  def verify_title()
    @browser.url == URL
  end

  def close()
    @browser.close
  end
end

# Site

class Textbox < BrowserContainer
  def initialize(selector, str)
    @selector = selector
    @string = str
  end
  def enterdata_as(name)
    name_field.set name
    name_field.fire_event('onchange')
  end

  def name_field
    @browser.text_field(:@selector => @string).wait_until(&:enabled?)
  end
end

class Button < BrowserContainer
  def initialize(selector, str)
    @selector = selector
    @string = str
    @element = @browser.button(@selector => @string).wait_until(&:enabled?)
  end
  def click()
    @element.click
  end

end




class UserPage < BrowserContainer
  def logged_in?
    logged_in_element.exists?
  end

  def loaded?
    @browser.title == "Your Profile"
  end

  private

  def logged_in_element
    @browser.div(id: "logged-in")
  end
end

# UserPage