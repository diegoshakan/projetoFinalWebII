






require 'rails_helper'

RSpec.describe Tarefa, type: :model do
    context "Testando campos da Tarefa" do
        it "Título válido?" do
            tarefa = Tarefa.new
            tarefa.title = 'Test'
                        
            expect(tarefa.valid?).to be false
        end
        it "Descrição válida?" do
            tarefa = Tarefa.new
            tarefa.body = 'Test'
                        
            expect(tarefa.valid?).to be true
        end
    end
end