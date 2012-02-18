require 'pry'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'

class Contacts
  class Hotmail < Base
    include Capybara::DSL
    Capybara.run_server = false
    Capybara.default_driver = :webkit

    PROTOCOL_ERROR      = "Hotmail has changed its protocols "

    def real_connect
      Capybara.app_host = "https://login.live.com"
      Capybara.default_wait_time = 20

      visit('/')
      fill_in  "login",:with => login
      fill_in "passwd",:with => password
      click_button "Sign in"
      visit('https://snt104.mail.live.com/?rru=contacts')
      find_link("continue to Hotmail").click
      sleep(5)
      this_page = page
      this_page.all(:css,'table a').each do |link|
        if link['href'] =~ /ContactMainLight/
          link.click
          sleep(5)
      #    save_and_open_page
          binding.pry
      #    table=find("td")
      #    name=page.find(:css,"#nameVal")
      #    email=page.find(:css,"#emailVal")
        end
      end
      false
    end

    def contacts(options = {})
    end

  end
  TYPES[:hotmail] = Hotmail
end


