class Receipt

	@@sales_tax=0.1
	@@import_tax=0.05

	def initialize
		@items = []
	end

	def add(item = {})
		@items.push(item)
	end

	def rounding()

	end
end

class Item
	def i
end

receipt = Receipt.new
receipt.add(
	quantity: quantity,
	name: name,
	price: price,
	is_imported: imported,
	is_exempt: exempt
)