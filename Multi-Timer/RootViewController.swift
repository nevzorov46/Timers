//
//  RootViewController.swift
//  Multi-Timer
//
//  Created by Иван Карамазов on 03.09.2021.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let mainView = MainView()
    // let scrollView = SrollView()
    var myTimers: [MyTimer] = []
    var updateTimer = Timer()
    var durationTextField: UITextField {
        return mainView.durationTextField
    }
    var nameTextField: UITextField {
        return mainView.nameTextField
    }

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
            timer1.finishDate() > timer2.finishDate()
        })
    }
    
    @objc func updateTable() {
        removeTimer()
        sortTimers()
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
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
        mainView.tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: "timers")
        mainView.addButton.setTitle("Add Timer", for: .normal)
        mainView.addButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        updateTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
    }

    @objc func buttonAction() {
        guard let timerName = nameTextField.text else { return }
        guard let time = durationTextField.text else { return }
        guard let intTimer = Int(time) else { return }
        myTimers.append(MyTimer(name: timerName, secondsToFinish: intTimer))
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainView.gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(mainView.gradient, at: 0)
    }

}
