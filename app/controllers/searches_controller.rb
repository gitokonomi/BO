class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    else
      @records = Recruiting.search_for(@content, @method)
    end
  end
  
  # def search_tag
  #   @content = params[:content]
  #   @records = Recruiting.search_tag_for(@content)
  # end
end
