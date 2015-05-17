class CommentsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :destroy]
  before_filter :load_project

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to projects_path, notice: "Comment created successfully"
    else
      render "projects/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
