class Autor < ApplicationRecord
	has_and_belongs_to_many :livros
end
