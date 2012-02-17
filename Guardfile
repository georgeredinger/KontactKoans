# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :test, :test_paths => ['test', 'test/unit' ] do
  watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^lib/contacts/(.+)\.rb$})     { |m| "test/unit/#{m[1]}_contact_importer_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/unit/.+_test\.rb$})
  watch('test/test_helper.rb')  { "test" }
end
