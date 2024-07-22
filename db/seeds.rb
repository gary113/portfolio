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
  profile.profile_greeting = '¡Hola!'
  profile.profile_home_text = 'Soy Gary<br>Desarrollador peruano'
  profile.profile_about_text = '<h2>What is Lorem Ipsum?</h2>'\
  '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'\
  '<h2>Why do we use it?</h2>'\
  '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>'
  profile.profile_email = 'mail@example.com'
  profile.profile_phone = '+51999999999'
end

SocialNetwork.find_or_create_by(profile_id: 1, social_network_type: :linkedin) do |social_network|
  social_network.social_network_url = 'https://www.linkedin.com/in/my-name/'
end

SocialNetwork.find_or_create_by(profile_id: 1, social_network_type: :github) do |social_network|
  social_network.social_network_url = 'https://github.com/my-name'
end

10.times do |i|
  Project.find_or_create_by(profile_id: 1, project_name: "Project #{i}") do |project|
    project.project_status = :enabled
    project.project_description = "Project #{i} description"
    project.project_demo_url = "https://project#{i}.com"
    project.project_repository_url = "https://github.com/project#{i}"
  end
end
