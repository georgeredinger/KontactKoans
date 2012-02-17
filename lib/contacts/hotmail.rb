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
      f=find(:css,'div#m_wh div#c_header.c_hb div.c_hta div.c_hg div.c_h div.c_htr div.c_hleft ul.c_ht li a.uxfa_ml span#c_murc').trigger('mouseover')
      find_link('Contacts').click

      save_and_open_page
      #possibly a useragent string problem here useragent string sent by capybara-webkit
      false
    end

    def contacts(options = {})
    end

  end
  TYPES[:hotmail] = Hotmail
end


