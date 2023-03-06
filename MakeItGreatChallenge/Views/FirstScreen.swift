import UIKit

class FirstScreen: UIView {

    let stackView = CenterStackView()
    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(BeverageCollectionViewCell.self, forCellWithReuseIdentifier: BeverageCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "background")
        stackView.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        addSubview(collection)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupViews()
        
    }

    func setupViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),

            collection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
            collection.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collection.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collection.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
