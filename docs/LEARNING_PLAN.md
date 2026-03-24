# План: Сайт-портфолио на Rails 8

## Цель

Сделать простой сайт-портфолио как у [apavlyut.ru](https://www.apavlyut.ru/):
- Главная с проектами
- Страница проекта
- Контакты

## Технологии

| Технология | Зачем |
|------------|-------|
| Rails 8 | MVC, REST, Active Record |
| Tailwind CSS | Стили |
| Hotwire | Turbo (SPA без JS) + Stimulus (немного JS) |
| PostgreSQL | База данных |
| Kamal 2 | Деплой на VPS |
| Solid Queue | Фоновые задачи (встроен в Rails 8) |

---

# 2 НЕДЕЛИ / 14 ДНЕЙ

```
Неделя 1: Rails + БД + Tailwind
Неделя 2: Hotwire + Деплой
```

---

# НЕДЕЛЯ 1: Rails + БД + Tailwind

---

## День 1: Проект и первая страница

### Цель
Создать Rails проект, настроить Tailwind, сделать главную страницу.

### Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать Rails 8 проект | 30 мин |
| 2 | Создать БД | 10 мин |
| 3 | Запустить сервер | 10 мин |
| 4 | Создать PagesController | 30 мин |
| 5 | Настроить routes | 20 мин |
| 6 | Изучить структуру | 30 мин |

### Команды

```bash
# Проект уже создан в /home/vladimir/ruby/portfolio/web
cd /home/vladimir/ruby/portfolio/web

# Создать БД
rails db:create

# Запустить сервер
bin/dev
```

### config/routes.rb

```ruby
Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
end
```

### app/controllers/pages_controller.rb

```ruby
class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
end
```

### app/views/pages/home.html.erb

```erb
<div class="min-h-screen flex items-center justify-center">
  <div class="text-center">
    <h1 class="text-4xl font-bold">Привет, я Владимир</h1>
    <p class="text-xl text-gray-600 mt-4">Веб-разработчик на Ruby on Rails</p>
  </div>
</div>
```

### Результат дня
- [x] Проект создан
- [x] localhost:3000 открывает страницу
- [x] /about работает
- [x] /contact работает
- [x] Коммит сделан

---

## День 2: Модели и БД

### Цель
Создать модели: Project, Technology.

### Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Спроектировать схему БД | 30 мин |
| 2 | Создать модели | 30 мин |
| 3 | Добавить связи | 30 мин |
| 4 | Добавить валидации | 30 мин |
| 5 | Тест в rails console | 30 мин |

### Команды

```bash
# Модель Project
rails g model Project name:string description:text url:string featured:boolean position:integer

# Модель Technology
rails g model Technology name:string icon:string

# Связующая таблица
rails g model ProjectTechnology project:references technology:references

# Применить миграции
rails db:migrate
```

### app/models/project.rb

```ruby
class Project < ApplicationRecord
  has_many :project_technologies, dependent: :destroy
  has_many :technologies, through: :project_technologies

  validates :name, presence: true
  validates :description, presence: true

  scope :featured, -> { where(featured: true).order(position: :asc) }
  scope :published, -> { order(position: :asc) }
end
```

### app/models/technology.rb

```ruby
class Technology < ApplicationRecord
  has_many :project_technologies, dependent: :destroy
  has_many :projects, through: :project_technologies

  validates :name, presence: true, uniqueness: true
end
```

### app/models/project_technology.rb

```ruby
class ProjectTechnology < ApplicationRecord
  belongs_to :project
  belongs_to :technology

  validates :project_id, uniqueness: { scope: :technology_id }
end
```

### Тест в консоли

```bash
rails console
```

```ruby
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

# Добавить технологии
project.technologies << [ruby, rails]

# Проверить
project.technologies.pluck(:name)
# => ["Ruby", "Rails"]
```

### Результат дня
- [x] 3 таблицы в БД
- [x] Модели с валидациями
- [x] Связь many-to-many работает
- [x] Коммит сделан

---

## День 3: CRUD для проектов

### Цель
Создать CRUD: список, создание, редактирование, удаление проектов.

### Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать ProjectsController | 30 мин |
| 2 | Добавить маршруты | 10 мин |
| 3 | Написать actions | 60 мин |
| 4 | Создать views | 60 мин |
| 5 | Протестировать | 30 мин |

### config/routes.rb

```ruby
Rails.application.routes.draw do
  root "pages#home"
  resources :projects
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
end
```

### app/controllers/projects_controller.rb

```ruby
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.published
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Проект создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Проект обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Проект удалён"
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :url, :featured, :position, technology_ids: [])
  end
end
```

### app/views/projects/index.html.erb

```erb
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold">Проекты</h1>
    <%= link_to "Новый проект", new_project_path, class: "bg-red-700 text-white px-4 py-2 rounded" %>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <% @projects.each do |project| %>
      <div class="border rounded-lg p-4 hover:shadow-md transition">
        <h2 class="text-xl font-bold"><%= project.name %></h2>
        <p class="text-gray-600 mt-1"><%= truncate(project.description, length: 100) %></p>
        <div class="mt-4 flex gap-2">
          <%= link_to "Открыть", project, class: "text-blue-600" %>
          <%= link_to "Редактировать", edit_project_path(project), class: "text-green-600" %>
        </div>
      </div>
    <% end %>
  </div>
</div>
```

### Результат дня
- [ ] /projects показывает список
- [ ] Создание проекта работает
- [ ] Редактирование работает
- [ ] Удаление работает
- [ ] Коммит сделан

---

## День 4: Layout, Navbar, Footer

### Цель
Создать общий layout с навигацией.

### Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать _navbar.html.erb | 45 мин |
| 2 | Создать _footer.html.erb | 30 мин |
| 3 | Обновить application.html.erb | 30 мин |
| 4 | Добавить flash messages | 20 мин |

### app/views/layouts/application.html.erb

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

  <%= render "shared/navbar" %>

  <% if notice || alert %>
    <div class="container mx-auto px-4 mt-4">
      <% if notice %>
        <div class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3">
          <%= notice %>
        </div>
      <% end %>
      <% if alert %>
        <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3">
          <%= alert %>
        </div>
      <% end %>
    </div>
  <% end %>

  <main class="flex-1">
    <%= yield %>
  </main>

  <%= render "shared/footer" %>
</body>
</html>
```

### app/views/shared/_navbar.html.erb

```erb
<nav class="bg-stone-900 text-white">
  <div class="container mx-auto px-4 py-4 flex justify-between items-center">
    <%= link_to root_path, class: "text-xl font-bold" do %>
      Vladimir
    <% end %>

    <div class="flex gap-6">
      <%= link_to "Главная", root_path, class: hover:text-red-400 transition" %>
      <%= link_to "Проекты", projects_path, class: "hover:text-red-400 transition" %>
      <%= link_to "Контакты", contact_path, class: "hover:text-red-400 transition" %>
    </div>
  </div>
</nav>
```

### app/views/shared/_footer.html.erb

```erb
<footer class="bg-stone-900 text-white mt-auto">
  <div class="container mx-auto px-4 py-8">
    <div class="flex justify-between">
      <div>
        <h3 class="font-bold mb-2">Контакты</h3>
        <p class="text-stone-400">Email: your@email.com</p>
        <p class="text-stone-400">Telegram: @yourname</p>
      </div>
      <div class="text-stone-500">
        © <%= Date.current.year %> Vladimir
      </div>
    </div>
  </div>
</footer>
```

### Результат дня
- [ ] Navbar на всех страницах
- [ ] Footer прижат к низу
- [ ] Flash messages работают
- [ ] Коммит сделан

---

## День 5: Seed данные

### Цель
Заполнить БД тестовыми данными.

### db/seeds.rb

```ruby
puts "Очистка БД..."
ProjectTechnology.destroy_all
Project.destroy_all
Technology.destroy_all

puts "Создание технологий..."
technologies = {
  ruby: Technology.create!(name: "Ruby", icon: "💎"),
  rails: Technology.create!(name: "Rails", icon: "🚂"),
  tailwind: Technology.create!(name: "Tailwind CSS", icon: "🎨"),
  postgresql: Technology.create!(name: "PostgreSQL", icon: "🐘"),
  telegram: Technology.create!(name: "Telegram API", icon: "✈️"),
}

puts "Создание проектов..."
projects_data = [
  {
    name: "hh.ru Парсер",
    description: "Автоматизированный парсер вакансий с использованием API hh.ru.",
    featured: true,
    position: 1,
    technologies: [:ruby]
  },
  {
    name: "Telegram Бот",
    description: "Бот для Telegram с уведомлениями и автоматизацией задач.",
    featured: true,
    position: 2,
    technologies: [:ruby, :telegram]
  },
  {
    name: "Сайт-портфолио",
    description: "Персональный сайт-портфолио на Ruby on Rails с Tailwind CSS.",
    featured: true,
    position: 3,
    technologies: [:ruby, :rails, :tailwind, :postgresql]
  },
]

projects_data.each do |data|
  techs = data.delete(:technologies)
  project = Project.create!(data)
  techs.each { |t| project.technologies << technologies[t] }
  puts "  Создан проект: #{project.name}"
end

puts "\nГотово!"
puts "Проектов: #{Project.count}"
puts "Технологий: #{Technology.count}"
```

```bash
rails db:seed
```

### Результат дня
- [ ] 3 проекта созданы
- [ ] 5 технологий созданы
- [ ] Коммит сделан

---

## День 6-7: Tailwind стилизация

### Цель
Сделать красивые карточки проектов и главную страницу.

### app/views/pages/home.html.erb

```erb
<!-- Hero -->
<section class="bg-stone-900 text-white py-20">
  <div class="container mx-auto px-4 text-center">
    <h1 class="text-4xl md:text-6xl font-bold mb-4">
      Веб-разработка<br>
      <span class="text-red-500">любой сложности</span>
    </h1>
    <p class="text-xl text-stone-300 mb-8">
      От идеи до запуска и развития
    </p>
    <%= link_to "Смотреть проекты", projects_path,
        class: "inline-block bg-red-700 hover:bg-red-600 text-white px-8 py-3 rounded-lg font-medium transition" %>
  </div>
</section>

<!-- Projects -->
<section class="py-16">
  <div class="container mx-auto px-4">
    <h2 class="text-3xl font-bold text-center mb-12">Проекты</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <% Project.featured.each do |project| %>
        <%= link_to project, class: "group block" do %>
          <article class="bg-white rounded-xl border border-stone-200 overflow-hidden
                          hover:shadow-xl hover:-translate-y-1 transition-all duration-300">

            <!-- Image placeholder -->
            <div class="aspect-video bg-gradient-to-br from-stone-100 to-stone-200
                        flex items-center justify-center">
              <span class="text-6xl opacity-30">💻</span>
            </div>

            <!-- Content -->
            <div class="p-5">
              <h3 class="text-lg font-bold group-hover:text-red-700 transition">
                <%= project.name %>
              </h3>
              <p class="text-stone-600 text-sm mt-2 line-clamp-2">
                <%= project.description %>
              </p>

              <!-- Technologies -->
              <% if project.technologies.any? %>
                <div class="flex flex-wrap gap-1 mt-3">
                  <% project.technologies.each do |tech| %>
                    <span class="px-2 py-0.5 bg-stone-100 text-stone-600 text-xs rounded-full">
                      <%= tech.name %>
                    </span>
                  <% end %>
                </div>
              <% end %>
            </div>
          </article>
        <% end %>
      <% end %>
    </div>
  </div>
</section>

<!-- Technologies -->
<section class="py-12 bg-white border-t border-stone-200">
  <div class="container mx-auto px-4">
    <h2 class="text-2xl font-bold text-center mb-8">Технологии</h2>

    <div class="flex flex-wrap justify-center gap-3">
      <% Technology.all.each do |tech| %>
        <div class="flex items-center gap-2 px-4 py-2 bg-stone-50 rounded-full border border-stone-200">
          <span class="text-xl"><%= tech.icon %></span>
          <span class="text-stone-700"><%= tech.name %></span>
        </div>
      <% end %>
    </div>
  </div>
</section>
```

### Результат
- [ ] Hero секция
- [ ] Карточки проектов с hover
- [ ] Технологии
- [ ] Адаптив

---

# НЕДЕЛЯ 2: Hotwire + Деплой

---

## День 8: Turbo Drive и Frames

### Цель
Настроить навигацию без перезагрузки.

### Что такое Turbo

```
Turbo Drive:
- Перехватывает клики по ссылкам
- Загружает страницы через AJAX
- Обновляет body без перезагрузки

Turbo Frames:
- Обновляет часть страницы
- Идеально для форм и списков
```

### Пример: форма в модальном окне

```erb
<!-- Ссылка открывает в frame -->
<%= link_to "Новый проект", new_project_path, data: { turbo_frame: "modal" } %>

<!-- Frame для модального окна -->
<%= turbo_frame_tag "modal" %>
```

### app/views/projects/new.html.erb

```erb
<%= turbo_frame_tag "modal" do %>
  <div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
    <div class="bg-white rounded-xl shadow-2xl max-w-lg w-full mx-4 p-6">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold">Новый проект</h2>
        <%= link_to "✕", projects_path, class: "text-2xl text-gray-400" %>
      </div>

      <%= render "form", project: @project %>
    </div>
  </div>
<% end %>
```

### Результат дня
- [ ] Навигация без перезагрузки
- [ ] Форма в модальном окне
- [ ] Коммит сделан

---

## День 9: Turbo Streams

### Цель
CRUD без перезагрузки страницы.

### 7 действий Turbo Streams

```
1. append    - добавить в конец
2. prepend   - добавить в начало
3. replace   - заменить элемент
4. update    - обновить содержимое
5. remove    - удалить элемент
6. before    - вставить перед
7. after     - вставить после
```

### app/controllers/projects_controller.rb (обновить)

```ruby
def create
  @project = Project.new(project_params)

  respond_to do |format|
    if @project.save
      format.turbo_stream
      format.html { redirect_to @project, notice: "Проект создан" }
    else
      format.turbo_stream { render :new, status: :unprocessable_entity }
      format.html { render :new, status: :unprocessable_entity }
    end
  end
end

def destroy
  @project.destroy
  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to projects_path, notice: "Проект удалён" }
  end
end
```

### app/views/projects/create.turbo_stream.erb

```erb
<%= turbo_stream.append "projects" do %>
  <%= render "projects/project_card", project: @project %>
<% end %>

<%= turbo_stream.update "modal" do %>
<% end %>
```

### app/views/projects/destroy.turbo_stream.erb

```erb
<%= turbo_stream.remove dom_id(@project) %>
```

### Результат дня
- [ ] Создание без перезагрузки
- [ ] Удаление без перезагрузки
- [ ] Коммит сделан

---

## День 10: Stimulus JS

### Цель
Добавить немного JavaScript: toggle, clipboard.

### Что такое Stimulus

```
Stimulus = HTML + минимальный JS

3 концепта:
1. Controllers   - data-controller="name"
2. Targets       - data-name-target="element"
3. Actions       - data-action="click->name#method"
```

### app/javascript/controllers/toggle_controller.js

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  toggle() {
    this.contentTarget.classList.toggle("hidden")
  }
}
```

### Использование

```erb
<div data-controller="toggle">
  <button data-action="click->toggle#toggle">Показать/скрыть</button>
  <div data-toggle-target="content" class="hidden">
    Скрытый контент
  </div>
</div>
```

### app/javascript/controllers/clipboard_controller.js

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { text: String }

  async copy(event) {
    event.preventDefault()
    await navigator.clipboard.writeText(this.textValue)
    alert("Скопировано!")
  }
}
```

### Использование

```erb
<button data-controller="clipboard"
        data-clipboard-text-value="your@email.com"
        data-action="click->clipboard#copy">
  Скопировать email
</button>
```

### Результат дня
- [ ] Toggle контроллер работает
- [ ] Clipboard контроллер работает
- [ ] Коммит сделан

---

## День 11: Контактная форма

### Цель
Создать форму для связи.

### app/controllers/contacts_controller.rb

```ruby
class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contact_path, notice: "Сообщение отправлено!"
    else
      render "pages/contact", status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
```

### app/views/pages/contact.html.erb

```erb
<div class="container mx-auto px-4 py-12">
  <div class="max-w-2xl mx-auto">
    <h1 class="text-4xl font-bold mb-4">Связаться со мной</h1>
    <p class="text-stone-600 mb-8">
      Есть проект или вопрос? Напишите мне.
    </p>

    <%= form_with model: Contact.new, url: contacts_path, class: "space-y-6" do |f| %>
      <div>
        <%= f.label :name, "Ваше имя", class: "block text-sm font-medium mb-1" %>
        <%= f.text_field :name, class: "w-full px-4 py-3 border rounded-lg" %>
      </div>

      <div>
        <%= f.label :email, "Email", class: "block text-sm font-medium mb-1" %>
        <%= f.email_field :email, class: "w-full px-4 py-3 border rounded-lg" %>
      </div>

      <div>
        <%= f.label :message, "Сообщение", class: "block text-sm font-medium mb-1" %>
        <%= f.text_area :message, rows: 5, class: "w-full px-4 py-3 border rounded-lg" %>
      </div>

      <%= f.submit "Отправить", class: "bg-red-700 text-white px-6 py-3 rounded-lg cursor-pointer" %>
    <% end %>

    <div class="mt-12 pt-8 border-t">
      <h2 class="font-bold mb-4">Другие способы связи</h2>
      <p class="text-stone-600">Email: your@email.com</p>
      <p class="text-stone-600">Telegram: @yourname</p>
    </div>
  </div>
</div>
```

### config/routes.rb

```ruby
resources :contacts, only: [:create]
```

### Результат дня
- [ ] Форма работает
- [ ] Валидация работает
- [ ] Сообщения сохраняются в БД
- [ ] Коммит сделан

---

## День 12-13: Подготовка к деплою

### Цель
Подготовить проект к продакшену.

### config/environments/production.rb

```ruby
Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.force_ssl = true
  config.log_level = :info

  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.active_storage.service = :local
end
```

### Проверить

```bash
# Прекомпиляция assets
rails assets:precompile RAILS_ENV=production

# Проверка
RAILS_ENV=production rails console
```

### Яндекс Метрика

1. Зарегистрироваться на [metrika.yandex.ru](https://metrika.yandex.ru)
2. Создать счётчик для сайта
3. Получить код счётчика

#### app/views/layouts/application.html.erb

```erb
<head>
  <title>Портфолио</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>

  <%# Яндекс Метрика (только в production) %>
  <% if Rails.env.production? %>
    <script type="text/javascript">
      (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
      m[i].l=1*new Date();
      for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
      k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
      (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

      ym(ВАШ_ID, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true
      });
    </script>
    <noscript><div><img src="https://mc.yandex.ru/watch/ВАШ_ID" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
  <% end %>
</head>
```

Замените `ВАШ_ID` на ID счётчика из Яндекс Метрики.

### Результат
- [ ] Assets прекомпилируются
- [ ] Production config настроен
- [ ] Яндекс Метрика подключена
- [ ] Коммит сделан

---

## День 14: Деплой на Kamal 2

### Цель
Задеплоить сайт на VPS.

### Что нужно

1. VPS (Hetzner/Timeweb ~300-500₽/мес)
2. Домен (опционально)

### Установка Kamal

```bash
gem install kamal
kamal init
```

### config/deploy.yml

```yaml
service: portfolio
image: your-username/portfolio
servers:
  web:
    - your-server-ip
proxy:
  ssl: true
  host: your-domain.ru
registry:
  server: registry.digitalocean.com
  username: your-username
  password:
    - KAMAL_REGISTRY_PASSWORD
env:
  clear:
    RAILS_ENV: production
  secret:
    - RAILS_MASTER_KEY
    - POSTGRES_PASSWORD
accessories:
  db:
    image: postgres:16
    host: your-server-ip
    env:
      clear:
        POSTGRES_USER: portfolio
        POSTGRES_DB: portfolio_production
      secret:
        - POSTGRES_PASSWORD
    volumes:
      - portfolio_storage:/var/lib/postgresql/data
```

### Деплой

```bash
# Первый раз
kamal setup

# Потом
kamal deploy
```

### Результат
- [ ] Сайт онлайн
- [ ] HTTPS работает
- [ ] БД работает

---

# ИТОГИ

## Что ты умеешь после плана

| Навык | Уровень |
|-------|---------|
| Rails MVC | Базовый |
| Active Record | Базовый |
| Tailwind CSS | Базовый |
| Turbo (SPA) | Базовый |
| Stimulus JS | Начальный |
| PostgreSQL | Начальный |
| Kamal 2 | Начальный |

## Что дальше

1. Добавить больше проектов
2. Добавить блог
3. Добавить авторизацию (Devise)
4. Добавить админку
5. Оптимизировать SEO

---

*2 недели × 4 часа = 56 часов практики*
