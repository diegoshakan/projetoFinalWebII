






class DatetimeValidator < ActiveModel::Validator
  def validate(record)
      # if record.date == nil
      #     record.errors[:base] << "Time and Date must be defined."
      if record.date < Date.current()
          record.errors[:base] << "A Data Não Pode Ser Anterior a Hoje!"
      end
  end
end

class Tarefa < ApplicationRecord
  belongs_to :user
  validates_length_of :title, minimum: 5, too_short: 'O Título Deve Conter Mais que 5 Caracteres!'
  validates_with DatetimeValidator
end