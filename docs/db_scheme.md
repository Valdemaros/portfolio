# Database Schema

## ER Diagram

```
┌─────────────────────┐          ┌─────────────────────┐
│     CATEGORIES       │          │       THEMES        │
├─────────────────────┤          ├─────────────────────┤
│ id (PK)             │          │ id (PK)             │
│ name                │          │ name                │
│ position            │          │ position            │
│ created_at          │          │ created_at          │
│ updated_at          │          │ updated_at          │
└──────────┬──────────┘          └──────────┬──────────┘
           │                                │
           │ 1                              │ 1
           │                                │
           │ *                              │ *
┌──────────┴────────────────────────────────┴──────────┐
│                      PROJECTS                         │
├──────────────────────────────────────────────────────┤
│ id (PK)                                              │
│ title                                                │
│ description                                          │
│ image_url                                            │
│ project_url                                          │
│ github_url                                           │
│ position (string ⚠️)                                 │
│ featured                                             │
│ category_id (FK) ───────────────→ categories.id      │
│ theme_id (FK) ───────────────────→ themes.id         │
│ created_at                                           │
│ updated_at                                           │
└──┬───────────────────────────────────────────────────┘
   │
   │ *                              *              *
   ├─────────────────┐   ┌───────────────┐   ┌───────────────┐
   │                 │   │               │   │               │
   │  ┌──────────────┴─┐ │ ┌─────────────┴─┐ │ ┌─────────────┴─┐
   │  │PROJECT_TECHNOLOGY│ │PROJECT_FEATURE│ │ │   SERVICES    │
   │  ├─────────────────┤ │ ├──────────────┤ │ ├──────────────┤
   │  │ id (PK)         │ │ │ id (PK)      │ │ │ id (PK)      │
   │  │ project_id (FK) │ │ │ project_id   │ │ │ title        │
   │  │ technology_id(FK│ │ │ feature_id   │ │ │ description  │
   │  └────────┬────────┘ │ │ (FK)         │ │ │ icon_url     │
   │           │          │ └──────┬───────┘ │ │ position     │
   │           │          │        │         │ └──────────────┘
   │  ┌────────┴────────┐ │ ┌──────┴───────┐ │
   │  │  TECHNOLOGIES   │ │ │   FEATURES   │ │
   │  ├─────────────────┤ │ ├──────────────┤ │
   │  │ id (PK)         │ │ │ id (PK)      │ │
   │  │ name (unique)   │ │ │ name         │ │
   │  │ color           │ │ │ position     │ │
   │  │ icon_url        │ │ └──────────────┘ │
   │  └─────────────────┘ │                  │
   │                      │                  │
```

---

## Projects

Проекты портфолио

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| title | string | Название проекта |
| description | text | Описание проекта |
| image_url | string | Ссылка на картинку превью |
| project_url | string | Ссылка на живой проект |
| github_url | string | Ссылка на GitHub репозиторий |
| position | string | Порядок сортировки (⚠️ должен быть integer) |
| featured | boolean | Показывать на главной? |
| category_id | bigint | FK → categories.id |
| theme_id | bigint | FK → themes.id |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

**Индексы:** category_id, theme_id

---

## Categories

Категории проектов (Стартап, Корпоративный сайт, Интернет-Магазин и т.д.)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| name | string | Название категории |
| position | integer | Порядок сортировки |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

---

## Themes

Тематики проектов (Getting Things Done, Продуктивность, Фитнес и т.д.)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| name | string | Название тематики |
| position | integer | Порядок сортировки |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

---

## Technologies

Технологии (Ruby on Rails, PostgreSQL, TailwindCSS и т.д.)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| name | string | Название технологии |
| color | string | Цвет бейджа (hex: #CC342D) |
| icon_url | string | Ссылка на иконку/лого |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

**Индексы:** name (unique)

---

## Features

Возможности/функциональность проектов (CMS, SEO, Авторизация и т.д.)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| name | string | Название возможности |
| position | integer | Порядок сортировки |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

---

## ProjectTechnologies

Join-таблица (связь Project ↔ Technology, многие-ко-многим)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| project_id | bigint | FK → projects.id |
| technology_id | bigint | FK → technologies.id |

**Индексы:** project_id, technology_id

---

## ProjectFeatures

Join-таблица (связь Project ↔ Feature, многие-ко-многим)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| project_id | bigint | FK → projects.id |
| feature_id | bigint | FK → features.id |

**Индексы:** project_id, feature_id

---

## Services

Услуги (независимая модель)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| title | string | Название услуги |
| description | text | Описание услуги |
| icon_url | string | Ссылка на иконку |
| position | integer | Порядок сортировки |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

**Индексы:** position

---

## Связи

```
Project
  ├── belongs_to :category (optional: true)
  ├── belongs_to :theme (optional: true)
  ├── has_many :project_technologies
  ├── has_many :technologies, through: :project_technologies
  ├── has_many :project_features
  └── has_many :features, through: :project_features

Category
  └── has_many :projects

Theme
  └── has_many :projects

Technology
  ├── has_many :project_technologies
  └── has_many :projects, through: :project_technologies

Feature
  ├── has_many :project_features
  └── has_many :projects, through: :project_features

ProjectTechnology
  ├── belongs_to :project
  └── belongs_to :technology

ProjectFeature
  ├── belongs_to :project
  └── belongs_to :feature

Service
  └── (независимая модель)
```

---

## Seed данные (текущие)

| Модель | Количество | Примеры |
|--------|-----------|---------|
| Category | 20 | Стартап, Корпоративный сайт, Интернет-Магазин, CRM система... |
| Theme | 24 | Getting Things Done, Продуктивность, Фитнес, Образование... |
| Technology | 34 | Ruby on Rails, PostgreSQL, TailwindCSS, ReactJS, Docker... |
| Feature | 42 | CMS, SEO, Авторизация через SMS, API Backend... |
| Service | 3 | Разработка сайтов, Телеграм-боты, Анализ |
| Project | 0 | ❌ Нет проектов в seeds |
