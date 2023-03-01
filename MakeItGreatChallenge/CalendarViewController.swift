//
//  CalendarViewController.swift
//  MakeItGreatChallenge
//
//  Created by Israel Carvalho on 10/02/23.
//

import UIKit

class CalendarViewController: UIViewController {
    
    let calendarView: UIView = {
        var calendar = CalendarView()
//        calendar.layer.borderWidth = 20
        return calendar
    }()

    override func loadView() {
        title = "Calendar"
        super.loadView()
        self.view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }

}
