//
//  CalendarVC.swift
//  CalendarView
//
//  Created by Andrey Mosin on 07/08/2017.
//  Copyright © 2017 Andrey Mosin. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    
    @IBOutlet var weekDays: [UILabel]!
    @IBOutlet weak var gridStack: UIStackView!
    
    var days: [[WeekDayView]] = [[]]
    var weekStacks = [UIStackView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDayLabels()
        createDays()
        
        gridStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createDayLabels() {
        let stack = createStack()
        
        let monday = createDayLabel(text: "PO")
        let tuesday = createDayLabel(text: "UT")
        let wednesday = createDayLabel(text: "ST")
        let thursday = createDayLabel(text: "CT")
        let friday = createDayLabel(text: "PA")
        let saturday = createDayLabel(text: "SO")
        let sunday = createDayLabel(text: "NE")
        
        stack.addArrangedSubview(monday)
        stack.addArrangedSubview(tuesday)
        stack.addArrangedSubview(wednesday)
        stack.addArrangedSubview(thursday)
        stack.addArrangedSubview(friday)
        stack.addArrangedSubview(saturday)
        stack.addArrangedSubview(sunday)
        
        gridStack.addArrangedSubview(stack)
    }
    
    func createDayLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        
        label.textAlignment = .center
        
        label.textColor = #colorLiteral(red: 0.6156243682, green: 0.6157177687, blue: 0.6156116128, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.addConstraints([
            NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
            ])
        
        return label
    }
    
    func createDays() {
        for week in 0 ... 4 {
            
            let weekStack = createStack()
            weekStacks.append(weekStack)
            
            var newWeek = [WeekDayView]()
            
            for day in 0 ... 6 {
                let newDay = WeekDayView()
                newDay.date = Date()
                newDay.wasSelected = false
                newDay.addConstraints([
                    NSLayoutConstraint(item: newDay, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
                    NSLayoutConstraint(item: newDay, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
                    ])
                
                newDay.clipsToBounds = true
                newDay.layer.cornerRadius = 15
                
                weekStack.addArrangedSubview(newDay)
                newWeek.insert(newDay, at: day)
            }
            
            gridStack.addArrangedSubview(weekStack)
            
            days.insert(newWeek, at: week)
        }
    }
    
    func createStack() -> UIStackView {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        
        return stack
    }
}
