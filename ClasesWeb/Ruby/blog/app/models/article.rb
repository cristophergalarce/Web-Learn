class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, {presence: {message: "El título no puede estar vacío"}, uniqueness: {message: "El título ya sido ocupado. Prueba otro."}}
	validates :body, {presence: {message: "El cuerpo no puede estar vacío"}, length: {minimum: 20, message: "En el cuerpo escribe más de 20 caracteres. Intenta explayarte un poco."}}
	before_save :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count ||= 0
	end
end
