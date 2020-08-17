require 'Watir'
require_relative '../pages/webbasepage'


site = Site.new(Watir::Browser.new)
welcome_page = site.form_page.open
welcome_page.verify_button_presence
name_page = welcome_page.proceed_to_name_page
name_page.verify_page_title
name_page.enter_name('Adrian')
name_page.enter_last_name('Miendlarzewski')