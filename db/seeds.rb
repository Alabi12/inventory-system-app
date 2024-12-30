# Find or create a warehouse
warehouse = Warehouse.find_or_create_by(name: "Accra Warehouse", location: "Accra")
branch_one = Branch.find_or_create_by(name: "Accra", location: "Accra")

# Create some inventory items
Inventory.create([
  { name: "Cement Bag", quantity: 10, warehouse: warehouse, branch: branch_one },
  { name: "Roofing Nails", quantity: 5, warehouse: warehouse, branch: branch_one },
  { name: "Steel Rods", quantity: 100, warehouse: warehouse, branch: branch_one }, # Not slow-moving
  { name: "Paint Cans", quantity: 3, warehouse: warehouse, branch: branch_one }
])

puts "Inventories for #{warehouse.name} created successfully!"
