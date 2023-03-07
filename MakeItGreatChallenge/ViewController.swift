import UIKit
import SwiftUI

class ViewController: UIViewController {

    @AppStorage("didLaunchBefore") var didLaunchBefore: Bool = false

    let firstScreen = FirstScreen()

    let viewModel = CollectionViewModel()

    override func loadView() {
        self.view = firstScreen
        if (UserDefaults.standard.value(forKey: "didLaunchBefore") != nil) == false {
            viewModel.bevs = viewModel.beverages()
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
        } else {
            viewModel.loadBevs()
            viewModel.loadDrunk()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        configureCalendar()
        firstScreen.collection.delegate = self
        firstScreen.collection.dataSource = self
        reloadView()
   }

    private func configureItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrowshape.turn.up.backward.fill"),
            style: .done,
            target: self,
            action: #selector(returnToLastValue)
        )
        navigationItem.leftBarButtonItem?.accessibilityLabel = "Desfazer"
        navigationItem.leftBarButtonItem?.accessibilityHint = "Clique aqui para retirar o ultimo valor adicionado".Localized()
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    private func configureCalendar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "calendar"),
            style: .done,
            target: self,
            action: #selector(goToCalendar)
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.accessibilityHint = "Clique aqui para ver seu histórico de cafeína ingerida".Localized()
    }

    @objc func goToCalendar() {
        navigationController?.pushViewController(CalendarViewController(value: viewModel.caffeineSum()), animated: true)
    }
    @objc func returnToLastValue() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        undo()
    }

    func undo() {

        if let beverage = viewModel.drunks.last {
            if let index = viewModel.bevs.firstIndex(of: beverage) {
                viewModel.quantityDec(&viewModel.bevs[index])
                viewModel.drunks.removeLast()
                reloadView()
            }
        }
    }

    func reloadView() {
        firstScreen.collection.reloadData()
        firstScreen.stackView.caffeineLevelLabel.text = String(describing: viewModel.caffeineSum()) + " ml"
        firstScreen.stackView.caffeineLevelLabel.accessibilityLabel = "\(firstScreen.stackView.caffeineLevelLabel.text ?? "Erro") " + "de cafeína ingerida hoje".Localized()

        viewModel.saveBevs()
        viewModel.saveDrunk()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.bevs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCollectionViewCell.identifier,for: indexPath) as? BeverageCollectionViewCell else { return UICollectionViewCell() }

        let beverages = viewModel.bevs
        let currentBeverage = beverages[indexPath.row]
        cell.beverageNameLabel.text = "\(currentBeverage.name.Localized())\n(\(currentBeverage.mililiters) ml)"
        cell.beverageImageView.image = UIImage(named: currentBeverage.image)
        cell.beverageMeasureLabel.text = "\(currentBeverage.quantity) 🥛"
        cell.beverageMeasureLabel.accessibilityLabel = "\(currentBeverage.quantity) copos de \(currentBeverage.name) com \(currentBeverage.mililiters) ml"
        cell.beverageMeasureLabel.accessibilityTraits.remove(.staticText)
        cell.beverageMeasureLabel.accessibilityTraits.insert(.button)
        cell.beverageNameLabel.accessibilityElementsHidden = true
        cell.beverageMeasureLabel.accessibilityHint = "Ao clicar aqui será adicionado o número de cafeína ao total do dia, passe para frente para mais opções".Localized()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        viewModel.quantitySum(&viewModel.bevs[indexPath.row])
        viewModel.drunks.append(viewModel.bevs[indexPath.row])
        reloadView()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.95,
                      height: collectionView.frame.height)
    }
}
