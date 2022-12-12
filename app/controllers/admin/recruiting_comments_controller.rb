class Admin::RecruitingCommentsController < ApplicationController
  
  def destroy
    RecruitingComment.find(params[:id]).destroy
    redirect_to admin_recruiting_path(params[:recruiting_id])
  end
end
