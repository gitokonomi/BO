class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @records = User.search_for(@content)
    elsif @model == 'body'
      @records = Recruiting.search_for(@content)
    elsif @model == 'time'
      @records = Recruiting.search_for_time(@content)
    end
  end
  
  # def search_tag
  #   @content = params[:content]
  #   @records = Recruiting.search_tag_for(@content)
  # end
end
