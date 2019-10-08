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
        timeLabel.frame = CGRect(origin: CGPoint(x: 120, y: 200), size: CGSize(width: 300, height: 100))
        timeLabel.text = ""
        timeLabel.font = timeLabel.font.withSize(50)
        self.view.addSubview(timeLabel)
    }
    
    func createTopScoreLabelView() {
        topScoreLabel.textColor = UIColor.label
        topScoreLabel.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 300, height: 50))
        topScoreLabel.text = "Top Score"
        self.view.addSubview(topScoreLabel)
    }
    
    func createLabelView() {
        
        label.textColor = UIColor.label
        label.frame = CGRect(origin: CGPoint(x: 75, y: 300), size: CGSize(width: 300, height: 50))
        label.text = "Tap The Blue Button To Start"
        self.view.addSubview(label)
        
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

