require_relative 'webbasepage'

class WelcomePage < Site
  URL = "https://form.jotform.com/201882323530347"

  def initialize(browser)
    super
  end

  def open
    @browser.goto URL
    self
  end

  def verify_button_presence
    @continue_button = @browser.button(class: ['jfWelcome-button','jfInput-button','forNext-heading']).wait_until(&:present?)
  end

  def proceed_to_name_page
    require_relative 'namepage'
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
