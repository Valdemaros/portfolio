# 🛠️ Шпаргалка: Rails 8 + Tailwind + Hotwire

## Ежедневные команды

### 🚀 Запуск проекта
```bash
rails server              # Запуск сервера (localhost:3000)
rails console             # Консоль Rails
bin/dev                   # Запуск с Tailwind watcher
```

### 🗄️ База данных
```bash
rails db:create           # Создать БД
rails db:migrate          # Применить миграции
rails db:rollback         # Откатить миграцию
rails db:seed             # Заполнить тестовыми данными
rails db:reset            # Пересоздать БД полностью
```

### ⚡ Генераторы
```bash
rails g model ModelName field:type       # Модель
rails g controller ControllerName action # Контроллер
rails g scaffold ModelName field:type    # Полный CRUD
rails destroy model ModelName            # Удалить
```

---

## 🐳 Kamal 2 (Деплой)

### Основные команды
```bash
gem install kamal           # Установить Kamal
kamal setup                 # Первичная настройка сервера
kamal deploy                # Деплой новой версии
kamal rollback              # Откат к предыдущей версии
kamal console               # Rails консоль на сервере
kamal logs -f               # Логи в реальном времени
kamal app exec -i --reuse "bash"  # SSH на сервер
```

### config/deploy.yml
```yaml
service: portfolio
image: user/portfolio
servers:
  web:
    - 123.456.789.100
proxy:
  ssl: true
  host: yourdomain.ru
env:
  secret:
    - RAILS_MASTER_KEY
    - SECRET_KEY_BASE
```

---

## 🔧 Rails 8 Новинки

### Solid Queue (встроенная очередь)
```ruby
# config/application.rb
config.active_job.queue_adapter = :solid_queue

# Запуск worker (встроен в Puma по умолчанию)
SOLID_QUEUE_IN_PUMA=true
```

### Solid Cache
```ruby
# config/environments/production.rb
config.cache_store = :solid_cache_store
```

### Генерация секретов
```bash
rails secret               # Сгенерировать SECRET_KEY_BASE
cat config/master.key      # Показать master key
```

---

## 📝 Типы данных в миграциях

| Тип | Пример |
|-----|--------|
| `:string` | `t.string :name` |
| `:text` | `t.text :description` |
| `:integer` | `t.integer :position` |
| `:boolean` | `t.boolean :featured` |
| `:datetime` | `t.datetime :published_at` |
| `:references` | `t.references :project` |

---

## 🎨 Tailwind — часто используемые классы

### Отступы
```
p-4, p-6, p-8      = padding
m-4, mt-4, mx-4    = margin
space-x-4          = gap между элементами по горизонтали
space-y-4          = gap по вертикали
gap-4, gap-6       = gap в grid/flex
```

### Flexbox
```
flex               = display: flex
flex-col           = flex-direction: column
items-center       = align-items: center
justify-between    = justify-content: space-between
justify-center     = justify-content: center
```

### Grid
```
grid               = display: grid
grid-cols-1        = 1 колонка
grid-cols-3        = 3 колонки
md:grid-cols-2     = 2 колонки на md+
```

### Текст
```
text-sm, text-lg, text-2xl, text-4xl
font-bold, font-medium
text-center, text-left
text-stone-800, text-red-700
```

### Цвета (Stone + Red для бренда)
```
bg-white, bg-stone-50, bg-stone-900
text-stone-600, text-stone-800
bg-red-700, text-red-700, border-red-500
```

### Hover и анимации
```
hover:bg-red-800
hover:text-white
hover:shadow-xl
hover:-translate-y-1
transition-all duration-300
group + group-hover:text-red-700
```

### Адаптивность
```
hidden md:block    = скрыть на mobile, показать на md+
md:flex            = flex на md+
lg:grid-cols-3     = 3 колонки на lg+
```

---

## 🍃 Slim — Шаблонизатор

### Базовый синтаксис

| Slim | HTML |
|------|------|
| `h1 Привет` | `<h1>Привет</h1>` |
| `h1.title Привет` | `<h1 class="title">Привет</h1>` |
| `h1#main.title` | `<h1 id="main" class="title">` |
| `.card` | `<div class="card"></div>` |
| `#main` | `<div id="main"></div>` |
| `= something` | `<%= something %>` (вывод) |
| `- code` | `<% code %>` (без выводода) |

### HTML теги

```slim
h1 Заголовок
p Текст параграфа
a href="/path" Ссылка
img src="image.jpg" alt="Картинка"
input type="text" value="Значение"
button Кнопка
```

### Классы и ID

```slim
/* Класс через точку */
.card
  p.text-red-700 Текст

/* ID через решётку */
#main
  h1 Заголовок

/* Несколько классов */
.bg-white.p-4.rounded
  p Текст

/* Класс + ID */
.card#main

/* Произвольные атрибуты */
div class="card" data-id="1"
```

### Ruby код в Slim

```slim
/* = выводит результат */
= @project.title
= link_to "Ссылка", @project
= time_ago_in_words(@project.created_at)

/* - выполняет без вывода */
- if @project.featured?
  p Избранный

- @projects.each do |project|
  h2 = project.title

/* = в тексте */
h2 = "Проект: #{@project.title}"
p = truncate(@project.description, length: 100)
```

### Условия

```slim
/* if */
- if @project.featured?
  span.bg-red-700 Избранный

/* if-else */
- if @project.technologies.any?
  = @project.technologies.count
- else
  | Нет технологий

/* unless (если НЕ) */
- unless @project.nil?
  = @project.title
```

### Циклы

```slim
/* each */
- @projects.each do |project|
  h2 = project.title
  p = project.description

/* each_with_index */
- @projects.each_with_index do |project, index|
  div
    span = index + 1
    h2 = project.title
```

### Текст и многострочный контент

```slim
/* Простой текст */
h1 Привет мир

/* Текст после тега */
h1
  | Привет мир

/* Многострочный текст с | */
p
  |
    Это длинный текст
    который занимает
    несколько строк

/* Интерполяция в тексте */
p
  | Проект #{project.title} создан #{project.created_at}
```

### Вложенность

```slim
/* Отступы важны! (2 пробела) */
.container
  h1 Заголовок
  .content
    p Текст внутри content
    p Ещё текст
```

### Rails хелперы

```slim
/* Ссылки */
= link_to "Проекты", projects_path
= link_to "Показать", @project
= link_to "Редактировать", edit_project_path(@project)

/* Ссылка с классами */
= link_to "Проекты", projects_path, class: "text-red-700 hover:text-red-800"

/* Ссылка в виде блока */
= link_to @project, class: "card" do
  h2 = @project.title
  p = @project.description

/* Картинка */
= image_tag "logo.png", class: "w-10"
```

### Формы

```slim
/* Базовая форма */
= form_with model: @project do |f|
  div
    = f.label :title
    = f.text_field :title
  
  div
    = f.label :description
    = f.text_area :description
  
  = f.submit "Сохранить"

/* Форма с классами */
= form_with model: @project, class: "space-y-4" do |f|
  div
    = f.label :title, "Название", class: "block mb-1"
    = f.text_field :title, class: "border p-2 w-full rounded"
  
  = f.submit "Сохранить", class: "bg-red-700 text-white px-4 py-2 rounded"
```

### Поля формы

```slim
= f.text_field :title              /* Текст */
= f.text_area :description         /* Многострочный текст */
= f.number_field :position         /* Число */
= f.email_field :email             /* Email */
= f.password_field :password       /* Пароль */
= f.check_box :featured            /* Галочка */
= f.select :status, ["draft", "published"]  /* Выпадающий список */
= f.date_field :published_at       /* Дата */
= f.hidden_field :user_id          /* Скрытое поле */
= f.file_field :image              /* Загрузка файла */
```

### Ошибки валидации

```slim
- if @project.errors.any?
  .bg-red-100.p-4.rounded
    h2 = "#{@project.errors.count} ошибок"
    ul
      - @project.errors.full_messages.each do |msg|
        li = msg
```

### Partials (частичные шаблоны)

```slim
/* Файл _form.html.slim (нижнее подчёркивание!) */

/* Подключение */
= render "form", project: @project

/* Подключение из другой папки */
= render "shared/navbar"

/* Коллекция (для каждого элемента) */
= render @projects

/* Это вызовет _project.html.slim для каждого проекта */
```

### Сравнение ERB vs Slim

| ERB | Slim |
|-----|------|
| `<h1 class="title"><%= @title %></h1>` | `h1.title = @title` |
| `<div class="card">` | `.card` |
| `<% if @show %>` | `- if @show` |
| `<%= link_to "Text", path %>` | `= link_to "Text", path` |

### Пример полной страницы

```slim
/* app/views/projects/index.html.slim */
.container.mx-auto.px-4.py-8
  h1.text-3xl.font-bold.mb-6 Проекты
  
  = link_to "Новый проект", new_project_path, class: "bg-red-700 text-white px-4 py-2 rounded"
  
  .mt-8.grid.grid-cols-1.md:grid-cols-3.gap-6
    - @projects.each do |project|
      .border.rounded.p-4.hover:shadow-lg.transition
        h2.text-xl.font-bold = project.title
        p.text-gray-600.mt-2 = truncate(project.description, length: 100)
        .mt-4.flex.gap-2
          = link_to "Открыть", project, class: "text-blue-600"
          = link_to "Редактировать", edit_project_path(project), class: "text-green-600"
```

---

## ⚡ Hotwire — Turbo

### Turbo Frame
```erb
<%= turbo_frame_tag "projects" do %>
  <!-- контент обновляется без перезагрузки -->
<% end %>

<%= turbo_frame_tag dom_id(@project) do %>
  <!-- уникальный frame для каждого объекта -->
<% end %>
```

### Turbo Stream (7 действий)
```erb
<%= turbo_stream.append "projects" do %>     <!-- добавить в конец -->
<%= turbo_stream.prepend "projects" do %>    <!-- добавить в начало -->
<%= turbo_stream.replace "project_1" do %>   <!-- заменить -->
<%= turbo_stream.update "counter" do %>      <!-- обновить содержимое -->
<%= turbo_stream.remove "project_1" %>       <!-- удалить -->
<%= turbo_stream.before "project_1" do %>    <!-- вставить перед -->
<%= turbo_stream.after "project_1" do %>     <!-- вставить после -->
```

### Broadcasts (Real-time)
```ruby
# В модели
class Project < ApplicationRecord
  broadcasts_to ->(project) { :projects }
end
```

```erb
<!-- В view — подписка -->
<%= turbo_stream_from :projects %>
```

---

## 🎮 Hotwire — Stimulus

### Базовый контроллер
```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  static values = { text: String }
  static classes = ["hidden"]
  
  connect() {
    // вызывается при подключении
  }
  
  toggle() {
    this.contentTarget.classList.toggle("hidden")
  }
}
```

### Использование в HTML
```erb
<div data-controller="toggle" data-toggle-hidden-class="hidden">
  <button data-action="click->toggle#toggle">Toggle</button>
  <div data-toggle-target="content" class="hidden">Content</div>
</div>
```

---

## 🔗 Rails Routes

```ruby
# config/routes.rb
root 'pages#home'
get 'about', to: 'pages#about'
resources :projects
resources :projects, only: [:index, :show]
```

### Хелперы
```erb
<%= root_path %>              <!-- / -->
<%= projects_path %>          <!-- /projects -->
<%= project_path(@project) %> <!-- /projects/1 -->
<%= new_project_path %>       <!-- /projects/new -->
<%= edit_project_path(@p) %>  <!-- /projects/1/edit -->
```

---

## 📋 Active Record Query (БД)

### Получение записей
```ruby
# Все
Project.all

# По ID
Project.find(1)              # Ошибка если нет
Project.find_by(id: 1)       # nil если нет

# По полю
Project.find_by(name: "Test")
Project.find_by!(name: "Test")   # Ошибка если нет

# Первая/последняя
Project.first
Project.last
Project.first(3)             # Первые 3
```

### Условия (where)
```ruby
# Равно
Project.where(featured: true)

# Несколько условий (AND)
Project.where(featured: true, position: 1)

# Массив значений (IN)
Project.where(id: [1, 2, 3])
Project.where(name: ["Ruby", "Rails"])

# Сравнение чисел
Project.where("position > ?", 5)
Project.where("position >= ? AND position <= ?", 1, 10)

# LIKE (поиск)
Project.where("name LIKE ?", "%бот%")
Project.where("name ILIKE ?", "%БОТ%")     # Без учёта регистра (PostgreSQL)

# NOT
Project.where.not(featured: true)

# OR
Project.where(featured: true).or(Project.where(position: 1))
```

### Сортировка, лимит, выборка
```ruby
# Сортировка
Project.order(:created_at)               # ASC
Project.order(created_at: :desc)         # DESC

# Лимит
Project.limit(5)
Project.limit(5).offset(10)              # Пагинация

# Выборка полей
Project.select(:name, :url)
Project.pluck(:name)                     # ["Name1", "Name2"]
Project.pluck(:id, :name)                # [[1, "Name1"], [2, "Name2"]]
Project.ids                              # [1, 2, 3]
```

### Подсчёт и проверка
```ruby
Project.count
Project.where(featured: true).count

Project.exists?                          # Есть хоть одна?
Project.exists?(featured: true)
Project.where(name: "Test").exists?

Project.empty?
```

### Связи (N+1 решение)
```ruby
# ПЛОХО — N+1 запросов
Project.all.each { |p| p.technologies.count }

# ХОРОШО — includes
Project.includes(:technologies).each { |p| p.technologies.size }

# Joins (фильтр по связи)
Project.joins(:technologies)
       .where(technologies: { name: "Ruby" })
       .distinct
```

### Scopes (переиспользование)
```ruby
# В модели
scope :featured, -> { where(featured: true) }
scope :recent, -> { order(created_at: :desc) }

# Использование
Project.featured
Project.featured.recent.limit(5)
```

### Создание/Обновление/Удаление
```ruby
# Создание
Project.create(name: "Test")
Project.create!(name: "Test")            # Ошибка если валидация не прошла

# Найти или создать
Project.find_or_create_by(name: "Test")

# Обновление
project.update(name: "New")
project.update!(name: "New")             # Ошибка если валидация не прошла
Project.update_all(featured: false)      # Массовое, без callbacks

# Удаление
project.destroy                          # С callbacks
project.delete                           # Без callbacks
Project.destroy_all(featured: false)
```

### Шпаргалка методов

| Метод | Возвращает |
|-------|------------|
| `all` | Все записи |
| `find(id)` | Запись или ошибка |
| `find_by(...)` | Запись или nil |
| `where(...)` | Relation (цепляется) |
| `order(...)` | Отсортированные |
| `limit(n)` | Первые n |
| `first` / `last` | Одна запись |
| `count` | Число |
| `pluck(:field)` | Массив значений |
| `exists?` | true/false |
| `includes(:assoc)` | Предзагрузка связей |
| `joins(:assoc)` | JOIN запрос |

---

## 📁 Структура проекта

```
app/
├── controllers/     # Логика обработки запросов
├── models/          # Работа с БД
├── views/           # HTML шаблоны (ERB)
├── javascript/
│   └── controllers/ # Stimulus контроллеры
├── helpers/         # Вспомогательные методы
└── mailers/         # Отправка email

config/
├── routes.rb        # Маршруты
├── database.yml     # Настройки БД
└── environments/    # Настройки окружений

db/
├── migrate/         # Миграции
├── schema.rb        # Структура БД
└── seeds.rb         # Тестовые данные
```

---

## 🔐 Credentials

```bash
# Редактировать credentials
EDITOR=nano rails credentials:edit

# Редактировать production credentials
EDITOR=nano rails credentials:edit --environment production

# Использовать в коде
Rails.application.credentials.secret_key_base
Rails.application.credentials.database_password

# Показать master key
cat config/master.key
```

---

## 🐘 PostgreSQL

### Типы данных
```ruby
# В миграциях
t.string :name           # varchar(255)
t.text :description      # text (без лимита)
t.integer :position      # integer
t.boolean :featured      # boolean
t.datetime :published_at # timestamp
t.jsonb :metadata        # JSONB (PostgreSQL)
t.array :tags            # text[] (PostgreSQL)
t.cidr :ip_range         # IP адреса
t.tsvector :search       # Полнотекстовый поиск
```

### Индексы
```ruby
# Простые
add_index :projects, :featured
add_index :projects, :created_at

# Составные
add_index :projects, [:featured, :position]

# Уникальные
add_index :technologies, :name, unique: true

# Частичные (условные)
add_index :projects, :position, where: "featured = true"

# GIN для JSONB
add_index :projects, :metadata, using: :gin

# Полнотекстовый поиск
add_index :projects, 
  "to_tsvector('russian', name || ' ' || description)", 
  using: :gin
```

### JSONB запросы
```ruby
# Получить значение
Project.where("metadata->>'language' = ?", "Ruby")

# Сравнение чисел
Project.where("metadata->'stars' > ?", 10)

# Проверка ключа
Project.where("metadata ? :key", key: "tags")

# Содержит (contains)
Project.where("metadata @> ?", { "language" => "Ruby" }.to_json)

# Массив содержит
Project.where("metadata->'tags' @> ?", ["bot"].to_json)
```

### EXPLAIN ANALYZE
```ruby
# Посмотреть план запроса
Project.where(featured: true).explain

# С joins
Project.joins(:technologies).explain

# Искать Seq Scan — нужен индекс!
```

### Решение N+1
```ruby
# Плохо (N+1 запросов)
Project.all.each { |p| p.technologies.count }

# Хорошо (eager loading)
Project.includes(:technologies).each { |p| p.technologies }

# Лучше (counter_cache)
# Добавить колонку technologies_count в projects
belongs_to :project, counter_cache: true
```

### Полезные запросы
```ruby
# Группировка
Project.group(:featured).count
# => { true => 5, false => 10 }

# Having
Project.group(:featured).having("COUNT(*) > 3").count

# Подзапросы
Project.where(featured: Technology.where(name: "Ruby").select(:project_id))

# Coalesce (значение по умолчанию)
Project.select("COALESCE(url, github_url) as link")

# Полнотекстовый поиск
Project.where("to_tsvector('russian', name || ' ' || description) @@ to_tsquery(?)", "бот")
```

---

## 📦 Альтернативы Kamal (бесплатно)

### Render
```yaml
# render.yaml
services:
  - type: web
    name: portfolio
    runtime: ruby
    buildCommand: "./bin/render-build.sh"
    startCommand: "bin/rails server"
    envVars:
      - key: RAILS_MASTER_KEY
        sync: false
```

---

*Распечатай и держи рядом!*
