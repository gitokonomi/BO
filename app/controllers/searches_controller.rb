class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @records = User.search_for(@content)
    elsif @model == 'body'
      @records = Recruiting.search_for(@content)
    # elsif @model == 'time'
    #   @records = Recruiting.search_for_time(@content)
    end
  end

  def search_prefecture
    @content = params[:content]
    # 検索結果にnameカラム表示するため
    prefecture = Prefecture.find(@content)
    @prefecturename = prefecture.name
    @records = Recruiting.search_prefecture_for(@content)
  end

end
