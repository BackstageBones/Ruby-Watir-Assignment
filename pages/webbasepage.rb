require_relative 'welcomepage'
class BrowserContainer
  def initialize(browser)
    @browser = browser
  end
end

class Site < BrowserContainer
  URL = ""

  def open
    @browser.goto URL
    self
  end

  def form_page
    @form_page = WelcomePage.new(@browser)
  end

  def verify_address
    @browser.url == URL
  end

  def close()
    @browser.close
  end
end


# Site

class Textbox < BrowserContainer
  def initialize(selector)
    @selector = selector
    name_field
  end

  def enterdata_as(name)
    name_field.set name
    name_field.fire_event('onchange')
  end

  def name_field
    @browser.text_field(:@selector => @selector).wait_until(&:enabled?)
  end
end

class Button < BrowserContainer
  def initialize(selector)
    @selector = selector
    @element = @browser.button(:xpath => @selector).wait_until(&:enabled?)
  end

  def button_present
    return @element.present?
  end

  def click
    @element.click
  end
end
