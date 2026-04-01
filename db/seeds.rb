puts "Очистка БД..."
ProjectCategory.destroy_all
ProjectTheme.destroy_all
ProjectFeature.destroy_all
ProjectTechnology.destroy_all
Project.destroy_all
Technology.destroy_all
Category.destroy_all
Theme.destroy_all
Feature.destroy_all
Service.destroy_all

puts "Создание категорий проектов..."
categories_data = [
  "Стартап", "Корпоративный сайт", "Интернет-Магазин", "PLM система",
  "CRM система", "Нестандартное решение", "Каталог", "Новостой сайт",
  "Тематическая Биржа", "Веб-Сервис", "API для мобильного приложения",
  "Посадочная страница", "ERP система", "Спортивный клуб", "Сервис IP-телефонии",
  "Интеграция с 1С", "Хаб спортивных клубов", "Онлайн конструктор",
  "Каталог товаров", "Промо сайт"
]
categories = categories_data.each_with_index.map do |name, i|
  Category.create!(name: name, position: i + 1)
end
puts "  Создано категорий: #{Category.count}"

puts "Создание тематик..."
themes_data = [
  "Getting Things Done", "Продуктивность", "Business Model Canvas", "Kanban",
  "СПУТНИК", "Сетевой график", "Критический путь", "Управление большими проектами",
  "Дорожная карта", "Стратегирование", "Notion",
  "Обработка, хранение и раздача мобильного контента", "Американский футбол",
  "Система управления требованиями", "Музыкальный лейбл", "Доставка товаров, логистика",
  "Фитнес", "Образование", "Ручная работа", "Ювелирные изделия", "Продукты питания",
  "Детские коляски, Автокресла", "Ресторанный гид", "Индивидуальные рубашки на заказ",
  "CPA (Cost Per Action) сеть"
]
themes = themes_data.each_with_index.map do |name, i|
  Theme.create!(name: name, position: i + 1)
end
puts "  Создано тематик: #{Theme.count}"

puts "Создание технологий..."
technologies_data = [
  { name: "Ruby on Rails", color: "#CC0000" },
  { name: "Hotwire", color: "#7B68EE" },
  { name: "Ruby", color: "#CC342D" },
  { name: "Kamal", color: "#1572B6" },
  { name: "StimulusJS", color: "#43B02A" },
  { name: "Turbo", color: "#7B68EE" },
  { name: "Tabler Icons", color: "#0052CC" },
  { name: "TailwindCSS", color: "#38B2AC" },
  { name: "jQuery", color: "#0769AD" },
  { name: "Ubuntu", color: "#E95420" },
  { name: "Haml", color: "#ECEAE4" },
  { name: "PostgreSQL", color: "#336791" },
  { name: "Elasticsearch", color: "#FEC514" },
  { name: "Git", color: "#F05032" },
  { name: "Redis", color: "#DC382D" },
  { name: "Slim", color: "#008000" },
  { name: "Heroku", color: "#430098" },
  { name: "ReactJS", color: "#61DAFB" },
  { name: "RabbitMQ", color: "#FF6600" },
  { name: "Memcached", color: "#00549E" },
  { name: "ffmpeg", color: "#007808" },
  { name: "MySQL", color: "#4479A1" },
  { name: "Bootstrap", color: "#7952B3" },
  { name: "PHP", color: "#777BB4" },
  { name: "Nginx", color: "#009639" },
  { name: "Jenkins", color: "#D24939" },
  { name: "ReactNative", color: "#61DAFB" },
  { name: "LESS", color: "#1D365D" },
  { name: "AWS", color: "#FF9900" },
  { name: "MongoDB", color: "#47A248" },
  { name: "NewRelic", color: "#008C99" },
  { name: "Chef", color: "#F09820" },
  { name: "Capistrano", color: "#8C1B07" },
  { name: "Airbrake", color: "#FF5C40" }
]
technologies = technologies_data.map { |data| Technology.create!(data) }
puts "  Создано технологий: #{Technology.count}"

puts "Создание возможностей..."
features_data = [
  "Стратегирование", "Формирование дорожной карты", "Электронный документ",
  "Сетевой график", "LowCode", "NoCode", "CMS", "Канбан",
  "Интеграция LATEX редактора на сайт",
  "Прием платежей на сайте через систему РБК money",
  "Взаимодействие с Twitter API - чтение, парсинг, постинг в твитер.",
  "Фотогалерея", "SEO управление содержимым",
  "Форма захвата с интеграцией в Яндекс.Директ", "Публикация новостей",
  "Кропер изображений", "Поиск по сайту",
  "Таблица с сортировкой, фильтрами и поиском",
  "Коллективное управление расписанием по ролям", "Экспорт данных в эксель",
  "2gis автозаполнение / подстановка адресов в форме",
  "Авторизация / Регистрация через SMS",
  "Якорная целевая email рассылка предложений", "Управление логистикой",
  "Купоны и скидки", "Подарочные карты",
  "Регистрация / Авторизация через социальные сети",
  "Управление / Админка / Административный интерфейс", "Социальные комментарии",
  "Онлайн конструктор", "Подтверждение по SMS",
  "Управляемая мульти-язычность (i18n)", "Пакетная загрузка и обработка файлов",
  "Взаимодействия через SMSC (SMS сервисы оператора) - оплата, отмена, загрузка.",
  "API Backend для сайтов витрин-каталогов контента с доступом по API ключу.",
  "HR и управление персоналом", "Отслеживание посылок по трекингу",
  "Автоматическая генерация Sitemap.xml", "ЧПУ - человеко понятные урлы",
  "Персонализированная SMS рассылка",
  "Автоведение новостей - экспорт контента из страницы Facebook в ленте сайта.",
  "Мобильная версия сайта", "Сбор социальных данных при регистрации через социальные сети"
]
features = features_data.each_with_index.map do |name, i|
  Feature.create!(name: name, position: i + 1)
end
puts "  Создано возможностей: #{Feature.count}"

puts "Создание услуг..."
services_data = [
  { title: "Разработка сайтов любой сложности", description: "Берусь решительно за все если заплатите", position: 1 },
  { title: "Разработка телеграм-ботов", description: "Разумные сроки и цена", position: 2 },
  { title: "Анализ", description: "От идеи до готового решения", position: 3 }
]
services_data.each { |data| Service.create!(data) }
puts "  Создано услуг: #{Service.count}"

puts "\nСоздание проектов..."
project = Project.create!(
  title: "Тестовый проект",
  description: "Описание тестового проекта",
  project_url: "#",
  featured: true,
  position: "1"
)
# Добавляем несколько категорий
project.categories << Category.find_by(name: "Стартап")
project.categories << Category.find_by(name: "Веб-Сервис")

# Добавляем несколько тематик
project.themes << Theme.find_by(name: "Продуктивность")
project.themes << Theme.find_by(name: "Образование")

# Добавляем технологии
project.technologies << Technology.find_by(name: "Ruby on Rails")
project.technologies << Technology.find_by(name: "PostgreSQL")
project.technologies << Technology.find_by(name: "TailwindCSS")

# Добавляем фичи
project.features << Feature.find_by(name: "CMS")
project.features << Feature.find_by(name: "SEO управление содержимым")
project.features << Feature.find_by(name: "Авторизация / Регистрация через SMS")


puts "\nГотово!"
puts "Категорий: #{Category.count}"
puts "Тем: #{Theme.count}"
puts "Технологий: #{Technology.count}"
puts "Возможностей: #{Feature.count}"
puts "Услуг: #{Service.count}"
puts "  Создано проектов: #{Project.count}"
