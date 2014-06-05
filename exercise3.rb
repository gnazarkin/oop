class Receipt
	SALES_TAX=0.1
	IMPORT_TAX=0.05
	attr_accessor :items, :total_sales_tax

	def initialize(items=[])
		@items = items
		@total_price = 0
		@total_sales_tax = 0
	end 

	def add_item(item)
		@items << item
	end

	def get_sales_tax
		@total_sales_tax=0

		@items.each do |item|
			if item.is_imported == "imported" && item.is_exempt == "exempt"
				@total_sales_tax += item.price*IMPORT_TAX
			elsif item.is_imported == "imported" && item.is_exempt == "not exempt"
				@total_sales_tax += item.price*(IMPORT_TAX+SALES_TAX)
			elsif item.is_imported == "not imported" && item.is_exempt == "not exempt"
				@total_sales_tax += item.price*SALES_TAX
			end 
		end

		if @total_sales_tax % 0.05 != 0	
			@total_sales_tax += @total_sales_tax % 0.05
		end
		return @total_sales_tax
	end

	def total
		@total_price=0
		@items.each do |item|
			@total_price += item.quantity*item.price
		end
		@total_price += @total_sales_tax
		return @total_price.round(2)
	end

	def to_s
		@items.map { |item| item.to_s }.join("\n")
		# {}"Sales Tax: #{get_sales_tax}"
	end

	def output
		puts @items.map { |item| item.to_s }.join("\n")
		puts "Sales Tax: #{get_sales_tax}"
		puts "Total: #{total}"
	end

		
end

class Item
	attr_accessor :quantity, :is_imported, :name, :price, :is_exempt

	def initialize (quantity, is_imported, name, price, is_exempt)
		@quantity = quantity
		@is_imported = is_imported
		@name = name
		@price = price
		@is_exempt = is_exempt
	end

	def to_s
		"#{quantity} #{name}: $#{price}"
	end

	def sales_tax
		0.10
	end
end 


item1 = Item.new(1, "not imported", "book", 12.49, "exempt")
item2 = Item.new(1, "not imported", "music CD", 14.99, "not exempt")
item3 = Item.new(1, "not imported", "chocolate bar", 0.85, "exempt")


receipt1 = Receipt.new([item1, item2, item3])
receipt1.output

item6 = Item.new(1, "imported", "bottle of perfume", 27.99, "not exempt")
item7 = Item.new(1, "not imported", "bottle of perfume", 18.99, "not exempt")
item8 = Item.new(1, "not imported", "packet of headache pills", 9.75, "exempt")
item9 = Item.new(1, "imported", "box of chocolates", 11.25, "exempt")

receipt3 = Receipt.new([item6, item7, item8, item9])
receipt3.output

