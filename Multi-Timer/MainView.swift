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
        projectTitle.font = UIFont(name: "Roboto-Black", size: 50)
        projectTitle.layer.shadowColor = UIColor.darkGray.cgColor
        projectTitle.layer.shadowOpacity = 1
        projectTitle.layer.shadowOffset = .zero
        projectTitle.layer.shadowRadius = 20
 
        NSLayoutConstraint.activate([
            projectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            projectTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    private func setupAddingTimerLabel() {
        addSubview(addingTimerLabel)
        addingTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        addingTimerLabel.text = "Adding Timer"
        addingTimerLabel.textColor = .white
        addingTimerLabel.font = UIFont(name: "Roboto-Light", size: 25)
        
        NSLayoutConstraint.activate([
            addingTimerLabel.leadingAnchor.constraint(equalTo: projectTitle.leadingAnchor),
            addingTimerLabel.topAnchor.constraint(equalTo: projectTitle.bottomAnchor, constant: 45)
        ])
    }
    
    private func setupLine() {
        addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: addingTimerLabel.bottomAnchor, constant: 8),
            line.widthAnchor.constraint(equalToConstant: frame.width),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
 
    private func setupTimerNameField() {
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textColor = .darkGray
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 4
        let borderColor = UIColor(red: 230/255, green: 37/255, blue: 130/255, alpha: 1).cgColor
        nameTextField.layer.borderColor = borderColor
        nameTextField.font = UIFont(name: "Roboto-Light", size: 18)
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Timer Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Roboto-Light", size: 18) ?? UIFont.systemFont(ofSize: 18)])
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        nameTextField.leftView = leftView
        nameTextField.leftViewMode = .always
       
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: addingTimerLabel.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 30),
            nameTextField.widthAnchor.constraint(equalToConstant: frame.width * 0.7),
            nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTimerDurationTextField() {
        addSubview(durationTextField)
        durationTextField.translatesAutoresizingMaskIntoConstraints = false
        durationTextField.textColor = .darkGray
        durationTextField.backgroundColor = .white
        durationTextField.layer.cornerRadius = 10
        durationTextField.layer.borderWidth = 4
        let borderColor = UIColor(red: 230/255, green: 37/255, blue: 130/255, alpha: 1).cgColor
        durationTextField.layer.borderColor = borderColor
        durationTextField.font = UIFont(name: "Roboto-Light", size: 18)
        durationTextField.attributedPlaceholder = NSAttributedString(string: "Time in Seconds", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont(name: "Roboto-Light", size: 18) ?? UIFont.systemFont(ofSize: 18)])
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        durationTextField.leftView = leftView
        durationTextField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            durationTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            durationTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            durationTextField.widthAnchor.constraint(equalToConstant: frame.width * 0.7),
            durationTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupAddButton() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .orange
        addButton.setTitleColor(.darkGray, for: .normal)
        //addButton.setTitle("Add Timer", for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
        addButton.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 27),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: frame.width * 0.9),
            addButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        //addButton.addTarget(self, action: #selector(RootViewController.buttonAction), for: .touchUpInside)
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 60
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            tableView.widthAnchor.constraint(equalToConstant: frame.width),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
  
    private func finalizeInit() {
        setupProjectTitle()
        setupAddingTimerLabel()
        setupLine()
        setupTimerNameField()
        setupTimerDurationTextField()
        setupAddButton()
        setupTableView()
    }
}
