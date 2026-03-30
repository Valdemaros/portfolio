# План: Сайт-портфолио на Rails 8

## Цель

Сделать сайт-портфолио как у [apavlyut.ru](https://www.apavlyut.ru/):
- Главная с проектами
- Страница всех проектов
- Страница услуг

## Технологии

| Технология | Зачем |
|------------|-------|
| Rails 8 | MVC, REST, Active Record |
| Tailwind CSS | Стили |
| Slim | Шаблонизатор (не ERB!) |
| Hotwire | Turbo (SPA без JS) + Stimulus (немного JS) |
| PostgreSQL | База данных |
| Kamal 2 | Деплой на VPS |

---

## Структура сайта

```
/                    → pages#home         (Главная)
/projects            → projects#index     (Список проектов)
/projects/:id        → projects#show      (Страница проекта)
/services            → pages#services     (Услуги)

```

---

# ПРОГРЕСС

| День | Тема | Статус |
|------|------|--------|
| 1 | Проект и первая страница | ✅ Готово |
| 2 | Модели и БД | ✅ Готово |
| 3 | Layout + Главная страница | ✅ Готово |
| 4 | Страница проектов | 🔄 В процессе |
| 5 | Страница услуг | ⬜ Не начато |
| 7 | Seed данные + связи | ⬜ Не начато |
| 8-9 | Turbo (SPA навигация) | ⬜ Не начато |
| 11-12 | Подготовка к деплою | ⬜ Не начато |
| 13-14 | Деплой на Kamal 2 | ⬜ Не начато |

---

# ДЕНЬ 1-2: Проект и модели (ПРОЙДЕНО)

✅ Проект создан
✅ Модели: Project, Technology, ProjectTechnology, Service
✅ Seeds базовые

---

# ДЕНЬ 3: Layout + Главная страница (ПРОЙДЕНО)

✅ Layout исправлен (убран container из main)
✅ Переписано на Slim
✅ CRUD удалён (не нужен на публичном сайте)
✅ home.html.slim: Navbar, Hero, Для кого, Категории, Проекты, Технологии, Footer

---

# ДЕНЬ 4: Страница проектов

## Цель
Стилизовать `/projects` — список всех проектов с карточками.

## Текущее состояние
Файл `projects/index.html.slim` — черновик, нужен дизайн.

## Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Стилизовать список проектов в сетку | 30 мин |
| 2 | Добавить карточки с hover-эффектами | 30 мин |
| 3 | Вывести технологии проекта | 20 мин |
| 4 | Добавить ссылку на show | 10 мин |

## Пример структуры

```slim
/ app/views/projects/index.html.slim

section.py-16
  .container.mx-auto.px-4
    h1.text-4xl.font-bold.mb-8 Все проекты

    .grid.grid-cols-1.md:grid-cols-2.lg:grid-cols-3.gap-6
      - @projects.each do |project|
        = link_to project, class: "group"
          article.border.rounded-lg.overflow-hidden.hover:shadow-lg.transition
            / Картинка
            .aspect-video.bg-stone-200
              - if project.image_url.present?
                = image_tag project.image_url, class: "w-full h-full object-cover"

            / Контент
            .p-4
              h3.font-bold.group-hover:text-red-600
                = project.title

              p.text-stone-600.text-sm.mt-1
                = truncate(project.description, length: 100)

              / Технологии
              - if project.technologies.any?
                .flex.flex-wrap.gap-1.mt-3
                  - project.technologies.each do |tech|
                    span.px-2.py-0.5.bg-stone-100.text-xs.rounded
                      = tech.name
```

## Результат дня
- [ ] Сетка карточек работает
- [ ] Hover эффекты
- [ ] Технологии выводятся
- [ ] Ссылки на show работают

---

# ДЕНЬ 5: Страница проекта (show)

## Цель
Стилизовать `/projects/:id` — страница отдельного проекта.

## Текущее состояние
Файл `projects/show.html.slim` — черновик.

## Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Дизайн страницы проекта | 45 мин |
| 2 | Вывести все поля (описание, ссылки) | 30 мин |
| 3 | Добавить technologies | 15 мин |
| 4 | Кнопка "Назад к проектам" | 10 мин |

## Пример структуры

```slim
/ app/views/projects/show.html.slim

section.py-16
  .container.mx-auto.px-4
    / Заголовок
    .mb-8
      = link_to "← Все проекты", projects_path, class: "text-red-600 hover:underline"
      h1.text-4xl.font-bold.mt-4 = @project.title

    / Картинка
    - if @project.image_url.present?
      .aspect-video.bg-stone-200.rounded-lg.overflow-hidden.mb-8
        = image_tag @project.image_url, class: "w-full h-full object-cover"

    / Описание
    .prose.max-w-none.mb-8
      p = @project.description

    / Технологии
    - if @project.technologies.any?
      .mb-8
        h2.text-xl.font-bold.mb-3 Технологии
        .flex.flex-wrap.gap-2
          - @project.technologies.each do |tech|
            span.px-3.py-1.bg-stone-100.rounded-full
              = tech.name

    / Ссылки
    .flex.gap-4
      - if @project.project_url.present?
        = link_to "Смотреть сайт", @project.project_url,
            class: "bg-red-700 text-white px-6 py-2 rounded-lg",
            target: "_blank"

      - if @project.github_url.present?
        = link_to "GitHub", @project.github_url,
            class: "border px-6 py-2 rounded-lg",
            target: "_blank"
```

## Результат дня
- [ ] Страница проекта выглядит хорошо
- [ ] Все поля выводятся
- [ ] Ссылки работают

---

# ДЕНЬ 6: Страница услуг

## Цель
Создать страницу `/services` со списком услуг.

## Модель уже есть!
Модель `Service` уже создана с полями:
- title
- description
- icon_url
- position

## Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Добавить route | 5 мин |
| 2 | Добавить action в PagesController | 10 мин |
| 3 | Создать services.html.slim | 45 мин |
| 4 | Обновить seeds для Services | 15 мин |

## config/routes.rb

```ruby
get "services", to: "pages#services"
```

## app/controllers/pages_controller.rb

```ruby
def services
  @services = Service.all.order(:position)
end
```

## Пример структуры

```slim
/ app/views/pages/services.html.slim

section.py-16
  .container.mx-auto.px-4
    h1.text-4xl.font-bold.text-center.mb-4 Услуги
    p.text-stone-600.text-center.mb-12
      | Разработка и поддержка веб-проектов

    .grid.grid-cols-1.md:grid-cols-2.lg:grid-cols-3.gap-8
      - @services.each do |service|
        article.p-6.border.rounded-lg.hover:shadow-lg.transition
          / Иконка (если есть)
          - if service.icon_url.present?
            .w-12.h-12.mb-4
              = image_tag service.icon_url, class: "w-full h-full object-contain"

          h2.text-xl.font-bold.mb-2 = service.title
          p.text-stone-600 = service.description
```

## Результат дня
- [ ] Страница /services работает
- [ ] Услуги выводятся из БД
- [ ] Дизайн готов

---

# ДЕНЬ 7: Seed данные и связи

## Цель
Заполнить БД реалистичными данными с правильными связями.

## Текущее состояние
- Seeds есть, но без связей Project ↔ Technology
- Нет image_url у проектов

## Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Добавить связи в seeds | 30 мин |
| 2 | Добавить image_url | 20 мин |
| 3 | Добавить больше проектов | 30 мин |
| 4 | Протестировать | 20 мин |

## db/seeds.rb (обновить)

```ruby
puts "Очистка БД..."
ProjectTechnology.destroy_all
Project.destroy_all
Technology.destroy_all
Service.destroy_all

puts "Создание технологий..."
technologies = {
  ruby: Technology.create!(name: "Ruby", color: "#CC342D"),
  rails: Technology.create!(name: "Rails", color: "#CC0000"),
  postgresql: Technology.create!(name: "PostgreSQL", color: "#336791"),
  tailwind: Technology.create!(name: "Tailwind CSS", color: "#38B2AC"),
  hotwire: Technology.create!(name: "Hotwire", color: "#7B68EE"),
  kamal: Technology.create!(name: "Kamal", color: "#1572B6"),
  telegram: Technology.create!(name: "Telegram API", color: "#0088CC"),
}

puts "Создание проектов..."
projects_data = [
  {
    title: "Ruby School",
    description: "Онлайн школа изучения Ruby. Курсы для начинающих и продвинутых.",
    image_url: "https://placehold.co/600x400/CC342D/white?text=Ruby+School",
    project_url: "https://example.com",
    featured: true,
    position: 1,
    technologies: [:ruby, :rails]
  },
  {
    title: "Telegram Bot",
    description: "Бот для поиска вакансий с hh.ru по API.",
    image_url: "https://placehold.co/600x400/0088CC/white?text=Telegram+Bot",
    github_url: "https://github.com/example/bot",
    featured: true,
    position: 2,
    technologies: [:ruby, :telegram]
  },
  {
    title: "Портфолио",
    description: "Этот сайт — персональное портфолио на Rails 8.",
    image_url: "https://placehold.co/600x400/CC0000/white?text=Portfolio",
    github_url: "https://github.com/example/portfolio",
    featured: true,
    position: 3,
    technologies: [:ruby, :rails, :tailwind, :hotwire, :kamal]
  },
]

projects_data.each do |data|
  techs = data.delete(:technologies)
  project = Project.create!(data)
  techs.each { |t| project.technologies << technologies[t] }
  puts "  Создан: #{project.title}"
end

puts "Создание услуг..."
services_data = [
  { title: "Разработка сайтов", description: "Любой сложности — от лендинга до портала.", position: 1 },
  { title: "Telegram боты", description: "Автоматизация и интеграции через API.", position: 2 },
  { title: "Консультации", description: "Помощь с архитектурой и кодом.", position: 3 },
]

services_data.each { |data| Service.create!(data) }

puts "\nГотово!"
puts "Проектов: #{Project.count}"
puts "Технологий: #{Technology.count}"
puts "Услуг: #{Service.count}"
```

```bash
rails db:reset  # Очистит и заполнит заново
```

## Результат дня
- [ ] Связи работают
- [ ] Картинки есть
- [ ] Данные реалистичные

---

# ДЕНЬ 8-9: Navbar и Footer в partials

## Цель
Вынести Navbar и Footer в отдельные файлы.

## Зачем
Сейчас Navbar и Footer в home.html.slim. Нужно переиспользовать на всех страницах.

## Задачи

| # | Задача | Время |
|---|--------|-------|
| 1 | Создать shared/_navbar.html.slim | 20 мин |
| 2 | Создать shared/_footer.html.slim | 20 мин |
| 3 | Обновить layout | 10 мин |
| 4 | Удалить из home.html.slim | 10 мин |

## app/views/shared/_navbar.html.slim

```slim
nav.bg-stone-800.text-white.py-4
  .container.mx-auto.px-4.flex.justify-between.items-center
    = link_to root_path, class: "flex.items-center.gap-3"
      .w-10.h-10.bg-red-700.rounded-full
      div
        .text-xl Владимир

    .flex.gap-6
      = link_to "Главная", root_path, class: "hover:text-red-400"
      = link_to "Проекты", projects_path, class: "hover:text-red-400"
      = link_to "Услуги", services_path, class: "hover:text-red-400"
```

## app/views/layouts/application.html.slim

```slim
doctype html
html
  head
    title = content_for(:title) || "Портфолио"
    / ... остальное ...
  body.h-full
    = render "shared/navbar"

    main
      = yield

    = render "shared/footer"
```

## Результат
- [ ] Navbar и Footer в partials
- [ ] Работают на всех страницах

---

# ДЕНЬ 10-11: Turbo (SPA навигация)

## Цель
Навигация без перезагрузки страницы.

## Что такое Turbo

```
Turbo Drive:
- Перехватывает клики по ссылкам
- Загружает страницы через AJAX
- Обновляет body без перезагрузки
- Работает автоматически!
```

## Уже работает!
Rails 8 включает Turbo по умолчанию. Просто проверь:
- Клик по ссылке → страница меняется без перезагрузки
- Кнопка "Назад" работает мгновенно

## Turbo Frames (опционально)

```

## Результат
- [ ] Навигация без перезагрузки работает

---

# ДЕНЬ 12-13: Деплой на Kamal 2

## Цель
Задеплоить сайт на VPS.

## Что нужно

1. VPS (Hetzner/Timeweb ~300-500₽/мес)
2. Домен (опционально)

## Установка Kamal

```bash
gem install kamal
kamal init
```

## config/deploy.yml

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

## Деплой

```bash
# Первый раз
kamal setup

# Потом
kamal deploy
```

## Результат
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
| Slim | Базовый |
| Turbo (SPA) | Начальный |
| PostgreSQL | Начальный |
| Kamal 2 | Начальный |

## Что дальше

1. Добавить блог
2. Добавить авторизацию (Devise) для админки
3. Оптимизировать SEO
4. Добавить аналитику (Яндекс Метрика)
5. Подключить отправку email

---

*2 недели × 3-4 часа = ~50 часов практики*
