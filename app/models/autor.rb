class Autor < ApplicationRecord
	has_and_belongs_to_many :livros
	validates :nome, presence: true
end
