class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  
  def create
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.create(comment_params)
    redirect_to publication_path(@publication)
  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.find(params[:id])
    @comment.destroy
    redirect_to publication_path(@publication)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
