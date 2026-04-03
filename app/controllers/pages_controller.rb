class PagesController < ApplicationController
  def home
    @technologies = Technology.all
    @projects = Project.all
    @categories = Category.all
  end

  def services
  end

  def tz
  end
end
