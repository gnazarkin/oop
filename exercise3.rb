class Receipt

	@@sales_tax=0.1
	@@import_tax=0.05

	def initialize
		@items = []
	end

	def add_item()
		@items.push(quantity: quantity, name: name, price: price, is_imported: imported, is_exempt: exempt)
	end

