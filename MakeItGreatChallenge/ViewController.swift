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

    override func loadView() {
        self.view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstScreen.collection.delegate = self
        firstScreen.collection.dataSource = self

    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.beverages().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCollectionViewCell.identifier,
                                                            for: indexPath) as? BeverageCollectionViewCell else { return UICollectionViewCell() }
        let beverages = viewModel.beverages()
        cell.beverageNameLabel.text = beverages[indexPath.row].name
        cell.beverageImageView.image = UIImage(named: beverages[indexPath.row].image)
        cell.beverageMeasureLabel.text = "\(beverages[indexPath.row].caffeineLevel) ml"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
        guard let cell = collectionView.cellForItem(at: indexPath) as? BeverageCollectionViewCell else { return }
        cell.increment()
        cell.beverageMeasureLabel.text = String(cell.beverageUn)
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
//        print(cell.beverageUn)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.height,
                      height: collectionView.frame.height)
    }
}
