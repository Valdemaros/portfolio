# Контекст проекта — 28 марта 2026 (обновлено)

## Что это за проект

Сайт-портфолио на Rails 8. Делаем как apavlyut.ru

## Технологии

| Компонент | Технология |
|-----------|------------|
| Backend | Rails 8 |
| Database | PostgreSQL |
| CSS | Tailwind CSS |
| Templates | Slim |
| Deployment | Kamal 2 (planned) |

## Модели и связи

```
┌──────────────┐       ┌──────────────────────┐       ┌──────────────┐
│   Project    │───┬───│ ProjectTechnology    │───┬───│ Technology  │
├──────────────┤   │   ├──────────────────────┤   │   ├──────────────┤
│ title        │   │   │ project_id (FK)      │   │   │ name        │
│ description  │   │   │ technology_id (FK)   │   │   │ color       │
│ image_url    │   │   └──────────────────────┘   │   │ icon_url    │
│ project_url  │   │                               │   └──────────────┘
│ github_url   │   │                               │
│ featured     │   │                               │
│ position     │   │                               │
├──────────────┤   │                               │
│ category_id  │───┤                               │
│ theme_id     │───┤                               │
└──────────────┘   │                               │
                   │   ┌──────────────────────┐   │
                   └───│ ProjectFeature       │───┤
                       ├──────────────────────┤   │
                       │ project_id (FK)      │   │
                       │ feature_id (FK)      │   │
                       └──────────────────────┘   │
                                                 │
┌──────────────┐       ┌──────────────┐           │
│   Category   │───────│   Project    │           │
├──────────────┤       └──────────────┘           │
│ name         │                                   │
│ position     │       ┌──────────────┐           │
└──────────────┘───────│    Theme     │           │
                       ├──────────────┤           │
                       │ name         │           │
                       │ position     │           │
                       └──────────────┘           │
                                                  │
                       ┌──────────────┐           │
                       │   Feature    │───────────┘
                       ├──────────────┤
                       │ name         │
                       │ position     │
                       └──────────────┘

┌──────────────┐
│   Service    │  (независимая модель)
├──────────────┤
│ title        │
│ description  │
│ icon_url     │
│ position     │
└──────────────┘
```

## Роуты (текущие и планируемые)

| URL | Controller#Action | Статус |
|-----|-------------------|--------|
| `/` | pages#home | ✅ Готово |
| `/projects` | projects#index | ⚠️ Черновик (фильтрация по категории/теме/технологии/фиче работает) |
| `/projects/:id` | projects#show | ⚠️ Черновик |
| `/services` | pages#services | ⬜ Не начато |
| `/about` | pages#about | ⬜ Не начато |
| `/contact` | pages#contact | ⬜ Не начато |

## Что сделано

### День 1-2
- [x] Проект создан (Rails 8, PostgreSQL, Tailwind)
- [x] Модели: Project, Technology, ProjectTechnology, Service

### День 3
- [x] CRUD удалён (не нужен на публичном сайте)
- [x] Views переписаны на Slim
- [x] Layout исправлен (убран container из main)
- [x] Главная страница home.html.slim полностью готова:
  - [x] Navbar
  - [x] Hero
  - [x] "Для кого"
  - [x] Категории
  - [x] Проекты (статичные карточки)
  - [x] Технологии
  - [x] Footer

### День 4 (25 марта)
- [x] Новые модели: Category, Theme, Feature, ProjectFeature
- [x] Новые миграции (5 шт): categories, themes, features, project_features, add_category_and_theme_to_projects
- [x] Project обновлён: belongs_to :category, belongs_to :theme, has_many :features
- [x] Seeds обновлён: категории (20 шт), тематики (24 шт), технологии (34 шт), фичи (42 шт), услуги (3 шт)
- [x] ProjectsController#index: фильтрация по category_id, theme_id, technology_id, feature_id
- [x] projects/index.html.slim: черновик с фильтрами по категориям, тематикам, технологиям, возможностям

## Текущее состояние файлов

### Views
| Файл | Статус | Описание |
|------|--------|----------|
| `pages/home.html.slim` | ✅ Готов | Главная страница |
| `projects/index.html.slim` | ⚠️ Черновик | Фильтры работают, нужна стилизация |
| `projects/show.html.slim` | ⚠️ Черновик | Нужна стилизация |
| `pages/services.html.slim` | ⬜ Не создан | Страница услуг |
| `pages/about.html.slim` | 📝 Пустой | Страница "О себе" |
| `pages/contact.html.slim` | 📝 Пустой | Страница контактов |

### Controllers
| Файл | Статус |
|------|--------|
| `pages_controller.rb` | ✅ Только actions |
| `projects_controller.rb` | ✅ index (с фильтрацией), show |

### Models
| Файл | Валидации | Связи |
|------|-----------|-------|
| `project.rb` | title: presence | belongs_to :category, belongs_to :theme, has_many technologies, has_many features |
| `technology.rb` | name: presence, uniqueness | has_many projects (through) |
| `category.rb` | — | has_many :projects |
| `theme.rb` | — | has_many :projects |
| `feature.rb` | — | has_many projects (through) |
| `project_feature.rb` | — | belongs_to :project, belongs_to :feature |
| `project_technology.rb` | — | belongs_to :project, belongs_to :technology |
| `service.rb` | — | — |

## Проблемы/TODO

### Routes
- ⚠️ `resources :projects` даёт все REST routes, а нужно только index/show
- Нужно: `resources :projects, only: [:index, :show]`

### Schema
- ⚠️ `projects.position` имеет тип `string` вместо `integer` (миграция add_category_and_theme_to_projects)

### Главная страница (мелкие баги)
- ⚠️ Технологии: классы `w-50 h-50` — нужно `w-12 h-12`
- ⚠️ URL изображений технологий — заглушки

### Seeds
- ❌ Нет ни одного проекта в seeds
- ❌ Нет связей Project ↔ Technology
- ❌ Нет связей Project ↔ Feature

### projects/index.html.slim
- ⚠️ Стилистика черновая (px-80, h-70 w-60 — нестандартные размеры)
- ⚠️ Разметка вложена неправильно (.p-2.text-center вне link_to)

### Новые страницы (не начаты)
- ⬜ `/services` — страница услуг
- ⬜ `/about` — страница "О себе"
- ⬜ `/contact` — страница контактов

### Partials (не начаты)
- ⬜ Вынести Navbar в `shared/_navbar.html.slim`
- ⬜ Вынести Footer в `shared/_footer.html.slim`

## Как управлять проектами

Без админки. Через консоль:

```bash
rails console

# Создать проект
Project.create!(
  title: "Название",
  description: "Описание",
  image_url: "https://...",
  project_url: "https://...",
  github_url: "https://...",
  featured: true,
  position: 1,
  category: Category.find_by(name: "Стартап"),
  theme: Theme.find_by(name: "Продуктивность")
)

# Добавить технологию к проекту
p = Project.first
p.technologies << Technology.find_by(name: "Ruby on Rails")

# Добавить фичу к проекту
p.features << Feature.find_by(name: "CMS")

# Или через seeds
rails db:seed
```

## Следующие шаги

### День 4-5: Стилизация страницы проектов
1. Стилизовать `projects/index.html.slim` — сетка карточек, адаптивность
2. Стилизовать `projects/show.html.slim` — страница проекта
3. Вывести технологии и фичи на карточках

### День 6: Страница услуг
1. Добавить route: `get "services", to: "pages#services"`
2. Добавить action в PagesController
3. Создать `pages/services.html.slim`
4. Вывести услуги из модели Service

### День 7: Seeds с проектами и связями
1. Добавить проекты в seeds
2. Добавить связи Project ↔ Technology
3. Добавить связи Project ↔ Feature

### День 8-9: Partials
1. Вынести Navbar в `shared/_navbar.html.slim`
2. Вынести Footer в `shared/_footer.html.slim`
3. Обновить layout

### День 10-11: Turbo (SPA навигация)
1. Проверить Turbo Drive (работает по умолчанию)
2. Опционально: Turbo Frames для отдельных блоков

### День 12+: Деплой
1. Kamal 2 setup
2. Деплой на VPS

## Документация

| Файл | Описание |
|------|----------|
| `CONTEXT.md` | Общий контекст проекта (этот файл) |
| `SITE_STRUCTURE.md` | Структура сайта по секциям |
| `TAILWIN_CLASSES.md` | Справочник используемых классов |
| `CHEATSHEET.md` | Шпаргалка по Rails/Slim |
| `LEARNING_PLAN.md` | План обучения |
| `PROGRESS.md` | Трекер прогресса |
| `db_scheme.md` | Схема БД |

## Правила для ассистента

- ✅ НЕ писать код за пользователя — только направлять
- ✅ НИКОГДА не просить пользователя показать вывод команды — всегда проверять самой
- ✅ Давать примеры, таблицы, схемы
- ✅ Проверять файлы самому (не спрашивать "что в файле")
- ✅ Пользователь новичок — объяснять подробно
- ✅ Отвечать на русском языке
- ✅ Объяснять откуда берётся каждая переменная/метод (params, @projects и т.д.)
- ✅ Пояснять каждую строчку кода, если я спрашиваю
- ✅ Я новичок — мне важно понимать не только "что", но и "откуда"
 