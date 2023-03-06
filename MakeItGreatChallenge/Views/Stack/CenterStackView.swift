import UIKit

class CenterStackView: UIView {

    let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "coffee-mug1")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let caffeineLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "0 mg"
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Quantidade de cafeína total ingerida".Localized()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor(named: "titulo")
        label.accessibilityTraits.remove(.staticText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let minorLabel: UILabel = {
        let label = UILabel()
        label.text = "Cafeína Ingerida".Localized()
        label.accessibilityElementsHidden = true
        label.isAccessibilityElement = true
        label.accessibilityTraits.remove(.staticText)
        label.textAlignment = .center
        label.textColor = UIColor(named: "subtitulo")
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        verticalStackView.addArrangedSubview(caffeineLevelLabel)
        verticalStackView.addArrangedSubview(minorLabel)
        verticalStackView.addArrangedSubview(imageView)
        addSubview(verticalStackView)
        imageView.heightAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.height * 0.50
        ).isActive = true
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.95),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


extension String {
    func Localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
