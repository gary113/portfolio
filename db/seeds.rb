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
    social_network.social_network_position = 1
  end.social_network_icon.attach(io: File.open('app/assets/images/social_networks/linkedin.svg'), filename: 'linkedin.svg', content_type: 'image/svg+xml')

  SocialNetwork.find_or_create_by(profile_id: 1, social_network_name: 'GitHub') do |social_network|
    social_network.social_network_url = 'https://github.com/my-name'
    social_network.social_network_status = :enabled
    social_network.social_network_position = 2
  end.social_network_icon.attach(io: File.open('app/assets/images/social_networks/github.svg'), filename: 'github.svg', content_type: 'image/svg+xml')
end

ActiveRecord::Base.transaction do
  technologies = [
    { name: 'Ruby', position: 1, icon: 'ruby.svg' },
    { name: 'Sinatra', position: 2, icon: 'sinatra.svg' },
    { name: 'Rails', position: 3, icon: 'rails.svg' },
    { name: 'Javascript', position: 4, icon: 'javascript.svg' },
    { name: 'HTML5', position: 5, icon: 'html5.svg' },
    { name: 'Bootstrap', position: 6, icon: 'bootstrap.svg' },
    { name: 'Bulma', position: 7, icon: 'bulma.svg' },
    { name: 'Tailwind', position: 8, icon: 'tailwind.svg' },
    { name: 'Python', position: 9, icon: 'python.svg' },
    { name: 'Flask', position: 10, icon: 'flask.svg' },
    { name: 'Django', position: 11, icon: 'django.svg' },
    { name: 'Linux', position: 12, icon: 'linux.svg' },
    { name: 'Mysql', position: 13, icon: 'mysql.svg' },
    { name: 'Qt', position: 14, icon: 'qt.svg' },
    { name: 'Selenium', position: 15, icon: 'selenium.svg' },
    { name: 'Sqlite', position: 16, icon: 'sqlite.svg' },
    { name: 'Tcl/Tk', position: 17, icon: 'tcl-tk.svg' },
    { name: 'Terraform', position: 18, icon: 'terraform.svg' },
    { name: 'Ansible', position: 19, icon: 'ansible.svg' }
  ]

  technologies.each do |tech|
    tech_record = Technology.find_or_create_by(technology_name: tech[:name]) do |technology|
      technology.technology_position = tech[:position]
    end
    tech_record.technology_icon.attach(
      io: File.open("app/assets/images/technologies/#{tech[:icon]}"),
      filename: "#{tech[:icon]}",
      content_type: 'image/svg+xml'
    )
  end
end

ActiveRecord::Base.transaction do
  5.times do |i|
    Project.find_or_create_by(profile_id: 1, project_name: "Project #{i}") do |project|
      project.project_status = :enabled
      project.project_position = i + 1
      project.project_description = Faker::Lorem.paragraph_by_chars(number: 512)
      project.project_demo_url = "https://project#{i}.com"
      project.project_repository_url = "https://github.com/project#{i}"
      project.technologies << Technology.all.sample(rand(2..5))
    end
  end
end

User.create(user_name: 'admin', password: 'admin')
