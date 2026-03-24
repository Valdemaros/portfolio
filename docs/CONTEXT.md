# Контекст проекта — 21 марта 2026

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
┌─────────────┐       ┌──────────────────────┐       ┌─────────────┐
│   Project   │───┬───│ ProjectTechnology    │───┬───│ Technology  │
├─────────────┤   │   ├──────────────────────┤   │   ├─────────────┤
│ title       │   │   │ project_id (FK)      │   │   │ name        │
│ description │   │   │ technology_id (FK)   │   │   │ color       │
│ image_url   │   │   └──────────────────────┘   │   └─────────────┘
│ project_url │   │                               │
│ github_url  │   │   ┌─────────────┐             │
│ featured    │   └───│  has_many   │─────────────┘
│ position    │       └─────────────┘
└─────────────┘
│
│   ┌─────────────┐
└───│   Service   │
    ├─────────────┤
    │ title       │
    │ description │
    │ icon_url    │
    │ position    │
    └─────────────┘
```

## Роуты

| URL | Controller#Action | Описание |
|-----|-------------------|----------|
| `/` | pages#home | Главная страница |
| `/about` | pages#about | О себе |
| `/contact` | pages#contact | Контакты |
| `/projects` | projects#index | Список проектов |
| `/projects/:id` | projects#show | Страница проекта |

## Что сделано

### День 1-2
- [x] Проект создан (Rails 8, PostgreSQL, Tailwind)
- [x] Модели: Project, Technology, ProjectTechnology, Service
- [x] Миграции выполнены
- [x] Seeds с тестовыми данными

### День 3
- [x] CRUD удалён (не нужен на публичном сайте)
- [x] Views переписаны на Slim
- [x] Layout исправлен (убран container из main)
- [x] Главная страница home.html.slim:
  - [x] Navbar
  - [x] Hero
  - [x] "Для кого"
  - [x] Категории
  - [x] Проекты (статичные карточки)
  - [x] Технологии (нужны правильные изображения)
  - [x] Footer

## Текущее состояние файлов

### Views
| Файл | Статус | Описание |
|------|--------|----------|
| `pages/home.html.slim` | ✅ Готов | Главная страница |
| `pages/about.html.slim` | 📝 Пустой | Страница "О себе" |
| `pages/contact.html.slim` | 📝 Пустой | Страница контактов |
| `projects/index.html.slim` | ⚠️ Черновик | Нужна стилизация |
| `projects/show.html.slim` | ⚠️ Черновик | Нужна стилизация |

### Controllers
| Файл | Статус |
|------|--------|
| `pages_controller.rb` | ✅ Только actions |
| `projects_controller.rb` | ✅ index, show (остальное закомментировано) |

### Models
| Файл | Валидации | Связи |
|------|-----------|-------|
| `project.rb` | title: presence | has_many technologies |
| `technology.rb` | name: presence, uniqueness | has_many projects |
| `service.rb` | — | — |
| `project_technology.rb` | — | join table |

## Проблемы/TODO

### Технологии (секция на home.html.slim)
- ❌ `w-50 h-50` — несуществующие классы, нужно `w-12 h-12`
- ❌ URL изображений — заглушки, нужны реальные логотипы
- ❌ Каждый технлогия в своём `.flex.flex-col` — не в сетке

### Routes
- ⚠️ `resources :projects` даёт все REST routes, а нужно только index/show
- Нужно: `resources :projects, only: [:index, :show]`

### Projects views
- ⚠️ `index.html.slim` — просто список, нужна сетка карточек
- ⚠️ `show.html.slim` — черновик, нужен дизайн страницы проекта

### Seeds
- ✅ Есть базовые данные (3 проекта, 6 технологий, 3 услуги)
- ❌ Нет связей Project ↔ Technology
- ❌ Нет `image_url` у проектов

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
  featured: true,
  position: 1
)

# Добавить технологию к проекту
p = Project.first
p.technologies << Technology.find_by(name: "Rails")

# Или через seeds
rails db:seed
```

## Следующие шаги

1. Исправить размеры изображений в Technologies (`w-12 h-12`)
2. Найти правильные URL для логотипов технологий
3. Собрать логотипы в сетку (flex-wrap или grid)
4. Изменить routes: `resources :projects, only: [:index, :show]`
5. Стилизовать `projects/index.html.slim` — карточки с данными из БД
6. Стилизовать `projects/show.html.slim` — страница отдельного проекта
7. Добавить связи в seeds (проекты ↔ технологии)
8. Заполнить страницы about и contact

## Документация

| Файл | Описание |
|------|----------|
| `SITE_STRUCTURE.md` | Структура сайта по секциям |
| `TAILWIN_CLASSES.md` | Справочник используемых классов |
| `CHEATSHEET.md` | Шпаргалка по Rails/Slim |
| `LEARNING_PLAN.md` | План обучения |
| `PROGRESS.md` | Трекер прогресса |
| `db_scheme.md` | Схема БД (нужно обновить) |

## Правила для ассистента

- ❌ НЕ писать код за пользователя — только направлять
- ✅ Давать примеры, таблицы, схемы
- ✅ Проверять файлы самому (не спрашивать "что в файле")
- ✅ Пользователь новичок — объяснять подробно
- ✅ Отвечать на русском языке
