technologies_data = [
  { name: "Ruby", color: "#CC342D" },
  { name: "Rails", color: "#CC0000" },
  { name: "PostgreSQL", color: "#336791" },
  { name: "Tailwind", color: "#F7DF1E" },
  { name: "Hotwire", color: "#E34F26" },
  { name: "Kamal", color: "#1572B6" }
]

technologies_data.each do |tech|
  Technology.find_or_create_by!(tech)
end

project_data = [
  {
    title: "Ruby school",
    description: "онлайн школа",
    position: 1
  },
  {
    title: "Telegram bot",
    description: "Поиск вакансий по api с hh.ru",
    position: 2
  },
  {
    title: "PodatlivayaGlina",
    description: "Личный сайт где пощу свои идеи и достижения",
    position: 3
  }
]

project_data.each do |proj|
  Project.find_or_create_by!(proj)
end

services_data = [
  {
    title: " Разработка сайтов любой сложности",
    description: "Берусь решительно за все если заплатите. Кроме гэмблинга и бэтинга",
    position: 1
  },
  {
    title: "Разработка телеграм-ботов",
    description: "Разумные сроки и цена",
    position: 2
  },
  {
    title: "Анализ",
    description: "От идеи до готового решения",
    position: 3
  }
]

services_data.each do |service|
  Service.find_or_create_by!(service)
end


