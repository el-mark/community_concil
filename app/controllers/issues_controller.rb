class IssuesController < ApplicationController
  before_action :require_verified_user, only: [:new, :create]

  def index
    @issues = Issue.includes(:user).order(created_at: :desc)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)

    if @issue.save
      redirect_to issues_path, notice: "Tu incidencia ha sido reportada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:frequency, :address, :title, :description)
  end
end
