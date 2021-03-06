
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :root 
  end

  get '/articles/new' do 
    @article = Article.new
    erb :new
  end 

  post '/articles' do 
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
    #redirect '/articles/#{@article.id}'
  end

  get '/articles' do 
    @articles = Article.all 
    erb :index 
  end  

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show 
  end 

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit 
  end 

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.update(params[:edit_article])
    @article.save 

    erb :show 
  end 

  delete '/articles/:id/delete' do 
    @article = Article.find(params[:id])
    @article.destroy 

    erb :delete 
  end 


end
