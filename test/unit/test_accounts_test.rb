require 'pry'
dir = File.expand_path(__FILE__)
require dir.split("/")[0..-3].join("/")+"/test_helper.rb"

class TestAccountsTest < ContactImporterTestCase
  def test_test_accounts_loads_data_from_example_accounts_file
    accounts_yml_file = File.expand_path(__FILE__).split("/")[0..-3].join("/") + "/accounts.yml"
    account = TestAccounts.load(accounts_yml_file)[:gmail]
    assert_equal :gmail, account.type
    assert_equal "brs.with.leads@gmail.com", account.username
#    assert_equal "notreallySecure", account.password
    assert_equal [["Marton", "meza@meza.hu"]], account.contacts
  end
  
  def test_test_accounts_blows_up_if_file_doesnt_exist
    assert_raise(RuntimeError) do
      TestAccounts.load("file_that_does_not_exist.yml")
    end
  end
  
  def test_we_can_load_from_account_file
    assert_not_nil TestAccounts[:gmail].username
  end
end
