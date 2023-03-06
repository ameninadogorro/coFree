import UIKit

class CalendarViewController: UIViewController {
    
    let calendarView: UIView = {
        var calendar = CalendarView()
        return calendar
    }()

    override func loadView() {
        title = "Calendar"
        
        super.loadView()
        self.view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
    }

}
