require 'faker'

User.delete_all
Article.delete_all
ArticleVersion.delete_all
UserType.delete_all

UserType.create!(name: "admin")
UserType.create!(name: "contributor")

users_desired = rand(15..25)
users_entered = User.count
users_needed = users_desired - users_entered

users_needed.times do
  user = User.new(
    username: "#{Faker::Name.first_name}.#{Faker::Name.last_name}".downcase,
    password: "password",
    type: UserType.find_by(name: "contributor")
    )

  user.save(validate: false)
end

articles_desired = rand(8..10)
articles_entered = Article.count
articles_needed = articles_desired - articles_entered

articles_needed.times do
  article = Article.new(
    is_featured: (rand(0..1)),
    title: Faker::Hipster.sentence(rand(5..10)), # move this to line 43.5 when migrations have been changed
    )

  article.save(validate: false)

  versions_desired = rand(3..5)
  versions_entered = versions.count
  versions_needed = versions_desired - versions_entered

  versions_needed.times do
    article_version = ArticleVersion.new(
      content: Faker::Hipster.paragraph(rand(1..3)),
      article: article,
      author: User.all.sample,
      is_draft: rand(0..1)
      )

    article_version.save(validate: false)
  end

end
