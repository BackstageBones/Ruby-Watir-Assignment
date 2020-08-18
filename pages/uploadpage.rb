require_relative 'webbasepage'
require_relative 'namepage'
require_relative 'signaturepage'

class UploadPage < Site
  URL = 'https://form.jotform.com/201882323530347'
  def initialize(browser)
    super
  end
  def loaded?
    @page_control = @browser.div(class: 'jfUpload-heading forDesktop').wait_until(&:present?)
  end
  def upload_file(directory)
    # @upload_file_button = Button.new(@browser, 'inputContainer')
    # @upload_file_button.click
    @browser.file_field.set(directory)
  end
  def check_if_file_uploaded
    @uploaded_file = @browser.span(class: 'qq-upload-file').wait_until(&:present?)
    @uploaded_file.text
  end

  def go_back_to_namepage
    @previous_switch = Button.new(@browser, 'jfInput-button forPrev u-left')
    @previous_switch.click
    next_page = NamePage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end

  def navigate_to_signaturepage
    #temporary workaround
    @continue_button = @browser.button(xpath: '//*[@id="cid_9"]/div/div[3]/button[2]')
    @continue_button.click
    next_page = SignaturePage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end
end
