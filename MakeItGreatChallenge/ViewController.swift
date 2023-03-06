import UIKit

class ViewController: UIViewController {

    let firstScreen = FirstScreen()

    let viewModel = CollectionViewModel()
    var drankRowIndexes: [Int] = []
    let datePicker = UIDatePicker(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
    @objc var dateSelected: Date = Date()

    override func loadView() {
        self.view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        configureCalendar()
        firstScreen.collection.delegate = self
        firstScreen.collection.dataSource = self
        
        
        self.view.addSubview(datePicker)
        datePicker.isHidden = true
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        datePicker.layer.cornerRadius = 15
        datePicker.addTarget(self, action: #selector(getter: self.dateSelected), for: UIControl.Event.valueChanged)

        datePicker.preferredDatePickerStyle = .inline

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
        navigationController?.pushViewController(CalendarViewController(), animated: true)
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
        firstScreen.stackView.caffeineLevelLabel.accessibilityLabel = "\(firstScreen.stackView.caffeineLevelLabel.text ?? "Erro") " + "de cafeína ingerida hoje".Localized()
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
        cell.beverageNameLabel.text = "\(currentBeverage.name.Localized())\n(\(currentBeverage.mililiters) ml)"
        cell.beverageImageView.image = UIImage(named: currentBeverage.image)
        cell.beverageMeasureLabel.text = "\(currentBeverage.caffeineIngested / currentBeverage.caffeineLevel) 🥛"
        cell.beverageMeasureLabel.accessibilityLabel = "\(currentBeverage.caffeineIngested / currentBeverage.caffeineLevel) copos de \(currentBeverage.name) com \(currentBeverage.mililiters) ml"
        cell.beverageMeasureLabel.accessibilityTraits.remove(.staticText)
        cell.beverageMeasureLabel.accessibilityTraits.insert(.button)
        cell.beverageNameLabel.accessibilityElementsHidden = true
        cell.beverageMeasureLabel.accessibilityHint = "Ao clicar aqui será adicionado o número de cafeína ao total do dia, passe para frente para mais opções".Localized()

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
        return CGSize(width: collectionView.frame.height * 0.95,
                      height: collectionView.frame.height)
    }
}
