class BigBurgerBuilder: BurgerBuilder {

    override init() {
        super.init()
        self.patties = 4
        self.bacon = false
    }

    override func addPatty(_ value: Bool) {
        if value { fatalError("Cannot add patty to Big Burger") }
    }
}

