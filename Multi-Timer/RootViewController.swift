//
//  RootViewController.swift
//  Multi-Timer
//
//  Created by Иван Карамазов on 03.09.2021.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTimers: [MyTimer] = []
    var updateTimer  = Timer()
    let mainView = MainView()
    
    /*
    var durationTextField: UITextField {
        return mainView.durationTextField
    }
    
    var nameTextField: UITextField {
        return mainView.nameTextField
    }
 
    */
    
    
   // var mainView = MainView()
    let projectTitle = UILabel()
    let addingTimerLabel = UILabel()
    let line = UIView()
    let nameTextField = UITextField()
    let durationTextField = UITextField()
    let addButton = UIButton()
    
    let tableView = UITableView()
   
    
    private func removeTimer() {
        let now = Date()
        for (index,timer) in myTimers.enumerated() {
            if now > timer.finishDate() {
                myTimers.remove(at: index)
            }
        }
    }
    
    private func sortTimers() {
        myTimers.sort(by: { timer1, timer2 in
            timer1.finishDate() < timer2.finishDate()
        })
    }
    
    @objc func updateTable() {
        removeTimer()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    private func setupProjectTitle() {
        view.addSubview(projectTitle)
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
            projectTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            projectTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    private func setupAddingTimerLabel() {
        view.addSubview(addingTimerLabel)
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
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: addingTimerLabel.bottomAnchor, constant: 8),
            line.widthAnchor.constraint(equalToConstant: view.frame.width),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
 
    private func setupTimerNameField() {
        view.addSubview(nameTextField)
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
            nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7),
            nameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupTimerDurationTextField() {
        view.addSubview(durationTextField)
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
            durationTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7),
            durationTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .orange
        addButton.setTitleColor(.darkGray, for: .normal)
        addButton.setTitle("Add Timer", for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
        addButton.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 27),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9),
            addButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        addButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 60
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
    
    private func setupView() {
        setupProjectTitle()
        setupAddingTimerLabel()
        setupLine()
        setupTimerNameField()
        setupTimerDurationTextField()
        setupAddButton()
        setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTimers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TimerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "timers") as! TimerTableViewCell
        let timer = myTimers[indexPath.row]
        cell.backgroundColor = .clear
        cell.timerName.text = timer.name
        let now = Date()
        let allSeconds = Calendar.current.dateComponents([.second], from: now, to: timer.finishDate()).second ?? 0
        let seconds = allSeconds % 60
        let minutes = allSeconds / 60
        let formattedDuration = String(format: "%02i:%02i", minutes, seconds)
        cell.timeDuration.text = formattedDuration
   
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addGradient()
        //mainView.addButton.setTitle("Add Timer", for: .normal)
        //mainView.addButton.addTarget(self, action: #selector(buttonAction),  for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: "timers")
        
        updateTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
    }
    

    private func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        let colorB = UIColor(red: 255/255, green: 133/255, blue: 200/255, alpha: 100/255).cgColor
        let colorA = UIColor(red: 255/255, green: 213/255, blue: 114/255, alpha: 100/255).cgColor
        layer.colors = [colorA, colorB]
        layer.startPoint = CGPoint(x: 1.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    
    @objc func buttonAction() {
        guard let timerName = nameTextField.text else { return }
        guard let time = durationTextField.text else { return }
        guard let intTimer = Int(time) else { return }
        myTimers.append(MyTimer(name: timerName, secondsToFinish: intTimer))
    }
    
  

}
