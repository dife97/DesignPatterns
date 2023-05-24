var orderBuilder = BurgerBuilder.getBuilder(.bigBurger)

// Step 1 - Ask for name
let name = "Josefina"

// Step 2 - Is veggie meal required?
orderBuilder.setVeggie(false)

// Step 3 - Customize burger?
orderBuilder.setMayo(false)
orderBuilder.setCooked(.wellDone)

// Step 4 - Buy additional patty?
orderBuilder.addPatty(false)

let order = orderBuilder.build(with: name)
order.printDescription()
