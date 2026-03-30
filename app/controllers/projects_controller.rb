class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @projects = @projects.where(category_id: params[:category_id]) if params[:category_id].present?
    @projects = @projects.where(theme_id: params[:theme_id]) if params[:theme_id].present?
    @projects = @projects.joins(:technologies).where(technologies: { id: params[:technology_id]}) if params[:technology_id].present?
    @projects = @projects.joins(:features).where(features: {id: params[:feature_id] }) if params[:feature_id].present?

    @categories = Category.order(:position)
    @themes = Theme.order(:position)
    @technologies = Technology.all
    @features = Feature.order(:position)

  end

  def show
    @project = Project.find(params[:id])
  end

  private

  # PROJECT_PARAMS — фильтр разрешённых полей из формы
  # Защита от изменения запрещённых полей
  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :image_url,
      :project_url,
      :github_url,
      :featured,
      :position
    )
  end
end
