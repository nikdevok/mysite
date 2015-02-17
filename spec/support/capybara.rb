require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

Capybara.configure do |config|
  config.match                  = :one
  config.exact_options          = true
  config.ignore_hidden_elements = true
  config.visible_text_only      = false
end


# # Вместо медленного database_cleaner
# # http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
# class ActiveRecord::Base
#   mattr_accessor :shared_connection
#   @@shared_connection = nil

#   def self.connection
#     @@shared_connection || ConnectionPool::Wrapper.new(size: 1) { retrieve_connection }
#   end
# end

# RSpec.configure do |config|
#   config.before :all do
#     # Forces all threads to share the same connection. This works on
#     # Capybara because it starts the web server in a thread.
#     ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
#   end

#   config.before :each, js: true do
#     # Need to wait for active connections because of shared_connection hack
#     # Fixes errors like connection is already in use
#     # wait_for_ajax
#   end
# end
