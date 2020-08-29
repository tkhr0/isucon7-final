# require 'newrelic_rpm'

if ENV['RACK_ENV'] == 'development'
  require 'lineprof'
end

require './app'
run App
