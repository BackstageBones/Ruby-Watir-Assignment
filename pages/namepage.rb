require_relative 'webbasepage'


class NamePage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super(browser)
    @name_textbox = Textbox.new(@browser, 'first_3')
    @lastname_textbox = Textbox.new(@browser, 'last_3')
    @continue_button = Button.new(@browser, "jfInput-button forNext u-right")
  end

  def loaded?
    @page_header = @browser.span(xpath: '//*[@id="label_3"]/span').wait_until(&:present?)
  end

  def verify_page_title
    return @page_header.text
  end

  def enter_name(str)
    @name_textbox.fill_data(str)
  end

  def enter_last_name(str)
    @lastname_textbox.fill_data(str)
  end

  def continue_to_upload_page
    require_relative 'uploadpage'

    @continue_button.click
    next_page = UploadPage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end
end
