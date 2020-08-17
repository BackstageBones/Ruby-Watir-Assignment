require_relative 'webbasepage'
class WelcomePage < BrowserContainer
  URL = "https://form.jotform.com/201882323530347"
  @continue_button = Button.new(@browser, 'jfWelcome-button jfInput-button  forNext-heading')

  def open
    @browser.goto URL
    self
  end

  def verify_button_presence
    @continue_button.

  end

  def proceed_to_name_page
    @continue_button.click
    next_page = NamePage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page

  end

  #end WelcomePage
end

#private
#
#   def user_field
#     @browser.text_field(:name => "user")
#   end
#
#   def password_field
#     @browser.text_field(:name => "pass")
#   end
#
#   def login_button
#     @browser.button(:id => "login")
#   end
# end # LoginPage
