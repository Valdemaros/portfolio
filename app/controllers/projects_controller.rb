class ProjectsController < ApplicationController

  # before_action :set_project, only: [:show, :edit, :update, :destroy]

  # INDEX — список всех проектов
  # GET /projects
  def index
    @projects = Project.all.order(:position)  # Достать все проекты, отсортировать по position
  end

  # SHOW — страница одного проекта
  # GET /projects/1
  def show
    @project = Project.find(params[:id])
  end

  # # NEW — форма создания проекта
  # # GET /projects/new
  # def new
  #   @project = Project.new  # Пустой объект для формы
  # end
  #
  # # CREATE — сохранить новый проект
  # # POST /projects
  # def create
  #   @project = Project.new(project_params) 
  #   if @project.save                        # Если сохранился в БД
  #     redirect_to @project, notice: "Проект создан"  # Перенаправить на страницу проекта
  #   else                                    # Если ошибка валидации
  #     render :new, status: :unprocessable_entity  # Показать форму снова с ошибками
  #   end
  # end
  #
  # # EDIT — форма редактирования
  # # GET /projects/1/edit
  # def edit
  # end
  #
  # # UPDATE — обновить проект
  # # PATCH /projects/1
  # def update
  #   if @project.update(project_params)    # Если обновился
  #     redirect_to @project, notice: "Проект обновлен"  # Перенаправить
  #   else                                  # Если ошибка
  #     render :edit, status: :unprocessable_entity  # Показать форму снова
  #   end
  # end
  #
  # # DESTROY — удалить проект
  # # DELETE /projects/1
  # def destroy
  #   @project.destroy                      # Удалить из БД
  #   redirect_to projects_path, notice: "Проект удален"  # Перенаправить на список
  # end

  # Приватные методы — не доступны как actions
  private

  # def set_project
  #   @project = Project.find(params[:id])
  # end


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
