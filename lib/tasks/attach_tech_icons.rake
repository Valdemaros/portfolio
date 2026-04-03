namespace :tech do
  desc "Attach technology icons from assets/images to ActiveStorage"
  task attach_icons: :environment do
    mapping = {
      "Ruby on Rails" => "Ruby_on_Rails-Logo.wine.png",
      "Hotwire" => "hotwire.png",
      "Ruby" => "ruby.png",
      "Kamal" => "kamal.png",
      "StimulusJS" => "stimulus.png",
      "Turbo" => "turbo.png",
      "TailwindCSS" => "tailwind.png",
      "Git" => "git.png",
      "Redis" => "redis.png",
      "Slim" => "slim.png",
      "Nginx" => "nginx.png",
      "Ubuntu" => "ubuntu.png",
      "PostgreSQL" => "postgres.png",
      "ReactJS" => "react.png",
      "ReactNative" => "react.png",
      "RabbitMQ" => "rabbitmq.png",
      "MongoDB" => "mongodb.png",
      "Capistrano" => "capistrano.png"
    }

    mapping.each do |name, filename|
      tech = Technology.find_by(name: name)
      if tech
        path = Rails.root.join("app/assets/images", filename)
        if File.exist?(path)
          tech.icon.attach(io: File.open(path), filename: filename)
          puts "✅ #{name} → #{filename}"
        else
          puts "❌ Файл не найден: #{filename}"
        end
      else
        puts "⚠️ Технология не найдена: #{name}"
      end
    end

    puts "\nГотово! Закреплено: #{Technology.where.not(icon: nil).count} из
#{Technology.count}"
  end
end
