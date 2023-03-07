import UIKit

class SheetView: UIView {

    var caffeineLevel: Int

    private let weekDays: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        label.text = Date.now.formatted(date: .numeric, time: .omitted).Localized()
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
        label.text = "123".Localized()
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

    init(frame: CGRect, _ caffeine: Int) {
        self.caffeineLevel = caffeine
        super.init(frame: frame)
        caffeineAmount.text = String(caffeine)+" ml".Localized()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(named: "background")
        self.largeContentTitle = "Consumo diário".Localized()

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
            weekDays.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            weekDays.widthAnchor.constraint(equalTo: widthAnchor),


            caffeineAmount.bottomAnchor.constraint(equalTo: lastLabel.topAnchor),
            caffeineAmount.topAnchor.constraint(equalTo: weekDays.bottomAnchor),
            caffeineAmount.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            caffeineAmount.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            caffeineAmount.centerXAnchor.constraint(equalTo: centerXAnchor),

            lastLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lastLabel.topAnchor.constraint(equalTo: caffeineAmount.bottomAnchor),
            lastLabel.heightAnchor.constraint(equalTo: caffeineAmount.heightAnchor, multiplier: 1),

            imageView.topAnchor.constraint(equalTo: lastLabel.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

    }

}















