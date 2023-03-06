//
//  SheetViewController.swift
//  MakeItGreatChallenge
//
//  Created by Lunes on 13/02/23.
//

import UIKit

class SheetViewController: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "background")
        navigationItem.title = "Consumo diário".Localized()
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.76, green: 0.71, blue: 0.66, alpha: 1.00)

        view.addSubview(weekDays)
        view.addSubview(caffeineAmount)
        view.addSubview(lastLabel)
        view.addSubview(imageView)

        weekDays.translatesAutoresizingMaskIntoConstraints = false
        caffeineAmount.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            weekDays.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weekDays.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weekDays.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            weekDays.widthAnchor.constraint(equalTo: view.widthAnchor),


            caffeineAmount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caffeineAmount.topAnchor.constraint(equalTo: weekDays.bottomAnchor),

            lastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastLabel.topAnchor.constraint(equalTo: caffeineAmount.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: lastLabel.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])




    }



}















