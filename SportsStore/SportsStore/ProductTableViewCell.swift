import UIKit

struct ProductCellConfiguration {
    let name: String
    let description: String
    let stepperValue: Double
    let stockTextFieldText: String
}

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockTextField: UITextField!

    func configure(with cell: ProductCellConfiguration) {
        nameLabel.text = cell.name
        descriptionLabel.text = cell.description
        stockStepper.value = cell.stepperValue
        stockTextField.text = cell.stockTextFieldText
    }
}
