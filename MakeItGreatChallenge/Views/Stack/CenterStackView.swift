//
//  CenterView.swift
//  MakeItGreatChallenge
//
//  Created by Luciana Adrião on 28/11/22.
//

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
//        imageView.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.2).cgColor
//        imageView.layer.borderWidth = 5.0
        imageView.image = UIImage(named: "coffee-mug")
        imageView.contentMode = .bottom
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let caffeineLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "0 mg"
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Quantidade de cafeína total ingerida"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.accessibilityTraits.remove(.staticText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let minorLabel: UILabel = {
        let label = UILabel()
        label.text = "caffeine ingested"
        label.accessibilityElementsHidden = true
        label.isAccessibilityElement = true
//        label.accessibilityLabel = "Quantidade de cafeína total ingerida durante o dia"
        label.accessibilityTraits.remove(.staticText)
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
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
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.95),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
