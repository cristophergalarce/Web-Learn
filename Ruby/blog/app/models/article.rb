class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, {presence: {message: "El título no puede estar vacío"}, uniqueness: {message: "El título ya sido ocupado. Prueba otro."}}
	validates :body, {presence: {message: "El cuerpo no puede estar vacío"}, length: {minimum: 20, message: "En el cuerpo escribe más de 20 caracteres. Intenta explayarte un poco."}}
	before_save :set_visits_count

	def update_visits_count
		#si no hay articles con visitas en nulo
		#esto se puede borrar
		#PERO SE DEJO EL BEFORE_SAVE Y NO _CREATE
		self.save if self.visits_count.nil?
		#cada vez que se hace :show del articulo
		#activa el actualizador de visitas
		#si el contador esta en nulo
		#se guarda
		#antes de guardar se activa before_save
		#que activa self.visits.count
		#que reinicia el contador a 0
		#si es que esta en nulo
		#si no esta en nulo, lo deja tal cual
		self.update(visits_count: self.visits_count + 1)
		#al metodo update se le manda un hash
		#con los campos que se va a actualizar
		#que el contador de visitas se actualice con
		#el valor del contador + 1
		#self. es como this.
	end

	private

	def set_visits_count
		self.visits_count ||= 0
		#reinicia el contador a 0
		#si es que esta en nulo
		#si no esta en nulo, lo deja tal cual
	end
end
