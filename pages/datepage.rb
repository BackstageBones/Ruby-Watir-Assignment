require_relative 'webbasepage'

class DatePage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super(browser)
    @date_field = Textbox.new(@browser, 'lite_mode_6')
    @continue_button = @browser.button(xpath: '//*[@id="cid_6"]/div/div[3]/button[2]').wait_until(&:present?)
  end

  def loaded?
    @page_header = @browser.element(xpath: '//*[@id="label_6"]/span').wait_until(&:present?)

  end
  def enter_date(*arg)

    @date_field.fill_data(*arg)
  end

  def navigate_to_securitypage
    require_relative 'securitypage'
    #workaround, since cannot locate by class name

    @continue_button.click
    next_page = SecurityPage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end
  end

