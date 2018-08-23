class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy, :edit]
  
  def index 
    @articles= Article.all
  end 
  
  def new 
   @article =  Article.new 
  end
  
  def create 
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'all fine'
      redirect_to article_path(@article)
    else
      render 'new'
    end  
  end
  
  def show
  
  end
  
  def edit 
    
  end
  
  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:danger] = 'article was deleted'
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description, :author)
  end
  
  def find_article
    @article = Article.find(params[:id])
    
  end
  
  
end