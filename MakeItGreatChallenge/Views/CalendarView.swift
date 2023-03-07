import UIKit
//
//class CalendarView: UIView {
//
//    let calendar = UIView()
//
//    let sheet = SheetView()
//
//    private lazy var datePicker : UIDatePicker = {
//        var date = UIDatePicker(frame: .zero)
//        date.preferredDatePickerStyle = .inline
//        date.backgroundColor = .white
//        date.translatesAutoresizingMaskIntoConstraints = false
//        date.layer.cornerRadius = 20
//        date.layer.masksToBounds = true
//        return date
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor(named: "background")
//        applyViewCode()
//
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        datePicker.addTarget(self, action: #selector(showSheet), for: .valueChanged)
//    }
//
//    @objc func showSheet() {
//        print("lmao")
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

