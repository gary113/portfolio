# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Profile.find_or_create_by(profile_name: 'default') do |profile|
  profile.profile_status = :active
  profile.profile_greeting = Faker::Lorem.sentence(word_count: 1)
  profile.profile_home_text = Faker::Lorem.sentence
  profile.profile_email = 'mail@example.com'
  profile.profile_phone = '+51999999999'
end

Profile.all.each do |profile|
  profile_about_text = '<h2>What is Lorem Ipsum?</h2>'\
  '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'\
  '<h2>Why do we use it?</h2>'\
  '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>'

  ActionText::RichText.create!(record_type: 'Profile',
                               record_id: profile.id,
                               name: 'profile_about_text',
                               body: profile_about_text)
end

ActiveRecord::Base.transaction do
  SocialNetwork.find_or_create_by(profile_id: 1, social_network_name: 'LinkedIn') do |social_network|
    social_network.social_network_url = 'https://www.linkedin.com/in/my-name/'
    social_network.social_network_status = :enabled
  end.social_network_icon.attach(io: File.open('app/assets/images/social_networks/linkedin.svg'), filename: 'linkedin.svg', content_type: 'image/svg+xml')

  SocialNetwork.find_or_create_by(profile_id: 1, social_network_name: 'GitHub') do |social_network|
    social_network.social_network_url = 'https://github.com/my-name'
    social_network.social_network_status = :enabled
  end.social_network_icon.attach(io: File.open('app/assets/images/social_networks/github.svg'), filename: 'github.svg', content_type: 'image/svg+xml')
end

ActiveRecord::Base.transaction do
  Technology.find_or_create_by(technology_name: 'Ruby').technology_icon.attach(
    io: File.open('app/assets/images/technologies/ruby.svg'), filename: 'ruby.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Sinatra').technology_icon.attach(
    io: File.open('app/assets/images/technologies/sinatra.svg'), filename: 'sinatra.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Rails').technology_icon.attach(
    io: File.open('app/assets/images/technologies/rails.svg'), filename: 'rails.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Javascript').technology_icon.attach(
    io: File.open('app/assets/images/technologies/javascript.svg'), filename: 'javascript.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'HTML5').technology_icon.attach(
    io: File.open('app/assets/images/technologies/html5.svg'), filename: 'html.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Bootstrap').technology_icon.attach(
    io: File.open('app/assets/images/technologies/bootstrap.svg'), filename: 'bootstrap.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Bulma').technology_icon.attach(
    io: File.open('app/assets/images/technologies/bulma.svg'), filename: 'bulma.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Tailwind').technology_icon.attach(
    io: File.open('app/assets/images/technologies/tailwind.svg'), filename: 'tailwind.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Python').technology_icon.attach(
    io: File.open('app/assets/images/technologies/python.svg'), filename: 'python.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Flask').technology_icon.attach(
    io: File.open('app/assets/images/technologies/flask.svg'), filename: 'flask.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Django').technology_icon.attach(
    io: File.open('app/assets/images/technologies/django.svg'), filename: 'django.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Linux').technology_icon.attach(
    io: File.open('app/assets/images/technologies/linux.svg'), filename: 'linux.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Mysql').technology_icon.attach(
    io: File.open('app/assets/images/technologies/mysql.svg'), filename: 'mysql.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Qt').technology_icon.attach(
    io: File.open('app/assets/images/technologies/qt.svg'), filename: 'qt.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Selenium').technology_icon.attach(
    io: File.open('app/assets/images/technologies/selenium.svg'), filename: 'selenium.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Sqlite').technology_icon.attach(
    io: File.open('app/assets/images/technologies/sqlite.svg'), filename: 'sqlite.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Tcl/Tk').technology_icon.attach(
    io: File.open('app/assets/images/technologies/tcl.svg'), filename: 'tcl.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Terraform').technology_icon.attach(
    io: File.open('app/assets/images/technologies/terraform.svg'), filename: 'terraform.svg', content_type: 'image/svg+xml'
  )
  Technology.find_or_create_by(technology_name: 'Ansible').technology_icon.attach(
    io: File.open('app/assets/images/technologies/ansible.svg'), filename: 'ansible.svg', content_type: 'image/svg+xml'
  )
end

ActiveRecord::Base.transaction do
  5.times do |i|
    Project.find_or_create_by(profile_id: 1, project_name: "Project #{i}") do |project|
      project.project_status = :enabled
      project.project_description = Faker::Lorem.paragraph_by_chars(number: 512)
      project.project_demo_url = "https://project#{i}.com"
      project.project_repository_url = "https://github.com/project#{i}"
      project.technologies << Technology.all.sample(rand(2..5))
    end
  end
end

User.create(user_name: 'admin', password: 'admin')
