# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(name: "Terror")
Category.create(name: "Comedia")
Category.create(name: "Anime")
Category.create(name: "Dia a dia")

User.create(name: "admin", email: "admin@admin", password: "senha1", is_admin: true)
User.create(name: "jessica", email: "jessica@struct", password: "senha1")
User.create(name: "paulo", email: "paulo@struct", password: "senha1")

Post.create(title: "post de terror", content: "conteudo de terror", user_id: 1)
PostCategory.create(post_id: 1, category_id: 1)
Post.create(title: "post de comedia e de anime", content: "conteudo de comedia e de anime", user_id: 1)
PostCategory.create(post_id: 2, category_id: 2)
PostCategory.create(post_id: 2, category_id: 3)
Post.create(title: "post do dia a dia", content: "conteudo de dia a dia", user_id: 1)
PostCategory.create(post_id: 3, category_id: 4)
Post.create(title: "post do dia a dia e de comedia", content: "conteudo de dia a dia e de comedia", user_id: 1)
PostCategory.create(post_id: 4, category_id: 2)
PostCategory.create(post_id: 4, category_id: 4)