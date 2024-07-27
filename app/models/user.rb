require 'net/http'

class User < ApplicationRecord
  has_secure_password
  has_one_attached(:user_avatar)
  validates(:user_name, presence: true, uniqueness: true)

  after_create(:generate_avatar)

  private

  def generate_avatar
    avatar_image_url = begin
      Faker::Avatar.image_url(slug: user_name, size: '300x300', format: 'png')
    rescue StandardError
      "https://robohash.org/#{user_name}.png?size:300x300"
    end

    response = Net::HTTP.get_response(URI(avatar_image_url))
    avatar_image = response.body

    user_avatar.attach(io: StringIO.new(avatar_image), filename: "#{user_name}_avatar.png", content_type: 'image/png')
  end
end
