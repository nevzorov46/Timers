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
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTimerName() {
        timerName.translatesAutoresizingMaskIntoConstraints = false
        timerName.font = UIFont(name: "Roboto-Bold", size: 30)
        timerName.textColor = .white
        
        NSLayoutConstraint.activate([
            timerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            timerName.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupTimeDuration() {
        timeDuration.translatesAutoresizingMaskIntoConstraints = false
        timeDuration.font = UIFont(name: "Roboto-Bold", size: 30)
        timeDuration.textColor = .white
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: timeDuration.trailingAnchor, constant: 10),
            timeDuration.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    private func setupCell() {
        setupTimerName()
        setupTimeDuration()
        
    }
    
}
