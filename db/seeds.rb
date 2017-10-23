# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
Comment.destroy_all
Post.create(title: "prueba titulo", body: "esto es una prueba", user_id: 1)
Comment.create(body: "prueba comentario", user_id: 1, post_id: 1)
