//
//  BeverageCollectionViewCell.swift
//  MakeItGreatChallenge
//
//  Created by Luciana Adrião on 28/11/22.
//

import UIKit

class BeverageCollectionViewCell: UICollectionViewCell {
    static let identifier = "beverageOption"

    let beverageCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 1, height: 1)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.25
        return view
    }()

    let beverageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.backgroundColor = .clear
        imageView.tintColor = .systemIndigo
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let beverageMeasureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        label.textColor = .lightGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let beverageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
//        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.textColor = .label
        label.contentMode = .scaleAspectFit
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        beverageCircleView.layer.cornerRadius = beverageCircleView.frame.height/2
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {

        beverageCircleView.addSubview(beverageImageView)
        NSLayoutConstraint.activate([

            beverageImageView.widthAnchor.constraint(equalTo: beverageCircleView.widthAnchor, multiplier: 0.3),
            beverageImageView.heightAnchor.constraint(equalTo: beverageImageView.widthAnchor),
            beverageImageView.centerXAnchor.constraint(equalTo: beverageCircleView.centerXAnchor),
            beverageImageView.centerYAnchor.constraint(equalTo: beverageCircleView.centerYAnchor)

        ])

        beverageCircleView.addSubview(beverageMeasureLabel)
        NSLayoutConstraint.activate([

            beverageMeasureLabel.centerXAnchor.constraint(equalTo: beverageCircleView.centerXAnchor),
            beverageMeasureLabel.bottomAnchor.constraint(greaterThanOrEqualTo: beverageCircleView.bottomAnchor),
            beverageMeasureLabel.topAnchor.constraint(equalTo: beverageImageView.bottomAnchor),
            beverageMeasureLabel.widthAnchor.constraint(equalTo: beverageCircleView.widthAnchor, multiplier: 0.9)
        ])

        addSubview(beverageCircleView)
        NSLayoutConstraint.activate([

            beverageCircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            beverageCircleView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            beverageCircleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65),
            beverageCircleView.widthAnchor.constraint(equalTo: beverageCircleView.heightAnchor)

        ])

        addSubview(beverageNameLabel)
        NSLayoutConstraint.activate([

            beverageNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            beverageNameLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: beverageCircleView.bottomAnchor, multiplier: 0.4),
            beverageNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            beverageNameLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor, multiplier: 0.25)
        ])
    }
}
