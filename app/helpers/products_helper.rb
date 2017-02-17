module ProductsHelper
	def form_title
		@product.new_record? ? "Ingresar Producto" : "Editar Producto"		
	end
end