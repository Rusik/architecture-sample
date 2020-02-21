import UIKit

final class MenuCell: UITableViewCell {
    struct DiplayModel {
        var name: String
        var price: Int
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

extension MenuCell: Configurable {
    func configure(_ model: DiplayModel) {
        self.nameLabel.text = model.name
        self.priceLabel.text = "\(model.price) ₽"
    }
}
