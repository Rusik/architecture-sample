import UIKit

final class MenuRootView: UIView {

    //MARK: - Types

    struct DisplayModel {
        let items: [Item]
        let title: String
        let action: (Action) -> Void
        struct Item {
            let displayModel: MenuCell.DiplayModel
            let tapAction: () -> Void
        }
        enum Action {
            case close
            case openCart
        }
    }

    //MARK: - Model
    
    private var model: DisplayModel! {
        didSet {
            updateViews()
        }
    }

    //MARK: - Views

    let tableView: UITableView = UITableView()
    let titleLabel: UILabel = UILabel()

    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bottomButton: UIButton = UIButton()
        bottomButton.backgroundColor = UIColor.systemBlue
        bottomButton.setTitle("Open cart", for: .normal)
        bottomButton.addTarget(self, action: #selector(bottomButtonDidTap), for: .touchUpInside)

        let closeButton: UIButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeDidTap), for: .touchUpInside)

        self.backgroundColor = UIColor.white

        [titleLabel, tableView, bottomButton, closeButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

            bottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            bottomButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomButton.heightAnchor.constraint(equalToConstant: 60),

            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    //MARK: - Private
    
    private func updateViews() {
        self.titleLabel.text = model.title
        self.tableView.reloadData()
    }

    //MARK: - Actions

    @objc private func bottomButtonDidTap() {
        self.model.action(.openCart)
    }

    @objc private func closeDidTap() {
        self.model.action(.close)
    }
}

//MARK: - Configurable

extension MenuRootView: Configurable {
    func configure(_ model: DisplayModel) {
        self.model = model
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuRootView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuCell
        let item = self.model.items[indexPath.row]
        cell.configure(item.displayModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model.items.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.model.items[indexPath.row]
        item.tapAction()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
