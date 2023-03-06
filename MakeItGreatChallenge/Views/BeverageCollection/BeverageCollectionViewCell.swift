import UIKit

class BeverageCollectionViewCell: UICollectionViewCell {
    static let identifier = "beverageOption"

    let beverageRetangleView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 107, height: 100)
        view.backgroundColor = UIColor(named: "collectionback")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 1, height: 1)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.25
        view.clipsToBounds = true
        return view
    }()

    let beverageCircleView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 49, height: 49)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let beverageMinorRetangleView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 41, height: 21)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let beverageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.backgroundColor = .clear
        imageView.tintColor = .systemIndigo
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let beverageMeasureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let beverageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "name".Localized()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 3
        label.textAlignment = .left
        label.textColor = .label
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        beverageRetangleView.layer.cornerRadius = 10
        beverageMinorRetangleView.layer.cornerRadius = 5
        beverageCircleView.layer.cornerRadius = 33
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {

        addSubview(beverageRetangleView)
        NSLayoutConstraint.activate([

            beverageRetangleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            beverageRetangleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            beverageRetangleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            beverageRetangleView.widthAnchor.constraint(equalTo: beverageRetangleView.heightAnchor, constant: 20)

        ])

        beverageRetangleView.addSubview(beverageCircleView)

        NSLayoutConstraint.activate([

            beverageCircleView.widthAnchor.constraint(equalTo: beverageRetangleView.widthAnchor, multiplier: 0.5),
            beverageCircleView.heightAnchor.constraint(equalTo: beverageCircleView.widthAnchor),
            beverageCircleView.centerXAnchor.constraint(equalTo: beverageRetangleView.trailingAnchor,constant: -15),
            beverageCircleView.centerYAnchor.constraint(equalTo: beverageRetangleView.bottomAnchor, constant: -25)

        ])

        beverageCircleView.addSubview(beverageImageView)

        NSLayoutConstraint.activate([
            beverageImageView.centerXAnchor.constraint(equalTo: beverageCircleView.centerXAnchor, constant: 2),
            beverageImageView.centerYAnchor.constraint(equalTo: beverageCircleView.centerYAnchor),
            beverageImageView.heightAnchor.constraint(equalTo: beverageCircleView.heightAnchor, multiplier: 0.75),
            beverageImageView.widthAnchor.constraint(equalTo: beverageCircleView.widthAnchor, multiplier: 0.75)
        ])

        beverageRetangleView.addSubview(beverageNameLabel)

        NSLayoutConstraint.activate([
            beverageNameLabel.topAnchor.constraint(equalTo: beverageRetangleView.topAnchor, constant: 10),
            beverageNameLabel.leadingAnchor.constraint(equalTo: beverageRetangleView.leadingAnchor, constant: 10),
            beverageNameLabel.trailingAnchor.constraint(equalTo: beverageRetangleView.trailingAnchor, constant: -10)
        ])

        beverageRetangleView.addSubview(beverageMinorRetangleView)

        NSLayoutConstraint.activate([
            beverageMinorRetangleView.topAnchor.constraint(equalTo: beverageNameLabel.bottomAnchor, constant: 20),
            beverageMinorRetangleView.leadingAnchor.constraint(equalTo: beverageRetangleView.leadingAnchor, constant: 10),
            beverageMinorRetangleView.trailingAnchor.constraint(equalTo: beverageCircleView.leadingAnchor, constant: -12),
            beverageMinorRetangleView.bottomAnchor.constraint(equalTo: beverageRetangleView.bottomAnchor, constant: -10)
        ])

        beverageMinorRetangleView.addSubview(beverageMeasureLabel)

        NSLayoutConstraint.activate([
            beverageMeasureLabel.centerXAnchor.constraint(equalTo: beverageMinorRetangleView.centerXAnchor),
            beverageMeasureLabel.centerYAnchor.constraint(equalTo: beverageMinorRetangleView.centerYAnchor)
        ])

    }
}
