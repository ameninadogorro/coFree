import UIKit

class CalendarViewController: UIViewController {

    let sheet = SheetView()

    private lazy var datePicker : UIDatePicker = {
        var date = UIDatePicker(frame: .zero)
        date.preferredDatePickerStyle = .inline
        date.backgroundColor = .white
        date.datePickerMode = .date
        date.translatesAutoresizingMaskIntoConstraints = false
        date.layer.cornerRadius = 20
        date.layer.masksToBounds = true
        return date
    }()

    override func loadView() {
        title = "Calendar"
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
        datePicker.addTarget(self, action: #selector(changed), for: .touchUpOutside)
    }

    @objc func changed() {
        self.view = sheet
    }
}

extension CalendarViewController: ViewCodeConfiguration{
    func buildHierarchy() {
        view.addSubview(datePicker)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    func configureViews() {
        view.backgroundColor = UIColor(named: "background")
        datePicker.addBorderOutside(width: 10, color: UIColor.white, cornerRadius: 20)
    }
}

extension UIView {
    func addBorderOutside(width: CGFloat , color: UIColor, cornerRadius: CGFloat) {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.clear.cgColor
        borderLayer.frame = CGRect(x: -width, y: -width, width: self.frame.size.width + width*2, height: self.frame.size.height + width*2)
        borderLayer.anchorPoint = .init(x: 0.5, y: 0.5)
        borderLayer.cornerRadius = cornerRadius
        borderLayer.borderWidth = width
        borderLayer.borderColor = color.cgColor
        self.clipsToBounds = true
        self.layer.addSublayer(borderLayer)
    }
}
