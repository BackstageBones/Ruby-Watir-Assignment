require_relative 'webbasepage'


class NamePage < BrowserContainer
  URL = 'https://form.jotform.com/201882323530347'
  @page_header = @browser.text_field(class: 'jsQuestionLabelContainer jfQuestionLabelContainer').wait_until(&:visible?)

  def verify_page_title
    return @page_header.text

  end
end

