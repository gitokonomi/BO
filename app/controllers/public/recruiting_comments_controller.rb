class Public::RecruitingCommentsController < ApplicationController
  
  def create
    recruiting = Recruiting.find(params[:recruiting_id])
    comment = current_user.recruiting_comments.new(recruiting_comment_params)
    comment.recruiting_id = recruiting.id
    comment.save
    redirect_to recruiting_path(recruiting)
  end

  def destroy
    RecruitingComment.find(params[:id]).destroy
    redirect_to recruiting_path(params[:recruiting_id])
  end



  private

  def recruiting_comment_params
    params.require(:recruiting_comment).permit(:comment)
  end

end
