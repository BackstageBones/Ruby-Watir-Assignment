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

  def fill_data(*arg)
    @element.set *arg
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

class Combo < BrowserContainer
  def initialize(browser, selector1, selector2 = FALSE)
    super(browser)
    #primary field
    @selector1 = selector1
    #secondary field optional, for nested combos
    @selector2 = selector2
    @element = @browser.div(class: @selector1).wait_until(&:present?)
  end

  def select_option(opt)
    #secenod selector used for nested combos, like the one on page. otherwise use first div
    if @selector2
      @element.click
      @element = @element.ul(xpath: @selector2).li(text: opt).wait_until(&:present?).click
    else
      @element.click
      @element.li(text: opt).wait_until(&:present?).click
    end
    #@element.ul(xpath: '//*[@id="jfDropdown-optionList-10-mixed-dropdown"]/ul').li(text: opt).wait_until(&:present?).click
    sleep 2
  end
  def select_option_from_list(opt)
    #for usual dropdown lists which use html <option
    @element.select opt
    @element.selected_options.fire_event('onchange')
  end
end

