require_relative 'webbasepage'

class SecurityPage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super(browser)
    @security_page_dropdown = Combo.new(@browser, "jfDropdown-chipContainer", '//*[@id="jfDropdown-optionList-10-mixed-dropdown"]/ul')
    @entry_field = Textbox.new(@browser, "input_10_field_2")
    @submit_button = Button.new(@browser, "jfInput-button forSubmit form-submit-button u-right")
  end

  def loaded?
    @page_header = @browser.element(xpath: '//*[@id="label_10"]/span').wait_until(&:present?)
  end

  def verify_page_title
    return @page_header.text
  end

  def select_question_from_dropdown(opt)

    @security_page_dropdown.select_option(opt)

  end

  def enter_question_anwser(*arg)
    #arg string argument

    @entry_field.fill_data(*arg)
  end

  def hit_submit_button
    @submit_button.click
  end
end
