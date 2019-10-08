//
//  ViewController.swift
//  Tests UI
//
//  Created by Alphonso Sensley II on 10/6/19.
//  Copyright © 2019 Alphonso Sensley II. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    //MARK:- Properties
    let label = UILabel()
    let clickButton = UIButton()
    let resetButton = UIButton()
    let startButton = UIButton()
    var clickCounter = Int()
    var topScoreLabel = UILabel()
    var timeLabel = UILabel()
    var topScore = Int()
    var time = 0
    var timer = Timer()
    
    
    
    //MARK:- View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createClickButton()
        createResetButton()
        createStartButton()
        createTimeLabelView()
        createLabelView()
        createTopScoreLabelView()
        
    }
    
    //MARK:- Button Methods
    @objc func buttonWasPressed(_ sender:UIButton) {
        clickCounter += 1
        var string = "The Button Was Pressed \(clickCounter) Times"
        
        if clickCounter == 1 {
            string = "The Button Was Pressed \(clickCounter) Time."
        }
        
        label.text = string
    }
    
    @objc func startButtonWasPressed(_ sender: UIButton) {
        timer.invalidate()
        clickButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    
    @objc func buttonResetWasPressed() {
        if clickCounter > topScore {
            topScore = clickCounter
        }
        clickCounter = 0
        label.text = ""
        topScoreLabel.text = "Top Score: \(topScore)"
    }
    
    
    
    //MARK:- View Update & Creation Methods
    
    @objc func updateTimeLabel() {
        time += 1
        timeLabel.text = "\(time)"
        if time == 30 {
            clickButton.isEnabled = false
            timer.invalidate()
            time = 0
            buttonResetWasPressed()
            label.text = "Hit The Start Button to Try Again!"
        }
    }
    
    func createTimeLabelView() {
        timeLabel.textColor = UIColor.label
        self.view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        timeLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.bottomAnchor, multiplier: 200).isActive = true
        timeLabel.text = ""
        timeLabel.font = timeLabel.font.withSize(50)
        
    }
    
    func createTopScoreLabelView() {
        topScoreLabel.textColor = UIColor.label
        self.view.addSubview(topScoreLabel)
        topScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        topScoreLabel.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70).isActive = true
        topScoreLabel.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        topScoreLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.bottomAnchor, multiplier: 350).isActive = true
        topScoreLabel.text = "Top Score"
        
    }
    
    func createLabelView() {
        
        label.textColor = UIColor.label
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
        label.text = "Tap The Blue Button To Start"
        
    }
    
    func createStartButton() {
        let center = CGPoint(x: 120, y: 400)
        startButton.backgroundColor = .blue
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.frame = CGRect(origin: center, size: CGSize(width: 150, height: 50))
        startButton.layer.cornerRadius = 25
        startButton.addTarget(self, action: #selector(startButtonWasPressed(_:)), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    func createResetButton() {
        let center = CGPoint(x: 120, y: 600)
        resetButton.backgroundColor = .red
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.frame = CGRect(origin: center, size: CGSize(width: 150, height: 50))
        resetButton.layer.cornerRadius = 25
        resetButton.addTarget(self, action: #selector(buttonResetWasPressed ), for: .touchUpInside)
        self.view.addSubview(resetButton)
    }
    
    
    func createClickButton() {
        let center = CGPoint(x: 120, y: 500)
        clickButton.backgroundColor = .green
        clickButton.setTitle("Tap Here", for: .normal)
        clickButton.setTitleColor(.white, for: .normal)
        clickButton.frame = CGRect(origin: center, size: CGSize(width: 150, height: 50))
        clickButton.layer.cornerRadius = 25
        clickButton.addTarget(self, action: #selector(buttonWasPressed(_:) ), for: .touchUpInside)
        self.view.addSubview(clickButton)
        
    }
    
    
}

