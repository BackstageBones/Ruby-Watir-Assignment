require 'Watir'
require 'rspec/autorun'
require_relative '../pages/webbasepage'
require 'test/unit'
#Watir.logger.level = :debug
Watir.logger.output = 'watir.log'
Watir.logger.level = :info


class MyTest < Test::Unit::TestCase

  def initialize(test_method_name)
    super
    @name_page_title = "Name"
    @security_page_title = "Security question"
    @example_directory = "C:\\Users\\amiendlarzewski\\RubymineProjects\\Grumpy-cat.jpg"
    @example_date = ['11', '08', '1994']
    @first_name = "Adrian"
    @last_name = "Miendlarzewski"
    @file_name = "Grumpy-cat.jpg"
    @pet_name = "grumpy-cat"
    @dropdown_question = 'Name of the first pet'
    #Test data end
  end


  def test_happy_path

    site = Site.new(Watir::Browser.new)
    Watir.logger.info('Opening welcome page - Page opened')
    welcome_page = site.form_page.open
    Watir.logger.info('Checking for button presence on site - Button is present')
    assert(welcome_page.verify_button_presence)
    Watir.logger.info("Clicking 'continue button' and proceeding to the next site - button clicked.")
    name_page = welcome_page.proceed_to_name_page
    Watir.logger.info("Validating if page header is named 'Name' - Page header validated.")
    assert_equal(name_page.verify_page_title, @name_page_title)
    Watir.logger.info("Entering first name in the field - Name entered.")
    name_page.enter_name(@first_name)
    Watir.logger.info("Entering last name in the field - Last name entered.")
    name_page.enter_last_name(@last_name)
    Watir.logger.info("Clicking continue button and proceeding to the Upload page - Upload page opened.")
    upload_page = name_page.continue_to_upload_page
    Watir.logger.info("Uploading file to the site - File successfully uploaded.")
    upload_page.upload_file(@example_directory)
    assert_equal(upload_page.check_if_file_uploaded, @file_name)
    Watir.logger.info("Clicking continue button and proceeding to the signature page - Signature page opened.")
    signature_page = upload_page.navigate_to_signaturepage
    Watir.logger.info("Imitate signature inside field - Signature marked.")
    signature_page.imitate_signature
    Watir.logger.info("Clicking continue button and proceeding to the date page - Date page opened.")
    date_page = signature_page.navigate_to_datepage
    Watir.logger.info("Entering example date in the field - Date entered successfully.")
    date_page.enter_date(@example_date)
    Watir.logger.info("Clicking continue button and proceeding to the security page - Security page opened.")
    security_page = date_page.navigate_to_securitypage
    Watir.logger.info("verifying if page header is named 'Security Question' - Page header verified.")
    assert_equal(security_page.verify_page_title, @security_page_title)
    Watir.logger.info("Select prefered security question from dropdown - Security question selected.")
    security_page.select_question_from_dropdown(@dropdown_question)
    Watir.logger.info("Entering security question anwser in the field - Security question anwser entered.")
    security_page.enter_question_anwser(@pet_name)
    Watir.logger.info("Clicking submit form button - Button successfully clicked.")
    security_page.hit_submit_button


  end
end