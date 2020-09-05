require 'erb'
require 'sinatra/base'
require './game'
require 'stackprof'

class App < Sinatra::Base
  use StackProf::Middleware, enabled: true,
                             mode: :cpu,
                             interval: 1000,
                             save_every: 5
  use Game

  configure do
    set :public_folder, File.expand_path('../public/', __FILE__)
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  @@websocket_table = {}
  configure :development do
    @@websocket_table = {
      'dummy' => '',
    }
  end
  configure :production do
    @@websocket_table = {
      # room_name => host
      'dummy' => 'ec2-3-112-238-179.ap-northeast-1.compute.amazonaws.com',
      'dummy2' => 'ec2-18-183-143-45.ap-northeast-1.compute.amazonaws.com',
      'dummy3' => 'ec2-54-249-51-129.ap-northeast-1.compute.amazonaws.com',
      'dummy4' => 'ec2-52-197-92-118.ap-northeast-1.compute.amazonaws.com'
    }
  end

  get '/initialize' do
    Game.initialize!
    204
  end

  get '/room/' do
    content_type :json
    { 'host' => '', 'path' => '/ws' }.to_json
  end

  get '/room/:room_name' do
    room_name = ERB::Util.url_encode(params[:room_name])
    path = "/ws/#{room_name}"

    host = @@websocket_table[room_name]

    if host.nil?
      min_hosts = @@websocket_table.values.group_by {|h| h }.map {|host, hosts| [host, hosts.size]}.min_by {|i| i[1]}
      min_host = min_hosts[0]
      @@websocket_table[room_name] = min_host
      host = min_host
    end

    content_type :json
    { 'host' => host, 'path' => path }.to_json
  end

  get '/' do
    send_file File.expand_path('index.html', settings.public_folder)
  end
end
