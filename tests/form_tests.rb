require 'Watir'
require_relative '../pages/webbasepage'
Watir.logger.level = :debug

example_directory = "C:\\Users\\amiendlarzewski\\Downloads\\Miendlarzewski_CV.pdf"

site = Site.new(Watir::Browser.new)
Watir.logger.info('Opening welcome page - Page opened')
welcome_page = site.form_page.open
Watir.logger.info('Checking for button presence on site - Button is present')
welcome_page.verify_button_presence
Watir.logger.info("Clicking 'continue button' and proceeding to the next site - button clicked.")
name_page = welcome_page.proceed_to_name_page
name_page.verify_page_title
name_page.enter_name('Adrian')
name_page.enter_last_name('Miendlarzewski')
upload_page = name_page.continue_to_upload_page
upload_page.upload_file(example_directory)

Watir.logger.output = 'watir.log'