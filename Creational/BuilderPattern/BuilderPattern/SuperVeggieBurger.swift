class SuperVeggieBurgerBuilder: BurgerBuilder {

    override init() {
        super.init()
        self.veggie = true
        self.bacon = false
    }

    override func setVeggie(_ value: Bool) {
        /// do nothing - always veggie
    }

    override func setBacon(_ value: Bool) {
        if value { fatalError("Cannot add bacon to this burger") }
    }
}
