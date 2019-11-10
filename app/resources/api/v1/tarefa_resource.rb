class Api::V1::TarefaResource < JSONAPI::Resource
  attributes :title, :body, :date, :created_at, :updated_at

  relationship :user, to: :one
end