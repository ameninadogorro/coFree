//
//  Calendar.swift
//  MakeItGreatChallenge
//
//  Created by Israel Carvalho on 08/02/23.
//

import UIKit

// swift

class CalendarView: UIView {
    
    let calendar = UIView()
    
    
    private lazy var datePicker : UIDatePicker = {
        var date = UIDatePicker(frame: .zero)
        date.preferredDatePickerStyle = .inline
        date.backgroundColor = .white
        date.translatesAutoresizingMaskIntoConstraints = false
//        date.layer.borderWidth  = 8
        date.layer.cornerRadius = 20
        date.layer.masksToBounds = true

//        date.frame = CGRectInset(self.frame, -2.0, -2.0)
//        date.layer.borderColor = UIColor.systemPink.cgColor
//        date.layer.borderWidth = 2.0
        
        return date
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "background")
        applyViewCode()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension CalendarView: ViewCodeConfiguration{
    func buildHierarchy() {
        addSubview(datePicker)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    func configureViews() {
        self.backgroundColor = UIColor(named: "background")
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
        self.clipsToBounds = false
        self.layer.addSublayer(borderLayer)
    }
}
