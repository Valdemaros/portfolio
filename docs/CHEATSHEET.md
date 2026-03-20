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

## 📋 Rails Console

```ruby
# CRUD
Project.all
Project.find(1)
Project.find_by(name: "Test")
Project.create(name: "New")
Project.where(featured: true)
Project.count

# С связями
project.technologies << Technology.find_by(name: "Ruby")
project.technologies.pluck(:name)
```

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
