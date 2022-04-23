require 'sinatra'

before do
  cache_control :public, :must_revalidate, :max_age => 0
end

get '/' do
  erb :index
end

get '/search' do
  content_type :json
  res = { lib: params[:lib], query: params[:query] }
  res.to_json
end