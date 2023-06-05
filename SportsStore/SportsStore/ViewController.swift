import UIKit

final class ViewController: UIViewController {

    //MARK: - Properties

    private var products = [
        ("Kayak", "A boat for one person", "Watersports", 275.0, 10),
        ("Lifejacket", "Protective and fashionable", "Watersports", 48.95, 14),
        ("Soccer Ball", "FIFA-approved size and weight", "Soccer", 19.5, 32),
        ("Corner Flags", "Give your playing field a professional touch", "Soccer", 34.95, 1),
        ("Stadium", "Flat-packed 35,000-seat stadium", "Soccer", 79500.0, 4),
        ("Thinking Cap", "Improve your brain efficiency by 75%", "Chess", 16.0, 8),
        ("Unsteady Chair", "Secretly give your opponent a disadvantage", "Chess", 29.95, 3),
        ("Human Chess Board", "A fun game for the family", "Chess", 75.0, 2),
        ("Bling-Bling King", "Gold-plated, diamond-studded King", "Chess", 1200.0, 4)
    ]

    //MARK: - UI
    @IBOutlet weak var stockTableView: UITableView!
    @IBOutlet weak var totalStockLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
        stockTableView.dataSource = self
    }

    func displayStockTotal() {
        let stockTotal = products.reduce(0) { total, product in
            total + product.4
        }

        totalStockLabel.text = "\(stockTotal) Products in Stock"
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { fatalError() }

        let product = products[indexPath.row]

        let productCellConfiguration = ProductCellConfiguration(
            name: product.0,
            description: product.1,
            stepperValue: Double(product.4),
            stockTextFieldText: "\(product.4)"
        )

        cell.configure(with: productCellConfiguration)

        return cell
    }
}
