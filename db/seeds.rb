# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

Admin.find_or_create_by!(email: "AAA@AAAA") do |admin|
  admin.password = "#{ENV['SECRET_KEY']}"
end

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Pet.find_or_create_by!(name: "Maron") do |pet|
  pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  pet.kind = "猫"
  pet.sex = "オス"
  pet.user = olivia
end

Pet.find_or_create_by!(name: "Boss") do |pet|
  pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  pet.kind = "犬"
  pet.sex = "オス"
  pet.birthday = "2013/08/18"
  pet.introduction = "よろしくお願いいたします。"
  pet.user = AAA
end

Pet.find_or_create_by!(name: "Maron") do |pet|
  pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  pet.kind = "猫"
  pet.sex = "オス"
  pet.birthday = "2011/07/17"
  pet.introduction = "いっぱい寝ます"
  pet.user = AAA
end

puts "seedの実行が完了しました"