require File.expand_path('../../app', __FILE__)
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_renders_home_okay
    get '/'
    assert last_response.ok?
  end
  
  def test_it_renders_posts_page_okay
    get '/posts'
    assert last_response.ok?
  end
  
  def test_it_renders_posts_with_id_1_okay
    get '/posts/1'
    assert last_response.ok?
  end
  
  def test_it_renders_posts_with_id_2_okay
    get '/posts/2'
    assert last_response.ok?
  end
  
  def test_it_renders_posts_with_id_3_okay
    get '/posts/3'
    assert last_response.ok?
  end

  def test_it_renders_tags_page_okay
    get '/tags'
    assert last_response.ok?
  end


  def test_it_renders_tags_with_name_fitness_okay
    get '/tags/fitness'
    assert last_response.ok?
  end

  def test_it_renders_tags_with_name_recreation_okay
    get '/tags/recreation'
    assert last_response.ok?
  end
  
  def test_it_renders_tags_with_name_sports_okay
    get '/tags/sports'
    assert last_response.ok?
  end
  
  def test_it_renders_tags_with_name_cooking_okay
    get '/tags/cooking'
    assert last_response.ok?
  end
  
  def test_it_renders_authors_with_name_pixelated_okay
    get '/authors/pixelated'
    assert last_response.ok?
  end
  
  def test_it_renders_authors_with_name_pixelator_okay
    get '/authors/pixelator'
    assert last_response.ok?
  end
  
end
