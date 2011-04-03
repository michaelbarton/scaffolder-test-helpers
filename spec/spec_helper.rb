$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'scaffolder/test/helpers'

RSpec.configure do
  include Scaffolder::Test
  include Scaffolder::Test::Helpers
end
