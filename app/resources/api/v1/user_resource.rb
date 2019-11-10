class Api::V1::UserResource < JSONAPI::Resource
  attributes :email, :created_at, :updated_at

  has_many :tarefas
end