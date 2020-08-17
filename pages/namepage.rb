require_relative 'webbasepage'


class NamePage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super
  end
  def loaded?
    @page_header = @browser.span(xpath: '//*[@id="label_3"]/span').wait_until(&:visible?)
  end
  def verify_page_title
    return @page_header.text

  end
end
