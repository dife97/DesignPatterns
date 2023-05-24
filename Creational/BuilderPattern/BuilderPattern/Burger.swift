struct Burger {
    let customerName: String
    let veggieProduct: Bool
    let patties: Int
    let pickles: Bool
    let mayo: Bool
    let ketchup: Bool
    let lettuce: Bool
    let cook: Cooked
    let bacon: Bool

    enum Cooked : String {
        case rare = "Rare"
        case normal = "Normal"
        case wellDone = "Well Done"
    }

    func printDescription() {
        print("Name: \(customerName)")
        print("Veggie: \(veggieProduct)")
        print("Patties: \(patties)")
        print("Pickles: \(pickles)")
        print("Mayo: \(mayo)")
        print("Ketchup: \(ketchup)")
        print("Lettuce: \(lettuce)")
        print("Cook: \(cook.rawValue)")
        print("Bacon: \(bacon)")
    }
}

enum BurgerType {
    case standard, bigBurger, superVeggie
}

//MARK: - Default Values
class BurgerBuilder {
    
    var veggie = false
    var pickles = false
    var mayo = true
    var ketchup = true
    var lettuce = true
    var cooked: Burger.Cooked = .normal
    var patties = 2
    var bacon = true

    func setPickles(_ value: Bool) { pickles = value }
    func setMayo(_ value: Bool) { mayo = value }
    func setKetchup(_ value: Bool) { ketchup = value }
    func setLettuce(_ value: Bool) { lettuce = value }
    func setCooked(_ value: Burger.Cooked) { cooked = value }
    func addPatty(_ value: Bool) { patties = value ? 3 : 2 }

    func setVeggie(_ value: Bool) {
        veggie = value

        if value { bacon = false }
    }

    func setBacon(_ value: Bool) {
        bacon = value

        if value { veggie = false }
    }
}


//MARK: - Builder Methods
extension BurgerBuilder {

    func build(with name: String) -> Burger {
        Burger(
            customerName: name,
            veggieProduct: veggie,
            patties: patties,
            pickles: pickles,
            mayo: mayo,
            ketchup: ketchup,
            lettuce: lettuce,
            cook: cooked,
            bacon: bacon
        )
    }

    static func getBuilder(_ burgerType: BurgerType = .standard) -> BurgerBuilder {
        var builder: BurgerBuilder

        switch burgerType {
        case .standard:
            builder = BurgerBuilder()

        case .bigBurger:
            builder = BigBurgerBuilder()

        case .superVeggie:
            builder = SuperVeggieBurgerBuilder()
        }

        return builder
    }
}
