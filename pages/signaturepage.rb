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
    element = @browser.element(tag_name: 'canvas').hover
    # @mouse_finish = @browser.element(class: 'clear-pad-btn clear-pad')
    @browser.driver.action.click_and_hold(element).perform
    sleep 2
    #@browser.driver.action.move_to(@mouse_start, 15, 15).click.perform
    @mouse_finish = @browser.driver.action.move_to(element.size, 50, 50).perform
    sleep 2
    @mouse_finish.fire_event "onmouseover"



  end
  end
