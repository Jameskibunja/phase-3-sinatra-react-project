require_relative './config/environment'

require 'rack/parser'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end

use Rack::Parser, :parsers => {
  'application/json' => proc { |body| JSON.parse(body) }
}

run ApplicationController
