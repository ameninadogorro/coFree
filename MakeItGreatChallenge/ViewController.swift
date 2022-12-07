//
//  ViewController.swift
//  MakeItGreatChallenge
//
//  Created by Ana Raiany Guimarães Gomes on 2022-11-03.
//

import UIKit

class ViewController: UIViewController {

    let firstScreen = FirstScreen()

    let viewModel = CollectionViewModel()
    var drankRowIndexes: [Int] = []

    override func loadView() {
        self.view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        configureCalendar()
        firstScreen.collection.delegate = self
        firstScreen.collection.dataSource = self
   }

    private func configureItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrowshape.turn.up.backward.fill"),
            style: .done,
            target: self,
            action: #selector(returnToLastValue)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    private func configureCalendar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "calendar"),
            style: .done,
            target: nil,
            action: nil
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    @objc func returnToLastValue() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        undo()
    }

    func undo() {
        if let row = drankRowIndexes.popLast() {
            viewModel.bevs[row].caffeineIngested -= 1 * viewModel.bevs[row].caffeineLevel
            reloadView()
        }
    }

    func reloadView() {
        firstScreen.collection.reloadData()
        firstScreen.stackView.caffeineLevelLabel.text = "\(viewModel.bevs.map(\.caffeineIngested).reduce(0, +)) mg"
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.beverages().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCollectionViewCell.identifier,for: indexPath) as? BeverageCollectionViewCell else { return UICollectionViewCell() }

        let beverages = viewModel.beverages()
        let currentBeverage = beverages[indexPath.row]
        cell.beverageNameLabel.text = "\(currentBeverage.name)\n(\(currentBeverage.mililiters) ml)"
        cell.beverageImageView.image = UIImage(named: currentBeverage.image)
        cell.beverageMeasureLabel.text = "\(currentBeverage.caffeineIngested / currentBeverage.caffeineLevel) 🥛"

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        viewModel.bevs[indexPath.row].caffeineIngested += viewModel.bevs[indexPath.row].caffeineLevel
        reloadView()

        drankRowIndexes.append(indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.75,
                      height: collectionView.frame.height)
    }
}
