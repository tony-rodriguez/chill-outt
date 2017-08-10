require 'faker'

User.delete_all
Article.delete_all
ArticleVersion.delete_all
UserType.delete_all

UserType.create!(name: "Master")
UserType.create!(name: "Admin")
UserType.create!(name: "User")


users_desired = rand(15..25)
users_entered = User.count
users_needed = users_desired - users_entered

users_needed.times do
  user = User.new(
    username: "#{Faker::Name.first_name}.#{Faker::Name.last_name}".downcase,
    password: "password",
    type: UserType.find(rand(2..3))
    )

  user.save(validate: false)
end

User.create!(username: "greme.awesome", password: "password", type_id: 1)

articles_desired = rand(8..10)
articles_entered = Article.count
articles_needed = articles_desired - articles_entered

articles_needed.times do
  article = Article.new(
    title: Faker::Hipster.sentence(rand(5..10)),
    is_featured: (rand(0..1))
    )

  article.save(validate: false)
end

versions_desired = rand(25..35)
versions_entered = ArticleVersion.count
versions_needed = versions_desired - versions_entered

versions_needed.times do
  article_version = ArticleVersion.new(
    content: Faker::Hipster.paragraph(rand(1..3)),
    article_id: rand(articles_desired)
    author_id: rand(users_desired),
    is_draft: rand(0..1)
    )

  article_version.save(validate: false)
end
