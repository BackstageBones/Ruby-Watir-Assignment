require 'Watir'
require 'rspec/autorun'
require_relative '../pages/webbasepage'
require 'test/unit'
#Watir.logger.level = :debug
Watir.logger.level = :info


class MyTest < Test::Unit::TestCase




  def test_happy_path
    name_page_title = "Name"
    security_page_title = "Security question"
    example_directory = "C:\\Users\\amiendlarzewski\\RubymineProjects\\Grumpy-cat.jpg"
    example_date = ['11', '08', '1994']
    first_name = "Adrian"
    last_name = "Miendlarzewski"
    file_name = "Grumpy-cat.jpg"
    pet_name = "grumpy-cat"
    site = Site.new(Watir::Browser.new)
    Watir.logger.info('Opening welcome page - Page opened')
    welcome_page = site.form_page.open
    Watir.logger.info('Checking for button presence on site - Button is present')
    assert(welcome_page.verify_button_presence)
    Watir.logger.info("Clicking 'continue button' and proceeding to the next site - button clicked.")
    name_page = welcome_page.proceed_to_name_page
    assert_equal(name_page.verify_page_title,name_page_title )
    name_page.enter_name('Adrian')
    name_page.enter_last_name('Miendlarzewski')
    upload_page = name_page.continue_to_upload_page
    upload_page.upload_file(example_directory)
    assert_equal(upload_page.check_if_file_uploaded, file_name)
    signature_page = upload_page.navigate_to_signaturepage
    signature_page.imitate_signature
    date_page = signature_page.navigate_to_datepage
    date_page.enter_date(example_date)
    security_page = date_page.navigate_to_securitypage
    assert_equal(security_page.verify_page_title, security_page_title)
    security_page.select_question_from_dropdown('Name of the first pet')
    security_page.enter_question_anwser(pet_name)
    security_page.hit_submit_button

    Watir.logger.output = 'watir.log'
  end
  end