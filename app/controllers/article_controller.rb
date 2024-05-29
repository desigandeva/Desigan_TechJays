class ArticleController < ApplicationController
    # GET /article/index/
    def index
    end

    # GET /article/list/
    def list
        @articles = Article.all
    end

    # GET /article/new/
    def new
        @article = Article.new
    end

    # POST /article/create/
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_index_path
        else
            redirect_to article_new_path
        end
    end

    # GET /article/edit/
    # fetch data in perticular id (by => :id)
    def edit
        @article = Article.find(params[:id])
    end

    # PUT/PATCH /article/update/
    # update the given data in particular id (by => :id)
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        redirect_to article_index_path
    end

    # DELETE /article/delete/
    # destory or delete the perticular data (by => :id)
    def delete
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to article_index_path
    end

    # GET /article/show/
    # fetch data in perticular id (by => :id)
    def show
        @article = Article.find(params[:id])
    end

    private
    # it's only allow a list of parameters
    def article_params
        params.require(:article).permit(:title,:content,:author)
    end

end
