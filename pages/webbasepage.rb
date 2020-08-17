
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
    @element = @browser.text_field(id: @selector)

  end
  def fill_data(name)
    @element.set name
    @element.fire_event('onchange')
  end
  end
  #
  # def enterdata_as(name)
  #   name_field.set name
  #   name_field.fire_event('onchange')
  # end
  #
  # private
  # def name_field
  #   @browser.text_field(:id > "firstname")

