require_relative 'webbasepage'


class NamePage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super
  end
  def loaded?
    @page_header = @browser.span(xpath: '//*[@id="label_3"]/span').wait_until(&:present?)
  end
  def verify_page_title
    return @page_header.text

  end
  def enter_name(str)
    @name_textbox = Textbox.new(@browser, 'first_3')
    @name_textbox.fill_data(str)
  end
  def enter_last_name(str)
    @lastname_textbox = Textbox.new(@browser, 'last_3')
    @lastname_textbox.fill_data(str)
  end
end
