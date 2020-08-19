require_relative 'webbasepage'
require_relative 'namepage'
require 'selenium-webdriver'

class SignaturePage < Site
  URL = 'https://form.jotform.com/201882323530347'

  def initialize(browser)
    super
  end

  def loaded?
    @page_control = @browser.span(xpath: '//*[@id="label_7"]/span').wait_until(&:present?)
  end

  def imitate_signature
    element = @browser.element(class: 'jSignature')
    @browser.driver.action.move_to(element.wd, 50, 50).click_and_hold.move_to(element.wd, 200, 200).release.perform
    sleep 2
  end

  def navigate_to_datepage
    require_relative  'datepage'
    #workaround
    @continue_button = @browser.button(xpath: '//*[@id="cid_7"]/div/div[3]/button[2]').wait_until(&:present?)

    @continue_button.click
    next_page = DatePage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
  end
end
