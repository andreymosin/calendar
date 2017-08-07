//
//  WeekDayView.swift
//  CalendarView
//
//  Created by Andrey Mosin on 07/08/2017.
//  Copyright © 2017 Andrey Mosin. All rights reserved.
//

import UIKit

class WeekDayView: UIButton {
    
    var date: Date? {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd"
            self.setTitle(dateFormatter.string(from: date!), for: .normal)
        }
    }
    
    var wasSelected: Bool = false {
        didSet {
            if wasSelected {
                backgroundColor = #colorLiteral(red: 0.2326357663, green: 0.7650908232, blue: 0.9326303601, alpha: 1)
                titleLabel?.textColor = .white
            } else {
                backgroundColor = #colorLiteral(red: 0.9253996015, green: 0.9255362153, blue: 0.9253809452, alpha: 1)
                titleLabel?.textColor = #colorLiteral(red: 0.2980065644, green: 0.2980558276, blue: 0.2979998589, alpha: 1)
            }
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        self.addTarget(self, action: #selector(WeekDayView.selectMofo), for: .touchUpInside)
    }
    
    func selectMofo() {
        wasSelected = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
