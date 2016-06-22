class Article < ActiveRecord::Base
	validates :title, {presence: {message: "El título no puede estar en blanco"}, uniqueness: true}
	validates :body, {presence: {message: "El cuerpo no puede estar en blanco"}, length: {minimum: 20, message: "El cuerpo no puede ser menos a 20"}}
end
