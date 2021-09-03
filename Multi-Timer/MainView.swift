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
    let nameTextField = UITextField()
    let durationTextField = UITextField()
    let addButton = UIButton()
    let tableView = UITableView()

    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.mainRed,
            UIColor.mainPurple
        ]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        finalizeInit()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setupProjectTitle() {
        addSubview(projectTitle)
        projectTitle.translatesAutoresizingMaskIntoConstraints = false
        projectTitle.text = "Timers"
        projectTitle.textColor = .white
        projectTitle.textAlignment = .left
        projectTitle.font = UIFont(name: "Roboto-Bold", size: 45)
        projectTitle.layer.shadowColor = UIColor.black.cgColor
        projectTitle.layer.shadowOpacity = 0.2
        projectTitle.layer.shadowOffset = .zero
        projectTitle.layer.shadowRadius = 100
 
        NSLayoutConstraint.activate([
            projectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            projectTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        ])
    }
    
    private func setupAddingTimerLabel() {
        addSubview(addingTimerLabel)
        addingTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        addingTimerLabel.text = "Create a Timer:"
        addingTimerLabel.textColor = .white
        addingTimerLabel.font = UIFont(name: "Roboto-Light", size: 28)
        
        NSLayoutConstraint.activate([
            addingTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            addingTimerLabel.topAnchor.constraint(equalTo: projectTitle.bottomAnchor, constant: 110)
        ])
    }

    private func setupTimerNameField() {
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textColor = .black
        nameTextField.backgroundColor = UIColor(white: 0.96, alpha: 0.92)
        nameTextField.layer.cornerRadius = 10
        
        nameTextField.layer.borderWidth = 3
        let borderColor = UIColor.borderColor
        nameTextField.layer.borderColor = borderColor
        nameTextField.font = UIFont(name: "Roboto-Regular", size: 20)
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Timer Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)])
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        nameTextField.leftView = leftView
        nameTextField.leftViewMode = .always
       
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            nameTextField.topAnchor.constraint(equalTo: addingTimerLabel.bottomAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 35),
            nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTimerDurationTextField() {
        addSubview(durationTextField)
        durationTextField.translatesAutoresizingMaskIntoConstraints = false
        durationTextField.textColor = .black
        durationTextField.backgroundColor = UIColor(white: 0.96, alpha: 0.92)
        durationTextField.layer.cornerRadius = 10
        durationTextField.layer.borderWidth = 3
        let borderColor = UIColor.borderColor
        durationTextField.layer.borderColor = borderColor
        durationTextField.font = UIFont(name: "Roboto-Regular", size: 20)
        durationTextField.attributedPlaceholder = NSAttributedString(string: "Time in Seconds", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)])
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        durationTextField.leftView = leftView
        durationTextField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            durationTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            durationTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            trailingAnchor.constraint(equalTo: durationTextField.trailingAnchor, constant: 35),
            durationTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupAddButton() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = UIColor(white: 0.72, alpha: 0.3)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
        addButton.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 45),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: addButton.trailingAnchor,constant: 8),
            addButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 60
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
  
    private func finalizeInit() {
        setupProjectTitle()
        setupAddingTimerLabel()
        setupTimerNameField()
        setupTimerDurationTextField()
        setupAddButton()
        setupTableView()
    }
}

extension UIColor {
   
    static var borderColor = UIColor(red: 1.0, green: 0.52, blue: 0.9, alpha: 0.35).cgColor
    static var peach = UIColor(hue: 0.09, saturation: 0.90, brightness: 0.95, alpha: 1).cgColor
    static var mainPurple = UIColor(hue: 0.7, saturation: 0.96, brightness: 0.95, alpha: 1).cgColor
    static var mainRed = UIColor(hue: 0.99, saturation: 0.7, brightness: 0.9, alpha: 1).cgColor

    }
    


