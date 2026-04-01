class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    if params[:technology_id].present?
      @projects = @projects.joins(:technologies)
                            .where(technologies: { id: params[:technology_id] })
    end
    if params[:feature_id].present?
      @projects = @projects.joins(:features)
                            .where(features: { id: params[:feature_id] })
    end
    if params[:theme_id].present?
      @projects = @projects.joins(:themes)
                            .where(themes: { id: params[:theme_id] })
    end
    if params[:category_id].present?
      @projects = @projects.joins(:categories)
                            .where(categories: { id: params[:category_id] })
    end
    @projects = @projects.distinct

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
