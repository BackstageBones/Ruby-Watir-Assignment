require_relative 'webbasepage'
require_relative 'namepage'

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

  def switch_to_previous_page
    @previous_switch = Button.new(@browser, 'jfInput-button forPrev u-left')
    @previous_switch.click
    next_page = NamePage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end
end
