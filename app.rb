require 'sinatra/base'
# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require

Dir["models/*.rb"].each {|file| require File.expand_path('../'+file, __FILE__) }

Mongoid.load!('config/mongoid.yml')

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'assets/js'
    serve '/css',    from: 'assets/css'
    serve '/img', from: 'assets/img'

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    js :app, '/js/app.js', [
      '/js/app.js',
      '/js/vendor/**/*.js',
      '/js/app/**/*.js'
    ]

    css :app, '/css/application.css', [
      '/css/app.css',
      '/css/vendor/bootstrap/bootstrap.css'
    ]

    js_compression  :jsmin      # Optional
    css_compression :simple       # Optional
  }

  get '/' do
    @categories = Category.all
    erb :index
  end

  get '/rss' do
    @notices = Notice.all
    content_type 'application/rss+xml'
    erb :rss
  end

  post '/subscribe' do
    @subscriber = Subscriber.create(email: params[:email], filters: params[:filters])
    erb :subscribe
  end

  get '/favicon.ico' do
    nil
  end

  run! if app_file == $0
end