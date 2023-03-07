import UIKit

class SheetView: UIView {

    private let weekDays: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.text = "Segunda-feira, Junho 6".Localized()
        return label

    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coffee-mug1")
        imageView.contentMode = .center
        imageView.frame.origin = CGPoint(x: 200, y: 350)
        return imageView
    }()

    let caffeineAmount: UILabel = {
        let label = UILabel()
        label.text = "253 mg"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lastLabel: UILabel = {
        let label = UILabel()
        label.text = "Cafeína Ingerida".Localized()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(named: "background")
        self.largeContentTitle = "Consumo diário".Localized()
//        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.76, green: 0.71, blue: 0.66, alpha: 1.00)

        addSubview(weekDays)
        addSubview(caffeineAmount)
        addSubview(lastLabel)
        addSubview(imageView)

        weekDays.translatesAutoresizingMaskIntoConstraints = false
        caffeineAmount.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            weekDays.centerXAnchor.constraint(equalTo: centerXAnchor),
            weekDays.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weekDays.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            weekDays.widthAnchor.constraint(equalTo: widthAnchor),


            caffeineAmount.centerXAnchor.constraint(equalTo: centerXAnchor),
            caffeineAmount.topAnchor.constraint(equalTo: weekDays.bottomAnchor),

            lastLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lastLabel.topAnchor.constraint(equalTo: caffeineAmount.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: lastLabel.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])




    }



}















