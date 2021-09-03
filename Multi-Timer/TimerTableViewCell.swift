//
//  TimerTableViewCell.swift
//  Multi-Timer
//
//  Created by Иван Карамазов on 03.09.2021.
//

import UIKit

class TimerTableViewCell: UITableViewCell {

    var timerName = UILabel()
    var timeDuration = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(timerName)
        addSubview(timeDuration)
        setupCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTimerName() {
        timerName.translatesAutoresizingMaskIntoConstraints = false
        timerName.font = UIFont(name: "Roboto-Regular", size: 22)
        timerName.textColor = .white
        
        NSLayoutConstraint.activate([
            timerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerName.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupTimeDuration() {
        timeDuration.translatesAutoresizingMaskIntoConstraints = false
        timeDuration.font = UIFont(name: "Roboto-Regular", size: 22)
        timeDuration.textColor = .white
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: timeDuration.trailingAnchor, constant: 20),
            timeDuration.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupCells() {
        setupTimerName()
        setupTimeDuration()
    }
    
}
