
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

class Textbox < BrowserContainer
  def initialize(browser, selector)
    @browser = browser
    @selector = selector
    @element = @browser.text_field(id: @selector).wait_until(&:present?)

  end
  def fill_data(name)
    @element.set name
    @element.fire_event('onchange')
  end
  end
class Button < BrowserContainer
  def initialize(browser, selector)
    @browser = browser
    @selector = selector
    @element = @browser.button(class: @selector).wait_until(&:present?)
  end
  def click
    @element.click
    end 
  end

