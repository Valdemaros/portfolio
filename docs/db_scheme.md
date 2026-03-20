# Database Schema

## ER Diagram

```
┌─────────────────────┐          ┌─────────────────────┐
│      PROJECT        │          │    TECHNOLOGY       │
├─────────────────────┤          ├─────────────────────┤
│ id (PK)             │          │ id (PK)             │
│ title               │          │ name                │
│ description         │          │ color               │
│ image_url           │          │ icon_url            │
│ project_url         │          │ created_at          │
│ github_url          │          │ updated_at          │
│ position            │          └──────────┬──────────┘
│ featured            │                     │
│ created_at          │                     │
│ updated_at          │                     │
└──────────┬──────────┘                     │
           │                                │
           │    ┌──────────────────────┐    │
           └────│ PROJECT_TECHNOLOGY   │────┘
                ├──────────────────────┤
                │ id (PK)              │
                │ project_id (FK)      │
                │ technology_id (FK)   │
                └──────────────────────┘


┌─────────────────────┐          ┌─────────────────────┐
│      SERVICE        │          │      CONTACT        │
├─────────────────────┤          ├─────────────────────┤
│ id (PK)             │          │ id (PK)             │
│ title               │          │ name                │
│ description         │          │ email               │
│ icon_url            │          │ message             │
│ position            │          │ status (enum)       │
│ created_at          │          │ created_at          │
│ updated_at          │          │ updated_at          │
└─────────────────────┘          └─────────────────────┘
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
| position | integer | Порядок сортировки |
| featured | boolean | Показывать на главной? |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

**Индексы:** position, featured

---

## Technologies

Технологии (Ruby, Rails, PostgreSQL и т.д.)

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

## ProjectTechnologies

Join-таблица (связь многие-ко-многим)

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| project_id | bigint | FK → projects.id |
| technology_id | bigint | FK → technologies.id |

**Индексы:** project_id, technology_id, [project_id, technology_id] (unique)

---

## Services

Услуги

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

## Contacts

Сообщения от посетителей

| Поле | Тип | Описание |
|------|-----|----------|
| id | bigint | Первичный ключ |
| name | string | Имя отправителя |
| email | string | Email отправителя |
| message | text | Текст сообщения |
| status | integer | 0=new, 1=read, 2=replied |
| created_at | datetime | Дата создания |
| updated_at | datetime | Дата обновления |

**Индексы:** status, created_at

---

## Связи

```
Project
  ├── has_many :project_technologies
  └── has_many :technologies, through: :project_technologies

Technology
  ├── has_many :project_technologies
  └── has_many :projects, through: :project_technologies

ProjectTechnology
  ├── belongs_to :project
  └── belongs_to :technology

Service
  └── (независимая модель)

Contact
  └── (независимая модель)
```

---

## Порядок создания

1. `rails g model Technology name:string color:string icon_url:string`
2. `rails g model Project title:string description:text image_url:string project_url:string github_url:string position:integer featured:boolean`
3. `rails g model ProjectTechnology project:references technology:references`
4. `rails g model Service title:string description:text icon_url:string position:integer`
5. `rails g model Contact name:string email:string message:text status:integer`
6. `rails db:migrate`
