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
        label.text = "Segunda-feira, Junho 6".Localized()
        return label

    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "coffee-mug")
        imageView.contentMode = .center
        imageView.frame.origin = CGPoint(x: 200, y: 350)
        return imageView
    }()

    let caffeineAmount: UILabel = {
        let label = UILabel()
        label.text = "253 mg"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lastLabel: UILabel = {
        let label = UILabel()
        label.text = "Cafeína Ingerida".Localized()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
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
        weekDays.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weekDays.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant:10).isActive = true


        caffeineAmount.translatesAutoresizingMaskIntoConstraints = false
        caffeineAmount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        caffeineAmount.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant:100).isActive = true

        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lastLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant:140).isActive = true



    }



}















