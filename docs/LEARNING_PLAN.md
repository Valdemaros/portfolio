# 🚀 План: Создание сайта-портфолио на Rails 8 + Tailwind + Hotwire

## 🎯 Твой бэкграунд

✅ Ruby базовый уровень  
✅ Парсер hh.ru API  
✅ Telegram бот  

## Что изучаешь по ходу:

| Технология | Зачем |
|------------|-------|
| **Rails 8** | MVC, REST, Active Record, Solid Queue |
| **Tailwind CSS** | Стили без CSS-файлов |
| **Hotwire** | Turbo (SPA) + Stimulus (JS) |
| **PostgreSQL** | Продакшн БД |
| **Kamal 2** | Деплой на VPS (~300₽/мес) |
| **Solid Queue** | Фоновые задачи (встроен) |

---

# 📅 4 НЕДЕЛИ / 29 ДНЕЙ

```
Неделя 1: Rails + Tailwind основы
Неделя 2: Hotwire (Turbo + Stimulus)  
Неделя 3: Frontend как на apavlyut.ru
Неделя 4: Деплой (Kamal 2) + SEO + Финал
```

---

# 📖 ДЕТАЛЬНЫЙ ПЛАН ПО ДНЯМ

---

## 🗓️ НЕДЕЛЯ 1: Rails + Tailwind Основы

---

### День 1: Создание проекта и первая страница

#### 🎯 Цель дня
Создать Rails проект, настроить Tailwind, сделать первую рабочую страницу.

#### 📚 Теория: Rails MVC

```
┌─────────────────────────────────────────────────────────────┐
│                    Rails MVC Architecture                    │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│   Browser                                                    │
│      │                                                       │
│      ▼                                                       │
│   ┌──────────┐    ┌──────────┐    ┌──────────┐             │
│   │  Routes  │───▶│Controller│───▶│   View   │───▶ HTML    │
│   └──────────┘    └────┬─────┘    └──────────┘             │
│                        │                                    │
│                        ▼                                    │
│                   ┌──────────┐    ┌──────────┐             │
│                   │  Model   │◀──▶│ Database │             │
│                   └──────────┘    └──────────┘             │
│                                                              │
│   Model      → Бизнес-логика, работа с БД                   │
│   View       → HTML шаблоны (ERB)                           │
│   Controller → Обработка запросов, связывает Model и View   │
│                                                              │
└─────────────────────────────────────────────────────────────┘

Поток запроса:
1. Browser → Routes (config/routes.rb)
2. Routes → Controller (app/controllers/)
3. Controller → Model (app/models/) — получение данных
4. Model → Database (PostgreSQL)
5. Controller → View (app/views/) — рендеринг
6. View → Browser — HTML ответ
```

#### 📋 Задачи

| #   | Задача                  | Время  | Команда/Действие                                           |
| --- | ----------------------- | ------ | ---------------------------------------------------------- |
| 1   | Создать Rails 8 проект  | 30 мин | `rails new portfolio --css tailwind --database postgresql` |
| 2   | Установить зависимости  | 15 мин | `cd portfolio && bundle install`                           |
| 3   | Создать БД              | 10 мин | `rails db:create`                                          |
| 4   | Запустить сервер        | 15 мин | `bin/dev`git  → открыть localhost:3000                     |
| 5   | Создать PagesController | 20 мин | `rails g controller Pages home about contact`              |
| 6   | Настроить маршруты      | 20 мин | Отредактировать `config/routes.rb`                         |
| 7   | Изучить структуру папок | 45 мин | Посмотреть app/, config/, db/                              |
| 8   | Понять MVC              | 45 мин | Нарисовать схему, понять поток                             |
| 9   | Изменить home.html.erb  | 30 мин | Добавить свой текст                                        |
| 10  | Закоммитить             | 15 мин | `git add . && git commit -m "Day 1: Initial setup"`        |

#### 💻 Код для написания

**config/routes.rb:**
```ruby
Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
```

**app/controllers/pages_controller.rb:**
```ruby
class PagesController < ApplicationController
  def home
    @title = "Веб-разработчик"
  end

  def about
    @title = "Обо мне"
  end

  def contact
    @title = "Контакты"
  end
end
```

**app/views/pages/home.html.erb:**
```erb
<div class="text-center py-20">
  <h1 class="text-4xl font-bold">Привет, я Владимир</h1>
  <p class="text-xl text-gray-600 mt-4">Веб-разработчик на Ruby on Rails</p>
</div>
```

#### ✅ Результат дня
- [x] Проект создан в папке `/home/vladimir/ruby/portfolio`
- [x] Сервер запускается командой `bin/dev`
- [x] localhost:3000 открывает страницу с твоим текстом
- [x] localhost:3000/about работает
- [x] localhost:3000/contact работает
- [x] Коммит в Git сделан

#### 🔍 Как проверить
```bash
cd /home/vladimir/ruby/portfolio
bin/dev
# Открыть браузер: localhost:3000
# Должен быть твой текст "Привет, я Владимир"
```

---

### День 2: PostgreSQL — Модели, индексы, JSONB

#### 🎯 Цель дня
Создать модели с PostgreSQL-типами, индексами и связями: Project, Technology, Service, Contact.

#### 📋 Задачи

| # | Задача | Время | Команда/Действие |
|---|--------|-------|------------------|
| 1 | Создать БД PostgreSQL | 30 мин | Нарисовать схему на бумаге |
| 2 | Спроектировать схему БД | 20 мин | `rails g model Project ...` |
| 3 | Создать Project + JSONB | 15 мин | `rails g model Technology ...` |
| 4 | Создать Technology | 15 мин | `rails g model ProjectTechnology ...` |
| 5 | Создать ProjectTechnology | 15 мин | `rails g model Service ...` |
| 6 | Создать Service + Contact | 15 мин | `rails g model Contact ...` |
| 7 | Добавить индексы | 10 мин | `rails db:migrate` |
| 8 | Применить миграции | 30 мин | has_many, belongs_to |
| 9 | Связи + валидации | 30 мин | validates :name, presence: true |
| 10 | Тест в rails console | 45 мин | `rails c` → создать записи |
| 11 | Закоммитить | 15 мин | git commit |

#### 💻 Команды для выполнения

```bash
# Модель Project
rails g model Project \
  name:string \
  description:text \
  url:string \
  github_url:string \
  featured:boolean \
  position:integer

# Модель Technology
rails g model Technology name:string icon:string

# Связующая таблица (many-to-many)
rails g model ProjectTechnology project:references technology:references

# Модель Service (услуги)
rails g model Service \
  title:string \
  description:text \
  icon:string \
  position:integer

# Модель Contact (заявки)
rails g model Contact \
  name:string \
  email:string \
  message:text \
  status:integer

# Применить миграции
rails db:migrate
```

#### 💻 Код моделей

**app/models/project.rb:**
```ruby
class Project < ApplicationRecord
  # Связи
  has_many :project_technologies, dependent: :destroy
  has_many :technologies, through: :project_technologies
  
  # Валидации
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  validates :github_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  
  # Scopes
  scope :featured, -> { where(featured: true).order(position: :asc) }
  scope :published, -> { order(position: :asc) }
end
```

**app/models/technology.rb:**
```ruby
class Technology < ApplicationRecord
  has_many :project_technologies, dependent: :destroy
  has_many :projects, through: :project_technologies
  
  validates :name, presence: true, uniqueness: true
end
```

**app/models/project_technology.rb:**
```ruby
class ProjectTechnology < ApplicationRecord
  belongs_to :project
  belongs_to :technology
  
  validates :project_id, uniqueness: { scope: :technology_id }
end
```

**app/models/service.rb:**
```ruby
class Service < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  
  scope :ordered, -> { order(position: :asc) }
end
```

**app/models/contact.rb:**
```ruby
class Contact < ApplicationRecord
  # Enum для статусов
  enum status: { new_message: 0, read: 1, replied: 2 }
  
  # Валидации
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10 }
end
```

#### 💻 Тест в консоли

```ruby
# Запустить консоль
rails console

# Создать технологию
ruby = Technology.create!(name: "Ruby", icon: "💎")
rails = Technology.create!(name: "Rails", icon: "🚂")

# Создать проект
project = Project.create!(
  name: "hh.ru Парсер",
  description: "Парсер вакансий с использованием API hh.ru",
  featured: true,
  position: 1
)

# Добавить технологии проекту
project.technologies << [ruby, rails]

# Проверить
project.technologies.pluck(:name)
# => ["Ruby", "Rails"]

Project.featured.count
# => 1
```

#### ✅ Результат дня
- [x] 5 таблиц в БД (проверь через `rails db:migrate:status`)
- [x] Модель Project с валидациями работает
- [x] Модель Technology создана
- [x] Связь many-to-many работает (проект имеет много технологий)
- [x] Модель Service создана
- [ ] Модель Contact с enum создана
- [ ] В консоли создал тестовый проект с технологиями
- [ ] Коммит сделан

#### 🔍 Как проверить
```bash
rails console

# Должно работать без ошибок:
Project.create!(name: "Test", description: "Test description")
Project.count  # => 1
Technology.create!(name: "Tailwind", icon: "🎨")
Technology.count  # => 1
```

---

### День 3: CRUD контроллер для проектов

#### 🎯 Цель дня
Создать полный CRUD для проектов: список, создание, редактирование, удаление.

#### 📋 Задачи

| # | Задача | Время | Команда/Действие |
|---|--------|-------|------------------|
| 1 | Создать контроллер | 15 мин | `rails g controller Projects` |
| 2 | Добавить маршруты | 10 мин | `resources :projects` в routes |
| 3 | Написать action index | 20 мин | Список проектов |
| 4 | Написать action show | 15 мин | Страница проекта |
| 5 | Написать action new | 15 мин | Форма создания |
| 6 | Написать action create | 30 мин | Сохранение + strong params |
| 7 | Написать action edit | 15 мин | Форма редактирования |
| 8 | Написать action update | 20 мин | Обновление |
| 9 | Написать action destroy | 15 мин | Удаление |
| 10 | Добавить before_action | 15 мин | DRY для set_project |
| 11 | Добавить flash messages | 15 мин | notice, alert |
| 12 | Протестировать CRUD | 30 мин | Создать/изменить/удалить |
| 13 | Закоммитить | 10 мин | git commit |

#### 💻 Код

**config/routes.rb** (добавить):
```ruby
Rails.application.routes.draw do
  root 'pages#home'
  
  # Добавить эту строку:
  resources :projects
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
```

**app/controllers/projects_controller.rb:**
```ruby
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.order(position: :asc)
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Проект успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Проект успешно обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Проект успешно удалён"
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name, 
      :description, 
      :url, 
      :github_url, 
      :featured, 
      :position,
      technology_ids: []
    )
  end
end
```

**app/views/projects/index.html.erb:**
```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold">Проекты</h1>
    <%= link_to "Новый проект", new_project_path, class: "bg-red-700 text-white px-4 py-2 rounded" %>
  </div>

  <div class="space-y-4">
    <% @projects.each do |project| %>
      <div class="border rounded-lg p-4 hover:shadow-md transition">
        <div class="flex justify-between items-start">
          <div>
            <h2 class="text-xl font-bold"><%= project.name %></h2>
            <p class="text-gray-600 mt-1"><%= truncate(project.description, length: 100) %></p>
            <% if project.featured? %>
              <span class="inline-block mt-2 px-2 py-1 bg-yellow-100 text-yellow-800 text-xs rounded">Избранный</span>
            <% end %>
          </div>
          <div class="flex gap-2">
            <%= link_to "Просмотр", project, class: "text-blue-600" %>
            <%= link_to "Редактировать", edit_project_path(project), class: "text-green-600" %>
            <%= button_to "Удалить", project, method: :delete, confirm: "Удалить?", class: "text-red-600" %>
          </div>
        </div>
      </div>
    <% end %>
  </div>
</div>
```

**app/views/projects/show.html.erb:**
```erb
<div class="container mx-auto px-4 py-8">
  <div class="mb-4">
    <%= link_to "← Назад к проектам", projects_path, class: "text-blue-600" %>
  </div>

  <div class="bg-white rounded-lg shadow-md p-6">
    <h1 class="text-3xl font-bold mb-4"><%= @project.name %></h1>
    
    <p class="text-gray-600 mb-6"><%= @project.description %></p>
    
    <% if @project.url.present? %>
      <p class="mb-2"><strong>URL:</strong> <%= link_to @project.url, @project.url, target: "_blank" %></p>
    <% end %>
    
    <% if @project.github_url.present? %>
      <p class="mb-2"><strong>GitHub:</strong> <%= link_to @project.github_url, @project.github_url, target: "_blank" %></p>
    <% end %>
    
    <p class="mb-4">
      <strong>Статус:</strong> 
      <%= @project.featured? ? "Избранный проект" : "Обычный проект" %>
    </p>
    
    <div class="flex gap-4 mt-6">
      <%= link_to "Редактировать", edit_project_path(@project), class: "bg-green-600 text-white px-4 py-2 rounded" %>
      <%= button_to "Удалить", @project, method: :delete, confirm: "Удалить проект?", class: "bg-red-600 text-white px-4 py-2 rounded" %>
    </div>
  </div>
</div>
```

**app/views/projects/new.html.erb:**
```erb
<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold mb-6">Новый проект</h1>
  
  <%= render "form", project: @project %>
</div>
```

**app/views/projects/edit.html.erb:**
```erb
<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold mb-6">Редактирование проекта</h1>
  
  <%= render "form", project: @project %>
</div>
```

**app/views/projects/_form.html.erb:**
```erb
<%= form_with model: project, class: "space-y-6" do |f| %>
  <% if project.errors.any? %>
    <div class="bg-red-50 border border-red-200 rounded-lg p-4">
      <h3 class="text-red-800 font-medium mb-2">Ошибки:</h3>
      <ul class="list-disc list-inside text-red-700">
        <% project.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div>
    <%= f.label :name, "Название *", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.text_field :name, class: "w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500" %>
  </div>

  <div>
    <%= f.label :description, "Описание *", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.text_area :description, rows: 5, class: "w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500" %>
  </div>

  <div>
    <%= f.label :url, "URL сайта", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.url_field :url, placeholder: "https://example.com", class: "w-full px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div>
    <%= f.label :github_url, "GitHub URL", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.url_field :github_url, placeholder: "https://github.com/user/repo", class: "w-full px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div class="flex items-center">
    <%= f.check_box :featured, class: "w-4 h-4 text-red-600 border-gray-300 rounded" %>
    <%= f.label :featured, "Избранный проект", class: "ml-2 text-sm text-gray-700" %>
  </div>

  <div>
    <%= f.label :position, "Позиция", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.number_field :position, class: "w-32 px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div class="flex gap-4">
    <%= f.submit class: "bg-red-700 text-white px-6 py-2 rounded-lg hover:bg-red-800 cursor-pointer" %>
    <%= link_to "Отмена", projects_path, class: "px-6 py-2 border border-gray-300 rounded-lg" %>
  </div>
<% end %>
```

#### ✅ Результат дня
- [ ] localhost:3000/projects показывает список
- [ ] Кнопка "Новый проект" ведёт на форму
- [ ] Форма создания работает с валидацией
- [ ] После создания редирект на страницу проекта
- [ ] Редактирование работает
- [ ] Удаление работает с подтверждением
- [ ] Flash сообщения показываются
- [ ] Коммит сделан

#### 🔍 Как проверить
```bash
bin/dev
# Открыть localhost:3000/projects
# Создать проект с пустым именем → должна быть ошибка
# Создать проект с данными → должен создаться
# Нажать "Удалить" → проект должен удалиться
```

---

### День 4: Tailwind CSS — Layout и Navbar

#### 🎯 Цель дня
Создать общий layout с навигацией и footer. Освоить основные классы Tailwind.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Изучить основные классы Tailwind | 45 мин |
| 2 | Создать shared/_navbar.html.erb | 45 мин |
| 3 | Создать shared/_footer.html.erb | 30 мин |
| 4 | Обновить application.html.erb | 30 мин |
| 5 | Добавить flash messages в layout | 30 мин |
| 6 | Стилизовать Projects index | 45 мин |
| 7 | Проверить адаптив | 30 мин |
| 8 | Закоммитить | 15 мин |

#### 💻 Код

**app/views/layouts/application.html.erb:**
```erb
<!DOCTYPE html>
<html>
<head>
  <title>Портфолио</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>
</head>
<body class="bg-stone-50 text-stone-800 min-h-screen flex flex-col">
  
  <%= render 'shared/navbar' %>
  
  <!-- Flash Messages -->
  <% if notice || alert %>
    <div class="container mx-auto px-4 mt-4">
      <% if notice %>
        <div class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded-r">
          <%= notice %>
        </div>
      <% end %>
      <% if alert %>
        <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-r">
          <%= alert %>
        </div>
      <% end %>
    </div>
  <% end %>
  
  <main class="flex-1">
    <%= yield %>
  </main>
  
  <%= render 'shared/footer' %>
</body>
</html>
```

**app/views/shared/_navbar.html.erb:**
```erb
<nav class="bg-white border-b border-stone-200 sticky top-0 z-50">
  <div class="container mx-auto px-4">
    <div class="flex justify-between items-center h-16">
      <!-- Logo -->
      <%= link_to root_path, class: "text-xl font-bold text-stone-800 hover:text-red-700 transition" do %>
        Vladimir
      <% end %>
      
      <!-- Desktop Navigation -->
      <div class="hidden md:flex items-center space-x-8">
        <%= link_to "Главная", root_path, 
            class: class_names("hover:text-red-700 transition", 
                              "text-red-700": current_page?(root_path)) %>
        <%= link_to "Проекты", projects_path, 
            class: class_names("hover:text-red-700 transition",
                              "text-red-700": current_page?(projects_path)) %>
        <%= link_to "Услуги", services_path, 
            class: "hover:text-red-700 transition" %>
        <%= link_to "Контакты", contact_path, 
            class: "hover:text-red-700 transition" %>
      </div>
      
      <!-- Mobile Menu Button -->
      <button class="md:hidden p-2 rounded-lg hover:bg-stone-100" id="mobile-menu-button">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
      </button>
    </div>
    
    <!-- Mobile Navigation (пока без JS) -->
    <div class="md:hidden hidden border-t border-stone-200 py-4" id="mobile-menu">
      <div class="flex flex-col space-y-3">
        <%= link_to "Главная", root_path, class: "hover:text-red-700" %>
        <%= link_to "Проекты", projects_path, class: "hover:text-red-700" %>
        <%= link_to "Услуги", services_path, class: "hover:text-red-700" %>
        <%= link_to "Контакты", contact_path, class: "hover:text-red-700" %>
      </div>
    </div>
  </div>
</nav>
```

**app/views/shared/_footer.html.erb:**
```erb
<footer class="bg-stone-900 text-white mt-auto">
  <div class="container mx-auto px-4 py-8">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      
      <!-- Контакты -->
      <div>
        <h3 class="text-lg font-bold mb-4">Контакты</h3>
        <div class="space-y-2 text-stone-400">
          <p>Email: your@email.com</p>
          <p>Telegram: @yourname</p>
        </div>
      </div>
      
      <!-- Навигация -->
      <div>
        <h3 class="text-lg font-bold mb-4">Навигация</h3>
        <div class="space-y-2">
          <%= link_to "Главная", root_path, class: "text-stone-400 hover:text-white transition block" %>
          <%= link_to "Проекты", projects_path, class: "text-stone-400 hover:text-white transition block" %>
          <%= link_to "Контакты", contact_path, class: "text-stone-400 hover:text-white transition block" %>
        </div>
      </div>
      
      <!-- Соцсети -->
      <div>
        <h3 class="text-lg font-bold mb-4">Соцсети</h3>
        <div class="space-y-2">
          <a href="https://github.com/yourname" class="text-stone-400 hover:text-white transition block">GitHub</a>
          <a href="https://t.me/yourname" class="text-stone-400 hover:text-white transition block">Telegram</a>
        </div>
      </div>
    </div>
    
    <div class="border-t border-stone-800 mt-8 pt-8 text-center text-stone-500">
      <p>© <%= Date.current.year %> Vladimir. Все права защищены.</p>
    </div>
  </div>
</footer>
```

#### ✅ Результат дня
- [ ] Navbar отображается на всех страницах
- [ ] Footer прижат к низу (flex-col + flex-1)
- [ ] Flash messages красивые (зелёный/красный)
- [ ] Текущая страница подсвечивается в меню
- [ ] На мобильном есть бургер-кнопка
- [ ] Коммит сделан

---

### День 5: Seed данные и CRUD для Services

#### 🎯 Цель дня
Заполнить БД тестовыми данными, создать CRUD для Services.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Написать db/seeds.rb | 45 мин |
| 2 | Запустить rails db:seed | 15 мин |
| 3 | Создать ServicesController | 45 мин |
| 4 | Создать views для services | 45 мин |
| 5 | Добавить ресурсы в routes | 10 мин |
| 6 | Протестировать | 30 мин |
| 7 | Закоммитить | 10 мин |

#### 💻 Код

**db/seeds.rb:**
```ruby
# Очистка БД (в development)
puts "Очистка БД..."
ProjectTechnology.destroy_all
Project.destroy_all
Technology.destroy_all
Service.destroy_all
Contact.destroy_all

puts "Создание технологий..."
technologies = {
  ruby: Technology.create!(name: "Ruby", icon: "💎"),
  rails: Technology.create!(name: "Rails", icon: "🚂"),
  tailwind: Technology.create!(name: "Tailwind CSS", icon: "🎨"),
  postgresql: Technology.create!(name: "PostgreSQL", icon: "🐘"),
  redis: Technology.create!(name: "Redis", icon: "🔴"),
  telegram: Technology.create!(name: "Telegram API", icon: "✈️"),
  api: Technology.create!(name: "REST API", icon: "🔌"),
  git: Technology.create!(name: "Git", icon: "📦"),
}

puts "Создание проектов..."
projects_data = [
  {
    name: "hh.ru Парсер",
    description: "Автоматизированный парсер вакансий с использованием API hh.ru. Позволяет собирать и анализировать вакансии по различным критериям.",
    featured: true,
    position: 1,
    technologies: [:ruby, :api]
  },
  {
    name: "Telegram Бот",
    description: "Бот для Telegram с уведомлениями и автоматизацией задач. Интеграция с внешними сервисами.",
    featured: true,
    position: 2,
    technologies: [:ruby, :telegram]
  },
  {
    name: "Сайт-портфолио",
    description: "Персональный сайт-портфолио на Ruby on Rails с Tailwind CSS и Hotwire.",
    featured: true,
    position: 3,
    url: "https://yourname.ru",
    github_url: "https://github.com/yourname/portfolio",
    technologies: [:ruby, :rails, :tailwind, :postgresql]
  },
]

projects_data.each do |data|
  techs = data.delete(:technologies)
  project = Project.create!(data)
  techs.each { |t| project.technologies << technologies[t] }
  puts "  Создан проект: #{project.name}"
end

puts "Создание услуг..."
services_data = [
  { title: "Веб-разработка", description: "Создание сайтов на Ruby on Rails", icon: "🌐", position: 1 },
  { title: "Telegram боты", description: "Разработка ботов для автоматизации", icon: "🤖", position: 2 },
  { title: "Парсеры данных", description: "Сбор и обработка данных из любых источников", icon: "📡", position: 3 },
  { title: "API интеграции", description: "Связь различных сервисов между собой", icon: "🔗", position: 4 },
]

services_data.each do |data|
  Service.create!(data)
  puts "  Создана услуга: #{data[:title]}"
end

puts "\n✅ Готово!"
puts "Проектов: #{Project.count}"
puts "Технологий: #{Technology.count}"
puts "Услуг: #{Service.count}"
```

**app/controllers/services_controller.rb:**
```ruby
class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.ordered
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service, notice: "Услуга создана"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to @service, notice: "Услуга обновлена"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_url, notice: "Услуга удалена"
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :icon, :position)
  end
end
```

**config/routes.rb** (добавить):
```ruby
resources :services, except: [:show]  # show не нужен для услуг
```

**app/views/services/index.html.erb:**
```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold">Услуги</h1>
    <%= link_to "Новая услуга", new_service_path, class: "bg-red-700 text-white px-4 py-2 rounded-lg" %>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
    <% @services.each do |service| %>
      <div class="bg-white rounded-xl shadow-sm border border-stone-200 p-6 hover:shadow-md transition">
        <div class="text-4xl mb-4"><%= service.icon %></div>
        <h3 class="text-lg font-bold text-stone-800 mb-2"><%= service.title %></h3>
        <p class="text-stone-600 text-sm mb-4"><%= service.description %></p>
        <div class="flex gap-2">
          <%= link_to "✏️", edit_service_path(service), class: "text-blue-600 hover:text-blue-800" %>
          <%= button_to "🗑️", service, method: :delete, class: "text-red-600 hover:text-red-800 bg-transparent border-0 cursor-pointer" %>
        </div>
      </div>
    <% end %>
  </div>
</div>
```

**app/views/services/_form.html.erb:**
```erb
<%= form_with model: service, class: "space-y-6" do |f| %>
  <% if service.errors.any? %>
    <div class="bg-red-50 border border-red-200 rounded-lg p-4">
      <ul class="list-disc list-inside text-red-700">
        <% service.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div>
    <%= f.label :title, class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.text_field :title, class: "w-full px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div>
    <%= f.label :description, class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.text_area :description, rows: 3, class: "w-full px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div>
    <%= f.label :icon, "Иконка (emoji)", class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.text_field :icon, placeholder: "🌐", class: "w-20 px-4 py-2 border border-gray-300 rounded-lg text-2xl text-center" %>
  </div>

  <div>
    <%= f.label :position, class: "block text-sm font-medium text-gray-700 mb-1" %>
    <%= f.number_field :position, class: "w-24 px-4 py-2 border border-gray-300 rounded-lg" %>
  </div>

  <div class="flex gap-4">
    <%= f.submit class: "bg-red-700 text-white px-6 py-2 rounded-lg cursor-pointer" %>
    <%= link_to "Отмена", services_path, class: "px-6 py-2 border border-gray-300 rounded-lg" %>
  </div>
<% end %>
```

**app/views/services/new.html.erb:**
```erb
<div class="container mx-auto px-4 py-8 max-w-xl">
  <h1 class="text-3xl font-bold mb-6">Новая услуга</h1>
  <%= render "form", service: @service %>
</div>
```

**app/views/services/edit.html.erb:**
```erb
<div class="container mx-auto px-4 py-8 max-w-xl">
  <h1 class="text-3xl font-bold mb-6">Редактирование услуги</h1>
  <%= render "form", service: @service %>
</div>
```

#### ✅ Результат дня
- [ ] `rails db:seed` создаёт 3 проекта + 6 технологий + 4 услуги
- [ ] localhost:3000/services показывает карточки услуг
- [ ] CRUD для услуг работает
- [ ] Услуги сортируются по position
- [ ] Коммит сделан

---

### День 6: PostgreSQL — Сложные запросы, индексы, EXPLAIN

#### 🎯 Цель дня
Освоить продвинутые возможности PostgreSQL: индексы, JSONB-запросы, EXPLAIN ANALYZE.

#### 📋 Задачи

|| # | Задача | Время |
||---|--------|-------|
|| 1 | Изучить EXPLAIN ANALYZE | 45 мин |
|| 2 | Добавить индексы в миграции | 30 мин |
|| 3 | Составные индексы | 30 мин |
|| 4 | JSONB запросы | 45 мин |
|| 5 | Counter cache | 30 мин |
|| 6 | N+1 и includes | 30 мин |
|| 7 | Закоммитить | 15 мин |

#### 💻 Индексы

**db/migrate/..._add_indexes.rb:**
```ruby
class AddIndexes < ActiveRecord::Migration[8.0]
  def change
    # Простые индексы
    add_index :projects, :featured
    add_index :projects, :position
    add_index :projects, :created_at
    
    # Составной индекс
    add_index :projects, [:featured, :position]
    
    # Уникальный индекс
    add_index :technologies, :name, unique: true
    
    # Частичный индекс (только featured=true)
    add_index :projects, :position, where: "featured = true"
    
    # GIN индекс для JSONB
    add_index :projects, :metadata, using: :gin
    
    # Полнотекстовый поиск
    add_index :projects, 
      "to_tsvector('russian', name || ' ' || description)", 
      using: :gin,
      name: "projects_search_index"
  end
end
```

#### 💻 JSONB запросы

```ruby
# В консоли rails c

# Создать проект с метаданными
project = Project.create!(
  name: "Telegram Bot",
  description: "Бот для уведомлений",
  metadata: {
    "stars" => 42,
    "language" => "Ruby",
    "tags" => ["bot", "telegram", "api"]
  }
)

# Запросы по JSONB
Project.where("metadata->>'language' = ?", "Ruby")
Project.where("metadata->'stars' > ?", 10)
Project.where("metadata ? :key", key: "tags")
Project.where("metadata @> ?", { "language" => "Ruby" }.to_json)

# Обновление JSONB
project.update!(
  metadata: project.metadata.merge("forks" => 5)
)
```

#### 💻 EXPLAIN ANALYZE

```ruby
# В консоли
Project.where(featured: true).explain

# С анализом времени
Project.joins(:technologies)
       .where(technologies: { name: "Ruby" })
       .explain

# Найти медленные запросы
Project.where("metadata->>'language' = 'Ruby'").explain
# => Добавить индекс если Seq Scan
```

#### 💻 Counter Cache (оптимизация)

```ruby
# Миграция
add_column :projects, :technologies_count, :integer, default: 0

# Модель
class ProjectTechnology < ApplicationRecord
  belongs_to :project, counter_cache: true
  belongs_to :technology
end

# Теперь project.technologies_count без лишнего запроса
```

#### 💻 Решение N+1

```ruby
# ПЛОХО — N+1 запросов
Project.all.each { |p| p.technologies.count }

# ХОРОШО — includes
Project.includes(:technologies).each { |p| p.technologies.count }

# Ещё лучше — counter_cache
Project.all.each { |p| p.technologies_count }
```

#### ✅ Результат дня
- [ ] Индексы добавлены
- [ ] EXPLAIN понят
- [ ] JSONB запросы работают
- [ ] N+1 решён через includes
- [ ] Counter cache настроен
- [ ] Коммит сделан

---

### День 7: Tailwind — Hover, Transitions, Карточки

#### 🎯 Цель дня
Сделать красивые карточки проектов с hover-эффектами.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Переделать Projects#index с grid | 30 мин |
| 2 | Добавить hover эффекты | 45 мин |
| 3 | Добавить технологи в карточки | 30 мин |
| 4 | Настроить tailwind.config.js | 30 мин |
| 5 | Добавить свой бренд-цвет | 20 мин |
| 6 | Протестировать на мобильном | 30 мин |
| 7 | Закоммитить | 15 мин |

#### 💻 Код

**tailwind.config.js:**
```javascript
module.exports = {
  content: [
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#ef4444',
          600: '#dc2626',
          700: '#b91c1c',
          800: '#991b1b',
          900: '#7f1d1d',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
    }
  },
  plugins: [],
}
```

**app/views/projects/index.html.erb** (переделать):
```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-stone-800">Проекты</h1>
    <%= link_to "Новый проект", new_project_path, 
        class: "inline-flex items-center gap-2 bg-red-700 hover:bg-red-800 text-white px-5 py-2.5 rounded-lg font-medium transition" %>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <% @projects.each do |project| %>
      <%= link_to project, class: "group block" do %>
        <article class="bg-white rounded-xl shadow-sm border border-stone-200 overflow-hidden 
                        hover:shadow-xl hover:-translate-y-1 hover:border-red-200 
                        transition-all duration-300">
          
          <!-- Изображение (заглушка) -->
          <div class="aspect-video bg-gradient-to-br from-stone-100 to-stone-200 
                      group-hover:from-red-50 group-hover:to-orange-50 
                      transition-colors duration-300 flex items-center justify-center">
            <span class="text-6xl opacity-30 group-hover:opacity-50 group-hover:scale-110 transition-all duration-300">
              💻
            </span>
          </div>
          
          <!-- Контент -->
          <div class="p-5">
            <div class="flex items-start justify-between mb-2">
              <h3 class="text-lg font-bold text-stone-800 group-hover:text-red-700 transition-colors">
                <%= project.name %>
              </h3>
              <% if project.featured? %>
                <span class="text-yellow-500">⭐</span>
              <% end %>
            </div>
            
            <p class="text-stone-600 text-sm line-clamp-2 mb-4">
              <%= project.description %>
            </p>
            
            <!-- Технологии -->
            <% if project.technologies.any? %>
              <div class="flex flex-wrap gap-1.5">
                <% project.technologies.limit(4).each do |tech| %>
                  <span class="px-2 py-0.5 bg-stone-100 group-hover:bg-red-50 
                               text-stone-600 group-hover:text-red-700 
                               text-xs rounded-full transition-colors">
                    <%= tech.name %>
                  </span>
                <% end %>
                <% if project.technologies.count > 4 %>
                  <span class="px-2 py-0.5 bg-stone-100 text-stone-500 text-xs rounded-full">
                    +<%= project.technologies.count - 4 %>
                  </span>
                <% end %>
              </div>
            <% end %>
          </div>
          
          <!-- Footer карточки -->
          <div class="px-5 pb-5 pt-0">
            <span class="inline-flex items-center text-red-700 text-sm font-medium 
                         group-hover:gap-2 gap-1 transition-all">
              Подробнее
              <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
              </svg>
            </span>
          </div>
        </article>
      <% end %>
    <% end %>
  </div>
</div>
```

#### ✅ Результат дня
- [ ] Карточки в grid (3 колонки на десктопе)
- [ ] Hover: карточка поднимается (-translate-y-1)
- [ ] Hover: тень увеличивается
- [ ] Hover: фон градиента меняется
- [ ] Hover: заголовок становится красным
- [ ] Технологии показываются
- [ ] На мобильном 1 колонка
- [ ] Коммит сделан

---

### День 8: Рефакторинг и Partials

#### 🎯 Цель дня
Вынести повторяющийся код в partials, добавить вспомогательные методы.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать _project_card.html.erb | 30 мин |
| 2 | Создать _service_card.html.erb | 20 мин |
| 3 | Создать ApplicationHelper методы | 30 мин |
| 4 | Создать ProjectsHelper методы | 20 мин |
| 5 | Обновить views с partials | 30 мин |
| 6 | Добавить страницу 404 | 30 мин |
| 7 | Документация README.md | 30 мин |
| 8 | Закоммитить | 10 мин |

#### 💻 Код

**app/views/projects/_project_card.html.erb:**
```erb
<%= link_to project, class: "group block" do %>
  <article class="bg-white rounded-xl shadow-sm border border-stone-200 overflow-hidden 
                  hover:shadow-xl hover:-translate-y-1 hover:border-red-200 
                  transition-all duration-300">
    
    <!-- Image -->
    <div class="aspect-video bg-gradient-to-br from-stone-100 to-stone-200 
                group-hover:from-red-50 group-hover:to-orange-50 
                transition-colors duration-300 flex items-center justify-center">
      <span class="text-6xl opacity-30 group-hover:opacity-50 group-hover:scale-110 transition-all duration-300">
        <%= project_icon(project) %>
      </span>
    </div>
    
    <!-- Content -->
    <div class="p-5">
      <div class="flex items-start justify-between mb-2">
        <h3 class="text-lg font-bold text-stone-800 group-hover:text-red-700 transition-colors">
          <%= project.name %>
        </h3>
        <% if project.featured? %>
          <span class="text-yellow-500">⭐</span>
        <% end %>
      </div>
      
      <p class="text-stone-600 text-sm line-clamp-2 mb-4">
        <%= project.description %>
      </p>
      
      <!-- Technologies -->
      <%= render "projects/technologies_badges", technologies: project.technologies %>
    </div>
    
    <!-- Footer -->
    <div class="px-5 pb-5">
      <span class="inline-flex items-center text-red-700 text-sm font-medium group-hover:gap-2 gap-1 transition-all">
        Подробнее
        <%= inline_svg_tag "arrow-right.svg", class: "w-4 h-4 group-hover:translate-x-1 transition-transform" %>
      </span>
    </div>
  </article>
<% end %>
```

**app/views/projects/_technologies_badges.html.erb:**
```erb
<% if technologies.any? %>
  <div class="flex flex-wrap gap-1.5">
    <% technologies.limit(4).each do |tech| %>
      <span class="px-2 py-0.5 bg-stone-100 group-hover:bg-red-50 
                   text-stone-600 group-hover:text-red-700 
                   text-xs rounded-full transition-colors">
        <%= tech.name %>
      </span>
    <% end %>
    <% if technologies.count > 4 %>
      <span class="px-2 py-0.5 bg-stone-100 text-stone-500 text-xs rounded-full">
        +<%= technologies.count - 4 %>
      </span>
    <% end %>
  </div>
<% end %>
```

**app/helpers/projects_helper.rb:**
```ruby
module ProjectsHelper
  def project_icon(project)
    # Выбор иконки по названию проекта
    case project.name.downcase
    when /парсер/
      "📡"
    when /бот/
      "🤖"
    when /портфолио|сайт/
      "🌐"
    else
      "💻"
    end
  end
  
  def project_card_classes(project)
    classes = "bg-white rounded-xl shadow-sm border border-stone-200 overflow-hidden"
    classes += " border-yellow-300" if project.featured?
    classes
  end
end
```

**app/helpers/application_helper.rb:**
```ruby
module ApplicationHelper
  def page_title(title = nil)
    title ? "#{title} | Портфолио" : "Портфолио"
  end
  
  def nav_link(text, path)
    classes = "hover:text-red-700 transition "
    classes += current_page?(path) ? "text-red-700 font-medium" : "text-stone-700"
    link_to text, path, class: classes
  end
  
  def humanize_boolean(boolean)
    boolean ? "Да" : "Нет"
  end
end
```

**Обновлённый index:**
```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-stone-800">Проекты</h1>
    <%= link_to "Новый проект", new_project_path, 
        class: "inline-flex items-center gap-2 bg-red-700 hover:bg-red-800 text-white px-5 py-2.5 rounded-lg font-medium transition" %>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <%= render partial: "projects/project_card", collection: @projects, as: :project %>
  </div>
</div>
```

#### ✅ Результат дня
- [ ] _project_card.html.erb создан
- [ ] _technologies_badges.html.erb создан
- [ ] ProjectsHelper с методами
- [ ] ApplicationHelper с page_title, nav_link
- [ ] Код стал чище и короче
- [ ] README.md написан
- [ ] Коммит сделан

---

## 📊 ИТОГИ НЕДЕЛИ 1: Rails + Tailwind + PostgreSQL

### ✅ Что сделано
- [x] Rails 8 проект с PostgreSQL
- [x] 5 моделей с валидациями и связями
- [x] CRUD для Projects и Services
- [x] Layout с Navbar и Footer
- [x] Tailwind стилизация
- [x] PostgreSQL индексы и JSONB

### 🎯 Ключевые навыки
| Навык | Уровень |
|-------|---------|
| MVC архитектура | ⭐⭐⭐ |
| Active Record | ⭐⭐⭐ |
| Миграции | ⭐⭐⭐ |
| Tailwind CSS | ⭐⭐ |
| PostgreSQL | ⭐⭐ |

### 🐛 Типовые проблемы и решения

#### 1. N+1 Query Problem
```ruby
# ❌ ПЛОХО — N+1 запросов (1 + N запросов к БД)
projects = Project.all
projects.each { |p| puts p.technologies.count }
# SQL: SELECT * FROM projects
# SQL: SELECT COUNT(*) FROM technologies WHERE project_id = 1
# SQL: SELECT COUNT(*) FROM technologies WHERE project_id = 2
# ... и так далее для каждого проекта

# ✅ ХОРОШО — includes (2 запроса)
projects = Project.includes(:technologies)
projects.each { |p| puts p.technologies.size }

# ✅ ЛУЧШЕ — counter_cache (1 запрос)
# Добавить колонку technologies_count в projects
# belongs_to :project, counter_cache: true
projects.each { |p| puts p.technologies_count }
```

#### 2. Missing Indexes
```ruby
# ❌ Медленный запрос без индекса
Project.where(featured: true).order(:position)
# EXPLAIN показывает "Seq Scan" — полный перебор

# ✅ Добавить индекс
add_index :projects, [:featured, :position]

# Теперь EXPLAIN показывает "Index Scan"
```

#### 3. Mass Assignment Vulnerability
```ruby
# ❌ ОПАСНО — пользователь может перезаписать admin
User.create(params[:user])

# ✅ Безопасно — strong parameters
User.create(user_params)

private

def user_params
  params.require(:user).permit(:name, :email)
end
```

---

## 🎤 Q&A: Собеседование по Неделе 1

### Rails

**Q: Что такое MVC?**  
A: Model-View-Controller — паттерн разделения данных (Model), отображения (View) и логики (Controller). В Rails: Model = Active Record, View = ERB templates, Controller = Ruby классы.

**Q: Чем `has_many :through` отличается от `has_and_belongs_to_many`?**  
A: `has_and_belongs_to_many` создаёт простую join-таблицу без модели. `has_many :through` использует промежуточную модель, что позволяет добавлять дополнительные поля в связь.

```ruby
# has_and_belongs_to_many — только связь
has_and_belongs_to_many :technologies

# has_many :through — связь + дополнительные данные
has_many :project_technologies
has_many :technologies, through: :project_technologies
# Можно добавить position, role и т.д. в project_technologies
```

**Q: Что такое Strong Parameters?**  
A: Механизм защиты от mass assignment. Явно указываем, какие параметры можно массово присваивать:
```ruby
params.require(:project).permit(:name, :description)
```

**Q: Чем `reload` отличается от `find`?**  
A: `reload` обновляет уже загруженный объект из БД. `find` загружает новый объект.

### PostgreSQL

**Q: Зачем нужны индексы?**  
A: Индексы ускоряют поиск. Без индекса — Seq Scan (перебор всех строк). С индексом — Index Scan (прямой доступ).

**Q: Когда индекс НЕ поможет?**  
A: 
- Мало данных (<1000 строк)
- Запрос возвращает большую часть таблицы (>10%)
- Функции в WHERE: `WHERE LOWER(name) = 'test'` (используйте функциональный индекс)

**Q: Что такое JSONB?**  
A: Бинарный JSON в PostgreSQL. Позволяет хранить структурированные данные без схемы и делать запросы по ним:
```sql
SELECT * FROM projects WHERE metadata->>'language' = 'Ruby'
```

### Tailwind CSS

**Q: Почему Tailwind, а не обычный CSS?**  
A: Utility-first подход — быстрое написание, нет переключения между HTML и CSS, консистентный дизайн, маленький бандл (tree-shaking).

**Q: Что делает `@apply`?**  
A: Позволяет создавать свои классы из utility-классов:
```css
.btn {
  @apply px-4 py-2 bg-red-700 text-white rounded-lg hover:bg-red-800;
}
```

---

## 🗓️ НЕДЕЛЯ 2: Hotwire (Turbo + Stimulus)

---

### День 9: Turbo Drive и Frames

#### 🎯 Цель дня
Понять и применить Turbo Drive и Turbo Frames для навигации без перезагрузки.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Изучить Turbo Drive | 45 мин |
| 2 | Понять turbo_frame_tag | 45 мин |
| 3 | Добавить frame к проектам | 45 мин |
| 4 | Inline редактирование | 60 мин |
| 5 | Lazy loading | 30 мин |
| 6 | Протестировать | 30 мин |
| 7 | Закоммитить | 15 мин |

#### 💻 Теория

```
Turbo Drive:
- Перехватывает клики по ссылкам
- Загружает страницы через AJAX
- Обновляет body без перезагрузки
- Сохраняет scroll позицию

Turbo Frames:
- Обновляет часть страницы
- Работает как iframe, но лучше
- Идеально для форм и списков
```

#### 💻 Код

**app/views/projects/index.html.erb** (добавить frame):
```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-stone-800">Проекты</h1>
    <%= link_to "Новый проект", new_project_path, 
        data: { turbo_frame: "new_project" },
        class: "inline-flex items-center gap-2 bg-red-700 hover:bg-red-800 text-white px-5 py-2.5 rounded-lg font-medium transition" %>
  </div>

  <!-- Modal для нового проекта -->
  <%= turbo_frame_tag "new_project" %>

  <!-- Список проектов во frame -->
  <%= turbo_frame_tag "projects" do %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <%= render partial: "projects/project_card", collection: @projects, as: :project %>
    </div>
  <% end %>
</div>
```

**app/views/projects/new.html.erb** (в модальном окне):
```erb
<%= turbo_frame_tag "new_project" do %>
  <div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50" 
       data-controller="modal"
       data-action="click->modal#closeBackground keyup@window->modal#closeEsc">
    
    <div class="bg-white rounded-xl shadow-2xl max-w-lg w-full mx-4 max-h-[90vh] overflow-y-auto">
      <div class="p-6">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold">Новый проект</h2>
          <%= link_to "✕", projects_path, class: "text-stone-400 hover:text-stone-600 text-2xl" %>
        </div>
        
        <%= render "form", project: @project %>
      </div>
    </div>
  </div>
<% end %>
```

**Inline редактирование названия проекта:**

**app/views/projects/_project_card.html.erb** (добавить frame):
```erb
<%= turbo_frame_tag dom_id(project) do %>
  <%= link_to project, class: "group block" do %>
    <!-- ... весь код карточки ... -->
  <% end %>
<% end %>
```

**app/views/projects/show.html.erb** (для inline edit):
```erb
<%= turbo_frame_tag dom_id(@project) do %>
  <div class="container mx-auto px-4 py-8">
    <!-- ... содержимое ... -->
  </div>
<% end %>
```

#### ✅ Результат дня
- [ ] Навигация между страницами без перезагрузки
- [ ] Форма создания открывается в модальном окне
- [ ] После создания проект появляется без reload
- [ ] Turbo Frames работают
- [ ] Коммит сделан

---

### День 10: Turbo Streams — CRUD без перезагрузки

#### 🎯 Цель дня
Реализовать создание и удаление проектов с Turbo Streams.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Изучить 7 действий streams | 45 мин |
| 2 | Создать create.turbo_stream.erb | 30 мин |
| 3 | Создать destroy.turbo_stream.erb | 20 мин |
| 4 | Обновить контроллер | 30 мин |
| 5 | Добавить обновление счётчика | 20 мин |
| 6 | Протестировать | 30 мин |
| 7 | Закоммитить | 15 min |

#### 💻 Теория

```
7 действий Turbo Streams:
1. append    - добавить в конец
2. prepend   - добавить в начало  
3. replace   - заменить элемент
4. update    - обновить содержимое
5. remove    - удалить элемент
6. before    - вставить перед
7. after     - вставить после
```

#### 💻 Код

**app/controllers/projects_controller.rb** (обновить):
```ruby
def create
  @project = Project.new(project_params)

  respond_to do |format|
    if @project.save
      format.turbo_stream  # create.turbo_stream.erb
      format.html { redirect_to @project, notice: "Проект создан" }
    else
      format.turbo_stream { render :new, status: :unprocessable_entity }
      format.html { render :new, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @project.update(project_params)
      format.turbo_stream
      format.html { redirect_to @project, notice: "Проект обновлён" }
    else
      format.turbo_stream { render :edit, status: :unprocessable_entity }
      format.html { render :edit, status: :unprocessable_entity }
    end
  end
end

def destroy
  @project.destroy
  respond_to do |format|
    format.turbo_stream  # destroy.turbo_stream.erb
    format.html { redirect_to projects_path, notice: "Проект удалён" }
  end
end
```

**app/views/projects/create.turbo_stream.erb:**
```erb
<!-- Добавить проект в список -->
<%= turbo_stream.append "projects" do %>
  <%= render "projects/project_card", project: @project %>
<% end %>

<!-- Обновить счётчик проектов -->
<%= turbo_stream.update "projects_count" do %>
  <%= pluralize(Project.count, "проект", "проекта", "проектов") %>
<% end %>

<!-- Показать уведомление -->
<%= turbo_stream.append "flash_messages" do %>
  <div class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded-r animate-pulse">
    Проект "<%= @project.name %>" успешно создан!
  </div>
<% end %>

<!-- Закрыть модальное окно -->
<%= turbo_stream.update "new_project" do %>
<% end %>
```

**app/views/projects/destroy.turbo_stream.erb:**
```erb
<!-- Удалить проект из списка -->
<%= turbo_stream.remove dom_id(@project) %>

<!-- Обновить счётчик -->
<%= turbo_stream.update "projects_count" do %>
  <%= pluralize(Project.count, "проект", "проекта", "проектов") %>
<% end %>

<!-- Показать уведомление -->
<%= turbo_stream.append "flash_messages" do %>
  <div class="bg-yellow-50 border-l-4 border-yellow-500 text-yellow-700 px-4 py-3 rounded-r">
    Проект удалён
  </div>
<% end %>
```

**app/views/projects/update.turbo_stream.erb:**
```erb
<!-- Заменить карточку проекта -->
<%= turbo_stream.replace dom_id(@project) do %>
  <%= render "projects/project_card", project: @project %>
<% end %>

<!-- Уведомление -->
<%= turbo_stream.append "flash_messages" do %>
  <div class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded-r">
    Проект обновлён
  </div>
<% end %>
```

**Добавить контейнер для flash в layout:**
```erb
<!-- В application.html.erb после navbar -->
<div id="flash_messages" class="container mx-auto px-4 mt-4 space-y-2">
</div>
```

**Добавить счётчик в index:**
```erb
<p class="text-stone-500 mb-4">
  Всего: <span id="projects_count"><%= pluralize(@projects.count, "проект", "проекта", "проектов") %></span>
</p>
```

#### ✅ Результат дня
- [ ] Создание проекта без перезагрузки страницы
- [ ] Проект появляется в списке мгновенно
- [ ] Удаление без перезагрузки
- [ ] Счётчик обновляется
- [ ] Flash-уведомления показываются
- [ ] Коммит сделан

---

### День 11: Stimulus JS — Основы

#### 🎯 Цель дня
Создать первые Stimulus контроллеры: toggle, clipboard.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Понять архитектуру Stimulus | 45 мин |
| 2 | Создать toggle_controller.js | 45 мин |
| 3 | Создать clipboard_controller.js | 45 мин |
| 4 | Применить на странице проекта | 30 мин |
| 5 | Добавить к проекту contact | 30 мин |
| 6 | Протестировать | 20 мин |
| 7 | Закоммитить | 10 мин |

#### 💻 Теория

```
Stimulus = HTML + минимальный JS

3 ключевых концепции:
1. Controllers   - data-controller="name"
2. Targets       - data-name-target="element"  
3. Actions       - data-action="click->name#method"

Values:
- data-name-value="data"

Classes:
- data-name-active-class="bg-red-500"
```

#### 💻 Код

**app/javascript/controllers/toggle_controller.js:**
```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "icon"]
  static classes = ["hidden"]
  
  toggle() {
    this.contentTarget.classList.toggle("hidden")
    this.updateIcon()
  }
  
  show() {
    this.contentTarget.classList.remove("hidden")
    this.updateIcon()
  }
  
  hide() {
    this.contentTarget.classList.add("hidden")
    this.updateIcon()
  }
  
  updateIcon() {
    if (this.hasIconTarget) {
      const isHidden = this.contentTarget.classList.contains("hidden")
      this.iconTarget.textContent = isHidden ? "▶" : "▼"
    }
  }
}
```

**app/javascript/controllers/clipboard_controller.js:**
```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button", "feedback"]
  static values = { 
    text: String,
    successMessage: { type: String, default: "Скопировано!" }
  }
  
  async copy(event) {
    event.preventDefault()
    
    // Получить текст для копирования
    const text = this.hasTextValue 
      ? this.textValue 
      : this.sourceTarget.textContent.trim()
    
    try {
      // Копировать в буфер
      await navigator.clipboard.writeText(text)
      
      // Показать обратную связь
      this.showFeedback()
    } catch (err) {
      console.error("Ошибка копирования:", err)
      this.showFeedback("Ошибка!")
    }
  }
  
  showFeedback(message) {
    if (this.hasFeedbackTarget) {
      const original = this.feedbackTarget.textContent
      this.feedbackTarget.textContent = message || this.successMessageValue
      this.feedbackTarget.classList.remove("hidden")
      
      setTimeout(() => {
        this.feedbackTarget.textContent = original
        this.feedbackTarget.classList.add("hidden")
      }, 2000)
    }
    
    if (this.hasButtonTarget) {
      const original = this.buttonTarget.textContent
      this.buttonTarget.textContent = "✓"
      
      setTimeout(() => {
        this.buttonTarget.textContent = original
      }, 2000)
    }
  }
}
```

**Применение toggle (на странице проекта):**
```erb
<!-- app/views/projects/show.html.erb -->
<div class="container mx-auto px-4 py-8">
  <!-- ... остальной код ... -->
  
  <!-- Раскрывающийся блок с деталями -->
  <div data-controller="toggle" class="mt-6">
    <button data-action="click->toggle#toggle" 
            class="flex items-center gap-2 text-stone-700 hover:text-red-700 font-medium">
      <span data-toggle-target="icon">▶</span>
      Технические детали
    </button>
    
    <div data-toggle-target="content" class="hidden mt-4 p-4 bg-stone-50 rounded-lg">
      <p><strong>Создан:</strong> <%= l(@project.created_at, format: :long) %></p>
      <p><strong>Обновлён:</strong> <%= l(@project.updated_at, format: :long) %></p>
      <p><strong>ID:</strong> <%= @project.id %></p>
    </div>
  </div>
</div>
```

**Применение clipboard (в footer):**
```erb
<!-- app/views/shared/_footer.html.erb -->
<div data-controller="clipboard" data-clipboard-text-value="your@email.com"
     class="flex items-center gap-2">
  <span class="text-stone-400">Email: your@email.com</span>
  <button data-action="click->clipboard#copy" 
          data-clipboard-target="button"
          class="text-stone-500 hover:text-red-700 transition" 
          title="Копировать email">
    📋
  </button>
  <span data-clipboard-target="feedback" class="text-green-500 text-sm hidden"></span>
</div>
```

#### ✅ Результат дня
- [ ] Toggle контроллер работает (показ/скрытие)
- [ ] Clipboard контроллер работает (копирование)
- [ ] На странице проекта есть раскрывающийся блок
- [ ] В footer можно скопировать email
- [ ] Понимаешь data-controller, data-target, data-action
- [ ] Коммит сделан

---

### День 12: Stimulus — Мобильное меню

#### 🎯 Цель дня
Создать полноценное мобильное меню с анимациями.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать mobile_menu_controller.js | 45 мин |
| 2 | Обновить navbar | 45 мин |
| 3 | Добавить overlay | 30 мин |
| 4 | Добавить закрытие по Escape | 20 мин |
| 5 | Добавить анимации | 30 мин |
| 6 | Протестировать на мобильном | 30 мин |
| 7 | Закоммитить | 10 мин |

#### 💻 Код

**app/javascript/controllers/mobile_menu_controller.js:**
```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "overlay", "button", "icon"]
  
  connect() {
    // Закрытие по Escape
    this.handleKeydown = this.handleKeydown.bind(this)
    document.addEventListener("keydown", this.handleKeydown)
  }
  
  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown)
  }
  
  toggle() {
    if (this.isMenuOpen()) {
      this.close()
    } else {
      this.open()
    }
  }
  
  open() {
    this.menuTarget.classList.remove("translate-x-full")
    this.overlayTarget.classList.remove("hidden")
    this.iconTarget.textContent = "✕"
    document.body.classList.add("overflow-hidden")
  }
  
  close() {
    this.menuTarget.classList.add("translate-x-full")
    this.overlayTarget.classList.add("hidden")
    this.iconTarget.textContent = "☰"
    document.body.classList.remove("overflow-hidden")
  }
  
  closeBackground(event) {
    if (event.target === this.overlayTarget) {
      this.close()
    }
  }
  
  handleKeydown(event) {
    if (event.key === "Escape" && this.isMenuOpen()) {
      this.close()
    }
  }
  
  isMenuOpen() {
    return !this.menuTarget.classList.contains("translate-x-full")
  }
}
```

**app/views/shared/_navbar.html.erb** (обновить):
```erb
<nav class="bg-white border-b border-stone-200 sticky top-0 z-50">
  <div class="container mx-auto px-4">
    <div class="flex justify-between items-center h-16">
      <!-- Logo -->
      <%= link_to root_path, class: "text-xl font-bold text-stone-800 hover:text-red-700 transition" do %>
        Vladimir
      <% end %>
      
      <!-- Desktop Navigation -->
      <div class="hidden md:flex items-center space-x-8">
        <%= nav_link "Главная", root_path %>
        <%= nav_link "Проекты", projects_path %>
        <%= nav_link "Услуги", services_path %>
        <%= nav_link "Контакты", contact_path %>
      </div>
      
      <!-- Mobile Menu Button -->
      <button data-controller="mobile-menu"
              data-action="click->mobile-menu#toggle"
              data-mobile-menu-target="button"
              class="md:hidden p-2 rounded-lg hover:bg-stone-100 transition"
              aria-label="Открыть меню">
        <span data-mobile-menu-target="icon" class="text-2xl">☰</span>
      </button>
    </div>
  </div>
</nav>

<!-- Mobile Menu Overlay -->
<div data-mobile-menu-target="overlay"
     data-action="click->mobile-menu#closeBackground"
     class="hidden fixed inset-0 bg-black/50 z-40 md:hidden">
</div>

<!-- Mobile Menu Panel -->
<div data-mobile-menu-target="menu"
     class="fixed top-0 right-0 h-full w-72 bg-white shadow-xl z-50 
            transform translate-x-full transition-transform duration-300 ease-in-out
            md:hidden">
  
  <div class="p-6">
    <div class="flex justify-between items-center mb-8">
      <span class="text-lg font-bold">Меню</span>
      <button data-action="click->mobile-menu#close" class="text-2xl text-stone-500 hover:text-stone-700">
        ✕
      </button>
    </div>
    
    <nav class="space-y-4">
      <%= link_to "Главная", root_path, 
          class: "block py-2 text-lg text-stone-700 hover:text-red-700 transition border-b border-stone-100",
          data: { action: "click->mobile-menu#close" } %>
      <%= link_to "Проекты", projects_path, 
          class: "block py-2 text-lg text-stone-700 hover:text-red-700 transition border-b border-stone-100",
          data: { action: "click->mobile-menu#close" } %>
      <%= link_to "Услуги", services_path, 
          class: "block py-2 text-lg text-stone-700 hover:text-red-700 transition border-b border-stone-100",
          data: { action: "click->mobile-menu#close" } %>
      <%= link_to "Контакты", contact_path, 
          class: "block py-2 text-lg text-stone-700 hover:text-red-700 transition",
          data: { action: "click->mobile-menu#close" } %>
    </nav>
    
    <div class="mt-8 pt-8 border-t border-stone-200">
      <p class="text-stone-500 text-sm">Контакты:</p>
      <p class="text-stone-700 mt-2">your@email.com</p>
    </div>
  </div>
</div>
```

#### ✅ Результат дня
- [ ] Мобильное меню открывается/закрывается
- [ ] Overlay затемняет фон
- [ ] Закрытие по клику вне меню
- [ ] Закрытие по Escape
- [ ] Плавная анимация slide-in
- [ ] Body scroll блокируется при открытом меню
- [ ] Иконка меняется (☰ → ✕)
- [ ] Коммит сделан

---

### День 13: Real-time с Turbo Broadcasts

#### 🎯 Цель дня
Настроить real-time обновления через ActionCable.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Понять ActionCable | 30 мин |
| 2 | Добавить broadcasts в модель | 30 мин |
| 3 | Создать админку для контактов | 60 мин |
| 4 | Добавить turbo_stream_from | 20 мин |
| 5 | Протестировать real-time | 30 мин |
| 6 | Закоммитить | 10 мин |

#### 💻 Код

**app/models/contact.rb:**
```ruby
class Contact < ApplicationRecord
  enum status: { new_message: 0, read: 1, replied: 2 }
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10 }
  
  # Автоматические broadcasts
  broadcasts_to ->(contact) { :contacts }, inserts_by: :prepend
end
```

**app/controllers/contacts_controller.rb:**
```ruby
class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    
    respond_to do |format|
      if @contact.save
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Сообщение отправлено!" }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html { render 'pages/contact', status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
```

**app/views/contacts/create.turbo_stream.erb:**
```erb
<!-- Очистить форму -->
<%= turbo_stream.update "contact_form" do %>
  <div class="bg-green-50 border border-green-200 rounded-lg p-6 text-center">
    <div class="text-4xl mb-4">✉️</div>
    <h3 class="text-lg font-bold text-green-800">Сообщение отправлено!</h3>
    <p class="text-green-700 mt-2">Я свяжусь с вами в ближайшее время.</p>
  </div>
<% end %>
```

**app/views/admin/contacts/index.html.erb:**
```erb
<!-- Подписка на обновления -->
<%= turbo_stream_from :contacts %>

<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold mb-8">Заявки (<span id="contacts_count"><%= @contacts.count %></span>)</h1>
  
  <div id="contacts" class="space-y-4">
    <%= render @contacts %>
  </div>
</div>
```

**app/views/contacts/_contact.html.erb:**
```erb
<div id="<%= dom_id(contact) %>" 
     class="bg-white rounded-lg shadow-sm border p-6 
            <%= 'border-l-4 border-l-yellow-500' if contact.new_message? %>
            <%= 'border-l-4 border-l-green-500' if contact.read? %>
            <%= 'border-l-4 border-l-blue-500' if contact.replied? %>">
  
  <div class="flex justify-between items-start">
    <div>
      <h3 class="font-bold text-lg"><%= contact.name %></h3>
      <p class="text-stone-500 text-sm"><%= contact.email %></p>
      <p class="mt-2 text-stone-700"><%= contact.message %></p>
      <p class="text-xs text-stone-400 mt-2"><%= l(contact.created_at, format: :short) %></p>
    </div>
    
    <div class="flex items-center gap-2">
      <span class="px-2 py-1 text-xs rounded-full
                   <%= 'bg-yellow-100 text-yellow-800' if contact.new_message? %>
                   <%= 'bg-green-100 text-green-800' if contact.read? %>
                   <%= 'bg-blue-100 text-blue-800' if contact.replied? %>">
        <%= contact.status.humanize %>
      </span>
    </div>
  </div>
</div>
```

#### ✅ Результат дня
- [ ] Контактная форма отправляет заявку
- [ ] Заявки появляются в админке в реальном времени
- [ ] Новые заявки помечаются жёлтым
- [ ] ActionCable работает
- [ ] Коммит сделан

---

### День 14: Контактная форма + Email

#### 🎯 Цель дня
Создать контактную форму с отправкой email.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать форму контактов | 45 мин |
| 2 | Настроить ActionMailer | 30 мин |
| 3 | Создать шаблон письма | 30 мин |
| 4 | Добавить валидацию | 30 мин |
| 5 | Протестировать отправку | 30 мин |
| 6 | Закоммитить | 15 мин |

#### 💻 Код

**app/views/pages/contact.html.erb:**
```erb
<div class="container mx-auto px-4 py-12">
  <div class="max-w-2xl mx-auto">
    <h1 class="text-4xl font-bold text-stone-800 mb-4">Связаться со мной</h1>
    <p class="text-stone-600 mb-8">
      Есть проект или вопрос? Напишите мне, и я отвечу в течение 24 часов.
    </p>
    
    <%= turbo_frame_tag "contact_form" do %>
      <%= form_with model: @contact || Contact.new, url: contacts_path, class: "space-y-6" do |f| %>
        
        <% if (f.object.errors.any?) %>
          <div class="bg-red-50 border border-red-200 rounded-lg p-4">
            <ul class="list-disc list-inside text-red-700">
              <% f.object.errors.full_messages.each do |msg| %>
                <li><%= msg %></li>
              <% end %>
            </ul>
          </div>
        <% end %>
        
        <div>
          <%= f.label :name, "Ваше имя *", class: "block text-sm font-medium text-stone-700 mb-1" %>
          <%= f.text_field :name, 
              class: "w-full px-4 py-3 border border-stone-300 rounded-lg 
                     focus:ring-2 focus:ring-red-500 focus:border-red-500 transition",
              placeholder: "Иван Иванов" %>
        </div>
        
        <div>
          <%= f.label :email, "Email *", class: "block text-sm font-medium text-stone-700 mb-1" %>
          <%= f.email_field :email, 
              class: "w-full px-4 py-3 border border-stone-300 rounded-lg 
                     focus:ring-2 focus:ring-red-500 focus:border-red-500 transition",
              placeholder: "ivan@example.com" %>
        </div>
        
        <div>
          <%= f.label :message, "Сообщение *", class: "block text-sm font-medium text-stone-700 mb-1" %>
          <%= f.text_area :message, rows: 5,
              class: "w-full px-4 py-3 border border-stone-300 rounded-lg 
                     focus:ring-2 focus:ring-red-500 focus:border-red-500 transition",
              placeholder: "Расскажите о вашем проекте..." %>
        </div>
        
        <%= f.submit "Отправить сообщение", 
            class: "w-full bg-red-700 hover:bg-red-800 text-white 
                   font-medium py-3 px-6 rounded-lg transition cursor-pointer" %>
      <% end %>
    <% end %>
    
    <!-- Альтернативные способы связи -->
    <div class="mt-12 pt-8 border-t border-stone-200">
      <h2 class="text-lg font-bold text-stone-800 mb-4">Другие способы связи</h2>
      <div class="space-y-3">
        <div class="flex items-center gap-3">
          <span class="text-2xl">📧</span>
          <div>
            <p class="text-stone-500 text-sm">Email</p>
            <a href="mailto:your@email.com" class="text-stone-800 hover:text-red-700">your@email.com</a>
          </div>
        </div>
        <div class="flex items-center gap-3">
          <span class="text-2xl">✈️</span>
          <div>
            <p class="text-stone-500 text-sm">Telegram</p>
            <a href="https://t.me/yourname" class="text-stone-800 hover:text-red-700">@yourname</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
```

**app/mailers/contact_mailer.rb:**
```ruby
class ContactMailer < ApplicationMailer
  default from: "noreply@yourdomain.ru"
  
  def new_message(contact)
    @contact = contact
    mail(
      to: "your@email.com",
      subject: "Новое сообщение от #{@contact.name}"
    )
  end
end
```

**app/views/contact_mailer/new_message.html.erb:**
```erb
<h1>Новое сообщение с сайта</h1>

<p><strong>От:</strong> <%= @contact.name %> (<%= @contact.email %>)</p>

<h2>Сообщение:</h2>
<p><%= simple_format(@contact.message) %></p>

<hr>

<p>
  <%= link_to "Посмотреть в админке", admin_contact_url(@contact) %>
</p>
```

**app/views/contact_mailer/new_message.text.erb:**
```erb
Новое сообщение с сайта

От: <%= @contact.name %> (<%= @contact.email %>)

Сообщение:
<%= @contact.message %>
```

**config/environments/development.rb** (для тестирования):
```ruby
# Для тестирования email в development
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

**Gemfile** (добавить):
```ruby
group :development do
  gem "letter_opener"  # Превью email в браузере
end
```

```bash
bundle install
```

#### ✅ Результат дня
- [ ] Страница /contact с формой
- [ ] Валидация работает (имя, email, сообщение)
- [ ] После отправки показывается сообщение об успехе
- [ ] Email отправляется (проверить через letter_opener)
- [ ] Заявка сохраняется в БД
- [ ] Коммит сделан

---

### День 15: Интеграция недели 2 + Рефакторинг

#### 🎯 Цель дня
Объединить всё, что изучил, отрефакторить код.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Проверить все CRUD | 45 мин |
| 2 | Проверить Turbo | 30 мин |
| 3 | Проверить Stimulus | 30 мин |
| 4 | Рефакторинг controllers | 45 мин |
| 5 | Рефакторинг views | 45 мин |
| 6 | Документация | 30 мин |
| 7 | Коммит | 15 мин |

#### ✅ Результат дня
- [ ] Все CRUD работают без ошибок
- [ ] Turbo Frames и Streams работают
- [ ] Мобильное меню работает
- [ ] Контактная форма работает
- [ ] Код чистый и организованный
- [ ] README обновлён
- [ ] Большой коммит "Week 2 complete"

---

## 📊 ИТОГИ НЕДЕЛИ 2: Hotwire (Turbo + Stimulus)

### ✅ Что сделано
- [x] Turbo Drive — навигация без перезагрузки
- [x] Turbo Frames — обновление частей страницы
- [x] Turbo Streams — CRUD без reload
- [x] Stimulus контроллеры (toggle, clipboard, mobile menu)
- [x] Real-time обновления через ActionCable
- [x] Контактная форма с email

### 🎯 Ключевые навыки
| Навык | Уровень |
|-------|---------|
| Turbo Drive | ⭐⭐⭐ |
| Turbo Frames | ⭐⭐⭐ |
| Turbo Streams | ⭐⭐⭐ |
| Stimulus JS | ⭐⭐ |
| ActionCable | ⭐⭐ |

### 🐛 Типовые проблемы и решения

#### 1. Turbo не работает — полная перезагрузка
```ruby
# ❌ Проблема: Turbo отключен или конфликтует

# ✅ Решение 1: Проверь наличие тега в layout
<%= javascript_importmap_tags %>

# ✅ Решение 2: Проверь data-turbo="false" на ссылках
# Убери его или используй data-turbo="true"

# ✅ Решение 3: Перезапуск Turbo после динамического контента
Turbo.session.drive = true
```

#### 2. Turbo Frame не обновляется
```erb
<!-- ❌ Проблема: frame без id или неправильный target -->
<%= turbo_frame_tag "projects" do %>
  <%= link_to "Edit", edit_project_path(@project) %>
<% end %>

<!-- ✅ Решение: укажи правильный target -->
<%= turbo_frame_tag "projects" do %>
  <%= link_to "Edit", edit_project_path(@project), data: { turbo_frame: "project_#{@project.id}" } %>
<% end %>

<!-- ✅ Или используй dom_id для уникальности -->
<%= turbo_frame_tag dom_id(@project) %>
```

#### 3. Flash messages не показываются после Turbo
```ruby
# ❌ Проблема: flash не отображается при Turbo запросах

# ✅ Решение: используй turbo_stream
# create.turbo_stream.erb
<%= turbo_stream.append "flash_messages" do %>
  <div class="alert alert-success">
    <%= notice %>
  </div>
<% end %>
```

#### 4. Stimulus controller не инициализируется
```javascript
// ❌ Проблема: контроллер не виден Stimulus

// ✅ Проверь naming convention:
// Файл: app/javascript/controllers/toggle_controller.js
// Имя контроллера: toggle (без _controller)

// ✅ Проверь data-controller в HTML:
// <div data-controller="toggle">

// ✅ Добавь console.log для отладки:
connect() {
  console.log("Toggle controller connected!")
}
```
```

#### 5. Memory leak в Stimulus
```javascript
// ❌ Плохо: event listener не удаляется
connect() {
  document.addEventListener("keydown", this.handleKey)
}

// ✅ Хорошо: удаляем в disconnect
connect() {
  this.handleKey = this.handleKey.bind(this)
  document.addEventListener("keydown", this.handleKey)
}

disconnect() {
  document.removeEventListener("keydown", this.handleKey)
}
```

---

## 🎤 Q&A: Собеседование по Неделе 2

### Hotwire / Turbo

**Q: Что такое Turbo Drive?**  
A: Автоматическое превращение ссылок и форм в AJAX-запросы. Страница обновляется без полной перезагрузки, сохраняется scroll позиция и загруженные JS-состояния.

**Q: В чём разница между Turbo Frame и Turbo Stream?**  
A:
- **Turbo Frame** — обновляет содержимое frame при навигации. Для isolated частей страницы (форма, карточка).
- **Turbo Stream** — сервер отправляет инструкции (append, replace, remove) для обновления DOM. Для real-time обновлений.

**Q: Как отключить Turbo для конкретной ссылки?**  
A:
```erb
<%= link_to "Logout", logout_path, data: { turbo: false } %>
<%= link_to "Download", file_path, data: { turbo_method: :get } %>
```

**Q: Как обработать успешное создание через Turbo Stream?**  
A:
```ruby
# controller
def create
  @project = Project.new(project_params)
  if @project.save
    respond_to do |format|
      format.turbo_stream  # render create.turbo_stream.erb
      format.html { redirect_to @project }
    end
  end
end

# create.turbo_stream.erb
<%= turbo_stream.append "projects" do %>
  <%= render "project_card", project: @project %>
<% end %>
```

### Stimulus

**Q: Зачем нужен Stimulus, если есть Turbo?**  
A: Turbo работает с HTML и навигацией. Stimulus добавляет JavaScript-логику: обработка событий, state, интеграция с внешними библиотеками.

**Q: Назови 3 ключевых концепции Stimulus**  
A:
1. **Controllers** — `data-controller="name"` — JS-класс
2. **Targets** — `data-name-target="element"` — ссылки на DOM элементы
3. **Actions** — `data-action="click->name#method"` — обработчики событий

**Q: Как передать данные в Stimulus controller?**  
A: Через Values:
```erb
<div data-controller="clipboard" 
     data-clipboard-text-value="<%= @project.url %>">
```
```javascript
static values = { text: String }
// Доступ: this.textValue
```

**Q: В чём разница между connect() и initialize()?**  
A:
- `initialize()` — вызывается один раз при создании контроллера
- `connect()` — вызывается каждый раз при появлении элемента в DOM (включая после Turbo навигации)

### ActionCable

**Q: Что такое ActionCable?**  
A: WebSocket-фреймворк Rails для real-time коммуникации. Позволяет серверу отправлять данные клиенту без запроса.

**Q: Как настроить broadcasts в модели?**  
A:
```ruby
class Message < ApplicationRecord
  belongs_to :chat
  broadcasts_to :chat  # Автоматически вещает при create/update/destroy
end
```
```erb
<%= turbo_stream_from @chat %>  <!-- Подписка на канале -->
```

---

## 🗓️ НЕДЕЛЯ 3: Frontend как на apavlyut.ru

---

### День 16: Hero секция

#### 🎯 Цель дня
Создать впечатляющий первый экран с градиентом и CTA.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать Hero секцию | 90 мин |
| 2 | Добавить градиент | 30 мин |
| 3 | Добавить CTA кнопки | 30 мин |
| 4 | Добавить декоративные элементы | 30 мин |
| 5 | Сделать адаптив | 30 мин |
| 6 | Закоммитить | 15 мин |

#### 💻 Код

**app/views/pages/home.html.erb:**
```erb
<!-- Hero Section -->
<section class="relative min-h-[90vh] flex items-center justify-center 
                bg-gradient-to-br from-stone-900 via-stone-800 to-red-900 
                text-white overflow-hidden">
  
  <!-- Animated Background -->
  <div class="absolute inset-0 overflow-hidden">
    <div class="absolute -top-40 -right-40 w-96 h-96 bg-red-500/10 rounded-full blur-3xl animate-pulse"></div>
    <div class="absolute -bottom-40 -left-40 w-96 h-96 bg-orange-500/10 rounded-full blur-3xl animate-pulse" style="animation-delay: 1s"></div>
    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-red-500/5 rounded-full blur-3xl"></div>
  </div>
  
  <!-- Grid Pattern -->
  <div class="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:50px_50px]"></div>
  
  <!-- Content -->
  <div class="container mx-auto px-4 text-center relative z-10">
    <p class="text-red-400 font-medium mb-4 tracking-wider uppercase text-sm">
      Ruby on Rails Developer
    </p>
    
    <h1 class="text-4xl md:text-6xl lg:text-7xl font-bold mb-6 leading-tight">
      Веб-разработка<br>
      <span class="text-transparent bg-clip-text bg-gradient-to-r from-red-400 to-orange-400">
        любой сложности
      </span>
    </h1>
    
    <p class="text-lg md:text-xl text-stone-300 mb-10 max-w-2xl mx-auto leading-relaxed">
      От идеи до запуска и развития. Создаю сайты, Telegram боты, парсеры и интеграции.
    </p>
    
    <!-- CTA Buttons -->
    <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
      <%= link_to "#projects", 
          class: "group inline-flex items-center justify-center px-8 py-4 
                  bg-red-700 hover:bg-red-600 text-white rounded-xl 
                  font-medium transition-all duration-300 
                  hover:shadow-lg hover:shadow-red-500/25 hover:-translate-y-0.5" do %>
        Смотреть проекты
        <svg class="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
        </svg>
      <% end %>
      
      <%= link_to contact_path, 
          class: "inline-flex items-center justify-center px-8 py-4 
                  border-2 border-stone-500 hover:border-white hover:bg-white/5
                  text-white rounded-xl font-medium transition-all duration-300" do %>
        Связаться
      <% end %>
    </div>
    
    <!-- Stats -->
    <div class="mt-16 grid grid-cols-3 gap-8 max-w-lg mx-auto">
      <div>
        <div class="text-3xl md:text-4xl font-bold text-white">3+</div>
        <div class="text-stone-400 text-sm mt-1">года опыта</div>
      </div>
      <div>
        <div class="text-3xl md:text-4xl font-bold text-white">10+</div>
        <div class="text-stone-400 text-sm mt-1">проектов</div>
      </div>
      <div>
        <div class="text-3xl md:text-4xl font-bold text-white">100%</div>
        <div class="text-stone-400 text-sm mt-1">отдача</div>
      </div>
    </div>
  </div>
  
  <!-- Scroll Indicator -->
  <div class="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
    <svg class="w-6 h-6 text-stone-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"/>
    </svg>
  </div>
</section>

<!-- Services Section -->
<section id="services" class="py-20 bg-white">
  <%= render 'pages/services' %>
</section>

<!-- Projects Section -->
<section id="projects" class="py-20 bg-stone-50">
  <%= render 'pages/projects' %>
</section>

<!-- Technologies Section -->
<section class="py-16 bg-white border-y border-stone-200">
  <%= render 'pages/technologies' %>
</section>
```

#### ✅ Результат дня
- [ ] Hero секция на всю высоту экрана
- [ ] Градиент от тёмного к красному
- [ ] Анимированные декоративные круги
- [ ] Две CTA кнопки
- [ ] Статистика (годы, проекты)
- [ ] Scroll indicator
- [ ] Адаптив для мобильных
- [ ] Коммит сделан

---

### День 17: Секция услуг

#### 🎯 Цель дня
Создать красивую секцию услуг с данными из БД.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать partial _services.html.erb | 60 мин |
| 2 | Добавить hover эффекты | 45 мин |
| 3 | Сделать grid адаптивным | 30 мин |
| 4 | Добавить иконки | 30 мин |
| 5 | Закоммитить | 15 мин |

#### 💻 Код

**app/views/pages/_services.html.erb:**
```erb
<div class="container mx-auto px-4">
  <div class="text-center mb-12">
    <h2 class="text-3xl md:text-4xl font-bold text-stone-800 mb-4">Услуги</h2>
    <p class="text-stone-600 max-w-2xl mx-auto">
      Помогаю бизнесу автоматизировать процессы и создавать качественные веб-решения
    </p>
  </div>
  
  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
    <% @services.each do |service| %>
      <div class="group relative bg-white rounded-2xl p-6 
                  border border-stone-200 hover:border-red-200
                  hover:shadow-xl hover:-translate-y-1 
                  transition-all duration-300 cursor-pointer">
        
        <!-- Icon -->
        <div class="w-14 h-14 bg-red-50 group-hover:bg-red-100 rounded-xl 
                    flex items-center justify-center text-3xl mb-4
                    group-hover:scale-110 transition-all duration-300">
          <%= service.icon %>
        </div>
        
        <!-- Title -->
        <h3 class="text-lg font-bold text-stone-800 group-hover:text-red-700 mb-2 transition-colors">
          <%= service.title %>
        </h3>
        
        <!-- Description -->
        <p class="text-stone-600 text-sm leading-relaxed">
          <%= service.description %>
        </p>
        
        <!-- Arrow -->
        <div class="absolute bottom-6 right-6 opacity-0 group-hover:opacity-100 transition-opacity">
          <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </div>
      </div>
    <% end %>
  </div>
</div>
```

**Обновить pages_controller.rb:**
```ruby
def home
  @services = Service.ordered
  @projects = Project.featured.limit(6)
  @technologies = Technology.all
end
```

#### ✅ Результат дня
- [ ] 4 карточки услуг в grid
- [ ] Hover: карточка поднимается
- [ ] Hover: иконка увеличивается
- [ ] Hover: заголовок красный
- [ ] Данные из БД
- [ ] Адаптив (1/2/4 колонки)
- [ ] Коммит сделан

---

### День 18-19: Галерея проектов

#### 🎯 Цель дня (2 дня)
Создать красивую галерею проектов с hover-эффектами.

#### 📋 Задачи

| # | Задача | Время | День |
|---|--------|-------|------|
| 1 | Создать partial _projects.html.erb | 60 мин | 17 |
| 2 | Переделать _project_card.html.erb | 60 мин | 17 |
| 3 | Добавить изображение-заглушку | 30 мин | 17 |
| 4 | Добавить технологии | 30 мин | 17 |
| 5 | Добавить hover эффекты | 60 мин | 18 |
| 6 | Добавить "Все проекты" ссылку | 20 мин | 18 |
| 7 | Сделать адаптив | 30 мин | 18 |
| 8 | Закоммитить | 15 мин | 18 |

#### 💻 Код

**app/views/pages/_projects.html.erb:**
```erb
<div class="container mx-auto px-4">
  <div class="text-center mb-12">
    <h2 class="text-3xl md:text-4xl font-bold text-stone-800 mb-4">Проекты</h2>
    <p class="text-stone-600 max-w-2xl mx-auto">
      Избранные работы, которые показывают мой опыт и навыки
    </p>
  </div>
  
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
    <% @projects.each do |project| %>
      <%= link_to project, class: "group block" do %>
        <article class="bg-white rounded-2xl shadow-sm border border-stone-200 overflow-hidden 
                        hover:shadow-2xl hover:-translate-y-2 hover:border-red-100 
                        transition-all duration-500">
          
          <!-- Image -->
          <div class="aspect-video bg-gradient-to-br from-stone-100 via-stone-50 to-stone-100 
                      relative overflow-hidden">
            
            <!-- Placeholder Pattern -->
            <div class="absolute inset-0 opacity-10">
              <div class="absolute inset-0 bg-[repeating-linear-gradient(45deg,transparent,transparent_10px,#000_10px,#000_11px)]"></div>
            </div>
            
            <!-- Project Icon -->
            <div class="absolute inset-0 flex items-center justify-center">
              <span class="text-7xl opacity-20 group-hover:opacity-40 group-hover:scale-125 
                           transition-all duration-500">
                <%= project_icon(project) %>
              </span>
            </div>
            
            <!-- Featured Badge -->
            <% if project.featured? %>
              <div class="absolute top-4 right-4 bg-yellow-500 text-white text-xs font-bold 
                          px-3 py-1 rounded-full shadow-lg">
                ⭐ Избранное
              </div>
            <% end %>
            
            <!-- Hover Overlay -->
            <div class="absolute inset-0 bg-gradient-to-t from-red-900/80 via-transparent to-transparent 
                        opacity-0 group-hover:opacity-100 transition-opacity duration-300
                        flex items-end p-6">
              <span class="text-white font-medium">Смотреть проект →</span>
            </div>
          </div>
          
          <!-- Content -->
          <div class="p-6">
            <h3 class="text-xl font-bold text-stone-800 group-hover:text-red-700 transition-colors mb-2">
              <%= project.name %>
            </h3>
            
            <p class="text-stone-600 text-sm leading-relaxed line-clamp-2 mb-4">
              <%= project.description %>
            </p>
            
            <!-- Technologies -->
            <% if project.technologies.any? %>
              <div class="flex flex-wrap gap-2">
                <% project.technologies.limit(3).each do |tech| %>
                  <span class="px-3 py-1 bg-stone-100 group-hover:bg-red-50 
                               text-stone-600 group-hover:text-red-700 
                               text-xs font-medium rounded-full transition-colors">
                    <%= tech.name %>
                  </span>
                <% end %>
                <% if project.technologies.count > 3 %>
                  <span class="px-3 py-1 bg-stone-100 text-stone-500 text-xs rounded-full">
                    +<%= project.technologies.count - 3 %>
                  </span>
                <% end %>
              </div>
            <% end %>
          </div>
        </article>
      <% end %>
    <% end %>
  </div>
  
  <!-- Link to all projects -->
  <div class="text-center mt-12">
    <%= link_to projects_path, 
        class: "inline-flex items-center gap-2 text-red-700 hover:text-red-800 
                font-medium transition group" do %>
      Все проекты
      <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
      </svg>
    <% end %>
  </div>
</div>
```

#### ✅ Результат
- [ ] Grid 1/2/3 колонки
- [ ] Карточки с изображением-заглушкой
- [ ] Hover: карточка поднимается + тень
- [ ] Hover: overlay с текстом
- [ ] Технологии как badges
- [ ] "Все проекты →" ссылка
- [ ] Адаптив работает
- [ ] Коммит сделан

---

### День 20: Секция технологий

#### 🎯 Цель дня
Создать секцию со списком технологий.

#### 💻 Код

**app/views/pages/_technologies.html.erb:**
```erb
<div class="container mx-auto px-4">
  <div class="text-center mb-10">
    <h2 class="text-2xl md:text-3xl font-bold text-stone-800 mb-2">Технологии</h2>
    <p class="text-stone-500">Инструменты, с которыми работаю</p>
  </div>
  
  <div class="flex flex-wrap justify-center gap-3">
    <% @technologies.each do |tech| %>
      <div class="group flex items-center gap-2 px-4 py-2 
                  bg-stone-50 hover:bg-red-50 rounded-full
                  border border-stone-200 hover:border-red-200
                  transition-all duration-300 cursor-default">
        <span class="text-xl group-hover:scale-125 transition-transform duration-300">
          <%= tech.icon %>
        </span>
        <span class="text-stone-700 group-hover:text-red-700 font-medium transition-colors">
          <%= tech.name %>
        </span>
      </div>
    <% end %>
  </div>
</div>
```

#### ✅ Результат дня
- [ ] Технологии в виде badges
- [ ] Hover эффекты
- [ ] Иконки + названия
- [ ] Адаптив
- [ ] Коммит

---

### День 21: Footer улучшения

#### 🎯 Цель дня
Улучшить footer, добавить все контакты.

#### 💻 Код

**app/views/shared/_footer.html.erb:**
```erb
<footer class="bg-stone-900 text-white">
  <div class="container mx-auto px-4 py-12">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
      
      <!-- About -->
      <div class="md:col-span-2">
        <h3 class="text-xl font-bold mb-4">Vladimir</h3>
        <p class="text-stone-400 mb-4 max-w-md">
          Веб-разработчик на Ruby on Rails. Создаю сайты, боты, парсеры и интеграции для бизнеса.
        </p>
        <div class="flex gap-4">
          <a href="https://github.com/yourname" target="_blank" 
             class="w-10 h-10 bg-stone-800 hover:bg-red-700 rounded-full 
                    flex items-center justify-center transition">
            <span>📦</span>
          </a>
          <a href="https://t.me/yourname" target="_blank"
             class="w-10 h-10 bg-stone-800 hover:bg-red-700 rounded-full 
                    flex items-center justify-center transition">
            <span>✈️</span>
          </a>
        </div>
      </div>
      
      <!-- Contacts -->
      <div>
        <h3 class="text-lg font-bold mb-4">Контакты</h3>
        <div class="space-y-3">
          <div data-controller="clipboard" data-clipboard-text-value="your@email.com"
               class="flex items-center gap-2 text-stone-400 hover:text-white transition cursor-pointer">
            <span>📧</span>
            <span>your@email.com</span>
            <button data-action="click->clipboard#copy" class="opacity-50 hover:opacity-100">📋</button>
          </div>
          <a href="https://t.me/yourname" class="flex items-center gap-2 text-stone-400 hover:text-white transition">
            <span>✈️</span>
            <span>@yourname</span>
          </a>
        </div>
      </div>
      
      <!-- Navigation -->
      <div>
        <h3 class="text-lg font-bold mb-4">Навигация</h3>
        <div class="space-y-2">
          <%= link_to "Главная", root_path, class: "block text-stone-400 hover:text-white transition" %>
          <%= link_to "Проекты", projects_path, class: "block text-stone-400 hover:text-white transition" %>
          <%= link_to "Контакты", contact_path, class: "block text-stone-400 hover:text-white transition" %>
        </div>
      </div>
    </div>
    
    <!-- Bottom -->
    <div class="border-t border-stone-800 mt-10 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
      <p class="text-stone-500 text-sm">
        © <%= Date.current.year %> Vladimir. Все права защищены.
      </p>
      <p class="text-stone-600 text-sm">
        Сделано с ❤️ на Ruby on Rails
      </p>
    </div>
  </div>
</footer>
```

#### ✅ Результат дня
- [ ] Footer с 4 колонками
- [ ] Копирование email
- [ ] Социальные ссылки
- [ ] Навигация
- [ ] "Сделано на Rails"
- [ ] Адаптив
- [ ] Коммит

---

### День 22: Финальная полировка главной

#### 🎯 Цель дня
Собрать всё вместе, добавить последние штрихи.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Проверить все секции | 60 мин |
| 2 | Добавить плавный scroll | 30 мин |
| 3 | Проверить все ссылки | 30 мин |
| 4 | Оптимизировать изображения | 30 мин |
| 5 | Проверить на мобильном | 45 мин |
| 6 | Закоммитить | 15 мин |

#### ✅ Результат дня
- [ ] Главная страница полностью готова
- [ ] Все секции работают
- [ ] Все ссылки рабочие
- [ ] Мобильная версия идеальна
- [ ] Коммит "Week 3 complete"

---

## 📊 ИТОГИ НЕДЕЛИ 3: Frontend и Tailwind CSS

### ✅ Чеклист навыков

| Навык | Уровень | Как проверить |
|-------|---------|---------------|
| Tailwind утилиты | □ □ □ □ □ | Создать карточку без документации |
| Адаптив (md:, lg:) | □ □ □ □ □ | Сайт выглядит хорошо на 3 устройствах |
| Hover/focus эффекты | □ □ □ □ □ | Кнопки реагируют на наведение |
| Градиенты | □ □ □ □ □ | Hero с красивым градиентом |
| CSS Grid/Flexbox | □ □ □ □ □ | Галерея проектов адаптивная |
| Dark mode | □ □ □ □ □ | Переключатель темы работает |

### 🐛 Типовые проблемы и решения

#### Проблема: Элемент не центрируется
```html
<!-- ❌ Неправильно -->
<div class="text-center">
  <div class="bg-red-500">Я не центрирован</div>
</div>

<!-- ✅ Правильно -->
<div class="flex justify-center items-center">
  <div class="bg-red-500">Я центрирован</div>
</div>
```

#### Проблема: Картинка вылезает за границы
```html
<!-- ❌ Картинка ломает layout -->
<img src="photo.jpg">

<!-- ✅ Ограничиваем размер -->
<img src="photo.jpg" class="max-w-full h-auto object-cover">
```

#### Проблема: Z-index не работает
```html
<!-- ❌ Element поверх модального окна -->
<div class="z-50">Модальное окно</div>
<div class="z-10">Выпадающее меню</div>

<!-- ✅ Проверить position -->
<div class="relative z-50">Модальное окно</div>  <!-- z-index работает только с position ≠ static -->
```

#### Проблема: Мобильное меню не работает на Turbo
```javascript
// ❌ Событие не вешается после Turbo navigation
document.querySelector('.menu-btn').addEventListener('click', ...)

// ✅ Использовать Stimulus
// app/javascript/controllers/menu_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  toggle() { this.element.classList.toggle('open') }
}
```

### ❓ Q&A для собеседований

**Q: Что такое mobile-first подход?**  
A: Сначала стилизуем для мобильных, потом добавляем `md:` и `lg:` для больших экранов. Tailwind работает именно так.

**Q: В чём разница `object-cover` и `object-contain`?**  
A: `object-cover` — обрезает картинку чтобы заполнить контейнер. `object-contain` — показывает всю картинку, добавляет пустое место.

**Q: Как работает `group` и `group-hover`?**  
A: Позволяет стилизовать дочерний элемент при наведении на родителя:
```html
<div class="group hover:bg-blue-500">
  <p class="group-hover:text-white">Текст станет белым при наведении на div</p>
</div>
```

**Q: Как сделать sticky header?**  
A: `fixed top-0 w-full z-50` — фиксирует элемент сверху страницы.

**Q: Зачем нужен `purge` (JIT) в Tailwind?**  
A: Удаляет неиспользуемые классы из CSS файла. В production бандл может быть всего 10KB вместо 3MB.

**Q: Как анимировать появление элемента?**  
A:
```html
<div class="transition-opacity duration-300 ease-in-out 
            opacity-0 hover:opacity-100">
  Появляется плавно
</div>
```

---

## 🗓️ НЕДЕЛЯ 4: Деплой (Kamal 2) и финал

---

### День 23-24: Подготовка к продакшену + Kamal 2

#### 🎯 Цель дня
Настроить Kamal 2 для деплоя Rails 8 на VPS.

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Арендовать VPS (Hetzner/Timeweb ~300₽/мес) | 30 мин |
| 2 | Установить Kamal: `gem install kamal` | 15 мин |
| 3 | Создать config/deploy.yml | 45 мин |
| 4 | Настроить Docker Registry | 30 мин |
| 5 | Первый деплой: `kamal setup` | 60 мин |
| 6 | Исправить ошибки | 60 мин |

#### 💻 Код

**config/environments/production.rb:**
```ruby
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in ENV["RAILS_MASTER_KEY"],
  # config/master.key, or an environment key such as config/credentials/production.key.
  # This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from `public/`, relying on NGINX/Apache to do so instead.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # Assume all access to the app is happening through a SSL-terminating reverse proxy.
  # Can be used together with config.force_ssl for Strict-Transport-Security and target TLS version.
  # config.assume_ssl = true

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Log to STDOUT by default
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Info include generic and useful information about system operation, but avoids logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII). If you
  # want to log everything, set the level to "debug".
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "portfolio_production"

  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable DNS rebinding protection and other `Host` header attacks.
  # config.hosts = [
  #   "example.com",     # Allow requests from example.com
  #   /.*\.example\.com/ # Allow requests from subdomains like `www.example.com`
  # ]
  # Skip DNS rebinding protection for the default health check endpoint.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
```

**render.yaml:**
```yaml
services:
  - type: web
    name: portfolio
    runtime: ruby
    buildCommand: "./bin/render-build.sh"
    startCommand: "bundle exec puma -C config/puma.rb"
    envVars:
      - key: DATABASE_URL
        fromDatabase:
          name: portfolio-db
          property: connectionString
      - key: RAILS_MASTER_KEY
        sync: false
      - key: RAILS_ENV
        value: production
      - key: WEB_CONCURRENCY
        value: 2

databases:
  - name: portfolio-db
    databaseName: portfolio_production
    user: portfolio
```

**bin/render-build.sh:**
```bash
#!/usr/bin/env bash
set -e

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Run migrations
bundle exec rails db:migrate

# Optionally seed the database
# bundle exec rails db:seed
```

```bash
chmod +x bin/render-build.sh
```

#### ✅ Результат
- [ ] VPS арендован
- [ ] deploy.yml создан
- [ ] Kamal установлен
- [ ] Первый деплой kamal setup успешен
- [ ] Сайт открывается

---

### День 25-26: Домен + SSL + Финальный деплой

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Купить домен (Reg.ru и т.д.) | 30 мин |
| 2 | Настроить DNS A-запись на IP VPS | 30 мин |
| 3 | Обновить deploy.yml с доменом | 15 мин |
| 4 | Деплой: kamal deploy | 30 мин |
| 5 | Проверить HTTPS (авто SSL) | 15 мин |
| 6 | Финальное тестирование | 60 мин |

#### ✅ Результат
- [ ] Сайт доступен по твоему домену
- [ ] Свои домен привязан (если есть)
- [ ] HTTPS работает
- [ ] Все страницы работают

---

### День 27: SEO

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Добавить meta теги | 45 мин |
| 2 | Добавить Open Graph | 30 мин |
| 3 | Создать robots.txt | 20 мин |
| 4 | Создать sitemap | 30 мин |
| 5 | Добавить favicon | 20 мин |

#### 💻 Код

**app/views/layouts/application.html.erb:**
```erb
<head>
  <title><%= page_title(yield(:title)) %></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- SEO -->
  <meta name="description" content="<%= yield(:description).presence || 'Веб-разработчик на Ruby on Rails. Создаю сайты, Telegram боты, парсеры.' %>">
  <meta name="keywords" content="Ruby, Rails, веб-разработка, программист">
  <meta name="author" content="Vladimir">
  
  <!-- Open Graph -->
  <meta property="og:title" content="<%= yield(:title).presence || 'Vladimir — Веб-разработчик' %>">
  <meta property="og:description" content="Веб-разработка на Ruby on Rails">
  <meta property="og:type" content="website">
  <meta property="og:url" content="<%= request.original_url %>">
  <meta property="og:image" content="<%= image_url('og-image.png') %>">
  <meta property="og:locale" content="ru_RU">
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>
  
  <!-- Favicon -->
  <%= favicon_link_tag 'favicon.ico' %>
</head>
```

**public/robots.txt:**
```
User-agent: *
Allow: /

Sitemap: https://yourdomain.com/sitemap.xml
```

#### ✅ Результат
- [ ] Meta description на всех страницах
- [ ] Open Graph для соцсетей
- [ ] robots.txt
- [ ] Favicon
- [ ] Коммит

---

### День 28: Аналитика

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Добавить Yandex Metrika | 30 мин |
| 2 | Добавить Google Analytics | 30 мин |
| 3 | Настроить цели | 30 мин |
| 4 | Проверить работу | 20 мин |

#### 💻 Код

**app/views/shared/_analytics.html.erb:**
```erb
<% if Rails.env.production? %>
  <!-- Yandex.Metrika -->
  <script type="text/javascript">
    (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
    m[i].l=1*new Date();
    for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
    k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
    (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

    ym(YOUR_ID, "init", {
          clickmap:true,
          trackLinks:true,
          accurateTrackBounce:true
    });
  </script>
  <noscript><div><img src="https://mc.yandex.ru/watch/YOUR_ID" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<% end %>
```

#### ✅ Результат
- [ ] Yandex Metrika установлена
- [ ] Google Analytics установлен
- [ ] Данные поступают
- [ ] Коммит

---

### День 29: Финал

#### 📋 Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Финальное тестирование | 60 мин |
| 2 | Написать README | 45 мин |
| 3 | Создать тег v1.0.0 | 15 мин |
| 4 | Отметить завершение | 30 мин |

#### ✅ Результат
- [ ] Всё работает идеально
- [ ] README написан
- [ ] Тег v1.0.0 создан
- [ ] Проект завершён!

---

## 📊 ИТОГИ НЕДЕЛИ 4: Деплой и DevOps

### ✅ Чеклист навыков

| Навык | Уровень | Как проверить |
|-------|---------|---------------|
| Kamal setup | □ □ □ □ □ | Развернуть приложение с первой попытки |
| Docker basics | □ □ □ □ □ | Понимать Dockerfile и docker-compose |
| VPS управление | □ □ □ □ □ | SSH, настройка сервера |
| SSL/HTTPS | □ □ □ □ □ | Сайт работает с замочком |
| Environment variables | □ □ □ □ □ | Secrets не в коде |
| SEO basics | □ □ □ □ □ | Meta tags, sitemap, robots.txt |

### 🐛 Типовые проблемы Kamal 2 и решения

#### Проблема: `kamal setup` падает с ошибкой SSH
```bash
# ❌ Ошибка
Permission denied (publickey)

# ✅ Решение
ssh-copy-id root@your-server-ip
# или используйте ключ
ssh-add ~/.ssh/id_rsa
```

#### Проблема: Контейнер не стартует
```bash
# Диагностика
kamal app logs
kamal app exec --interactive bash

# Частые причины:
# 1. Отсутствует master.key
# 2. Не создана БД
# 3. Порт занят

# Создать БД
kamal runner "rails db:prepare"
```

#### Проблема: Assets не грузятся (404)
```bash
# Проверить precompilation
kamal runner "Rails.application.assets_manifest"

# В config/environments/production.rb
config.assets.compile = false  # Должно быть false
```

#### Проблема: ActionCable не работает через Kamal
```yaml
# config/deploy.yml - нужен sticky sessions
proxy:
  host: your-domain.ru
  app_port: 3000
  ssl: true
```

### ❓ Q&A для собеседований (DevOps)

**Q: Что делает Kamal под капотом?**  
A: 1) Собирает Docker образ, 2) Пушит в registry, 3) SSH на сервер, 4) Пуллит образ, 5) Запускает контейнер с traefik как reverse proxy.

**Q: В чём разница между Docker image и container?**  
A: Image — это шаблон (как класс), container — запущенный экземпляр (как объект).

**Q: Зачем нужен reverse proxy (Traefik/Nginx)?**  
A: SSL termination, load balancing, routing по доменам, сжатие, кэширование статики.

**Q: Как хранить секреты в production?**  
A: Rails credentials (encrypted), ENV переменные, vault решения. Никогда не коммитить `.env` или `master.key`.

**Q: Что такое zero-downtime deployment?**  
A: Обновление без остановки сервиса. Новый контейнер стартует, потом старый останавливается. Kamal делает это автоматически.

**Q: Как откатить деплой?**  
A: `kamal rollback [version]` — вернётся к предыдущей версии образа.

---

# 📊 ИТОГОВАЯ ТАБЛИЦА

| Неделя | Фокус | Результат |
|--------|-------|-----------|
| 1 | Rails + Tailwind | CRUD, Layout, модели |
| 2 | Hotwire | SPA-ощущение, real-time |
| 3 | Frontend | Дизайн как apavlyut.ru |
| 4 | Деплой | Сайт онлайн |

---

*4 недели × 8 часов = 232 часа практики*
