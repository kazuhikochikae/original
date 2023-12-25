# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: '一般ユーザー',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:user] # ユーザーの役割
)

User.create!(
  name: '一般ユーザー02',
  email: 'user01@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:user] # ユーザーの役割
)
User.create!(
  name: '一般ユーザー03',
  email: 'user02@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:user] # ユーザーの役割
)

User.create!(
  name: 'キャラクター',
  email: 'character@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:vr_person] # キャラクターの役割
)

User.create!(
  name: 'キャラクター02',
  email: 'character02@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:vr_person] # キャラクターの役割
)

User.create!(
  name: 'admin_user',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: User.roles[:admin] # 管理者
)

