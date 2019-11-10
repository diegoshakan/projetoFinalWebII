# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(email: 'admin@example.com', password: 'changeme', password_confirmation: 'changeme') 
admin.admin = true
admin.save!

user1 = User.create!(email: 'diego@example.com', password: 'changeme', password_confirmation: 'changeme') 

user2 = User.create!(email: 'pol@example.com', password: 'changeme', password_confirmation: 'changeme')

tarefa_user1 = Tarefa.create!(title: 'Projeto Final Web II', body: 'API funcionando', date: Date.current(), user_id: 2)

tarefa_user2 = Tarefa.create!(title: 'Concluir Projeto', body: 'Férias chegando', date: Date.current(), user_id: 3)
