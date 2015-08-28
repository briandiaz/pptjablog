require 'sinatra'
require 'json'
require File.expand_path('../models/post', __FILE__)
require File.expand_path('../services/post_service', __FILE__)

get '/' do
	@posts = Post.all()
	erb :index
end

get '/posts' do
	@posts = Post.all()
	erb :index
end

get '/posts/:id' do
	@post = Post.by_id(params[:id]).first
	erb :single
end

get '/authors/:name' do
	@posts = Post.by_author(params[:name])
	erb :index
end

get '/tags/:name' do
	@posts = Post.by_tag(params[:name])
	erb :index
end


def root_url
	@root_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
end