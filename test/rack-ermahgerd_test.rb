require 'test/unit'
require 'shoulda'
require 'rack/mock'
require 'rack/test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rack-ermahgerd'

class TestRackErmahgerd < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = Proc.new {|env| [200, {'Content-Type' => 'text/plain'}, ['<div>Goosebumps!</div>']]}
    builder = Rack::Builder.new
    builder.use Rack::Ermahgerd
    builder.run app
    builder.to_app
  end

  should 'should provide a response' do
    get '/'
    assert_equal 200, last_response.status
  end

  should "ERMAHGERD-IFY the response" do
    get '/'
    assert_match /GERSBERMS!/, last_response.body
  end

  should "return the correct content length" do
    get '/'
    assert_equal Rack::Utils.bytesize(last_response.body.to_s).to_s, last_response.headers['Content-Length']
  end

end
