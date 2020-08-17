
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
    require_relative 'welcomepage'
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
    @browser.text_field(:id => @selector).wait_until(&:visible?)
  end
end

class Button < BrowserContainer
  def initialize(browser, selector)
    @browser = browser
    @selector = selector

  end

  def button_present
    @browser.button(:xpath => @selector).wait_until(&:present?)
  end

  def click
    @browser.button(:xpath => @selector).wait_until(&:enabled?).click
  end
end
