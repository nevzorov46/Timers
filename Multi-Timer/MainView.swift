//
//  MainView.swift
//  Multi-Timer
//
//  Created by Иван Карамазов on 03.09.2021.
//


import UIKit

class MainView: UIView {
    
    let projectTitle = UILabel()
    let addingTimerLabel = UILabel()
    let line = UIView()
    let nameTextField = UITextField()
    let durationTextField = UITextField()
    let addButton = UIButton()
    let tableView = UITableView()
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        //setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
}
