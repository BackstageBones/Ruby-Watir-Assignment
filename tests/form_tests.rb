require 'Watir'
require 'rspec/autorun'
require_relative '../pages/webbasepage'
require 'test/unit'
#Watir.logger.level = :debug
Watir.logger.level = :info


class MyTest < Test::Unit::TestCase




  def test_happy_path
    example_directory = "C:\\Users\\amiendlarzewski\\RubymineProjects\\Grumpy-cat.jpg"
    site = Site.new(Watir::Browser.new)
    Watir.logger.info('Opening welcome page - Page opened')
    welcome_page = site.form_page.open
    Watir.logger.info('Checking for button presence on site - Button is present')
    welcome_page.verify_button_presence
    Watir.logger.info("Clicking 'continue button' and proceeding to the next site - button clicked.")
    name_page = welcome_page.proceed_to_name_page
    assert_equal(name_page.verify_page_title, "Name")
    name_page.enter_name('Adrian')
    name_page.enter_last_name('Miendlarzewski')
    upload_page = name_page.continue_to_upload_page
    upload_page.upload_file(example_directory)
    assert_equal(upload_page.check_if_file_uploaded, "Grumpy-cat.jpg")
    signature_page = upload_page.navigate_to_signaturepage
    signature_page.imitate_signature

    Watir.logger.output = 'watir.log'
  end
  end