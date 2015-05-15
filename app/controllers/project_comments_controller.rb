class ProjectCommentsController < ApplicationController
  before_filter :load_product

  def show
    @project_comment = Project_comment.find(params[:id])
  end

  def create
    @project_comment = @project.project_comments.build(project_comment_params)
    @project_comment.user = current_user

    if @project_comment.save
      redirect_to projects_path, notice: "Comment created successfully"
    else
      render "projects/show"
    end
  end

  def destroy
    @project_comment = Project_comment.find(params[:id])
    !project_comment.destroy
  end

  private
  def project_comment_params
    params.require(:project_comment).permit(:comment, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
