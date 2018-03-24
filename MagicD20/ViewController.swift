//
//  ViewController.swift
//  MagicD20
//
//  Created by Gener Iglesias on 2017-11-24.
//  Copyright © 2017 Gener Iglesias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var P1Label: UILabel!
    @IBOutlet weak var P2Label: UILabel!
    @IBOutlet weak var P3Label: UILabel!
    @IBOutlet weak var P4Label: UILabel!
    
    @IBOutlet weak var p1DecrementButton: UIButton!
    @IBOutlet weak var p1IncrementButton: UIButton!
    @IBOutlet weak var p2IncrementButton: UIButton!
    @IBOutlet weak var p2DecrementButton: UIButton!
    @IBOutlet weak var p3DecrementButton: UIButton!
    @IBOutlet weak var p3IncrementButton: UIButton!
    @IBOutlet weak var p4IncrementButton: UIButton!
    @IBOutlet weak var p4DecrementButton: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    var initialLifeTotal = 40
    
    var p1LifeTotal = 0
    var p2LifeTotal = 0
    var p3LifeTotal = 0
    var p4LifeTotal = 0
    
    var lifeCounter: Timer!
    
    // Functions to increment players health, used by timer
    // Had to seperate functions individually because of timer
    @objc func incrementP1Health(){
        
        if p1LifeTotal == 999 {
            p1LifeTotal = 999
        } else {
            p1LifeTotal += 1
            P1Label.text = String(p1LifeTotal)
        }
        
    }
    
    @objc func decrementP1Health(){
        
        if p1LifeTotal == 0 {
            p1LifeTotal = 0
        } else {
            p1LifeTotal -= 1
            P1Label.text = String(p1LifeTotal)
        }
        
    }
    
    @objc func incrementP2Health(){
        
        if p2LifeTotal == 999 {
            p2LifeTotal = 999
        } else {
            p2LifeTotal += 1
            P2Label.text = String(p2LifeTotal)
        }
        
    }
    
    @objc func decrementP2Health(){
        
        if p2LifeTotal == 0 {
            p2LifeTotal = 0
        } else {
            p2LifeTotal -= 1
            P2Label.text = String(p2LifeTotal)
        }
        
    }
    
    @objc func incrementP3Health(){
        
        if p3LifeTotal == 999 {
            p3LifeTotal = 999
        } else {
            p3LifeTotal += 1
            P3Label.text = String(p3LifeTotal)
        }
        
    }
    
    @objc func decrementP3Health(){
        
        if p3LifeTotal == 0 {
            p3LifeTotal = 0
        } else {
            p3LifeTotal -= 1
            P3Label.text = String(p3LifeTotal)
        }
        
    }
    
    @objc func incrementP4Health(){
        
        if p4LifeTotal == 999 {
            p4LifeTotal = 999
        } else {
            p4LifeTotal += 1
            P4Label.text = String(p4LifeTotal)
        }
        
    }
    
    @objc func decrementP4Health(){
        
        if p4LifeTotal == 0 {
            p4LifeTotal = 0
        } else {
            p4LifeTotal -= 1
            P4Label.text = String(p4LifeTotal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set initial life totals
        p1LifeTotal = initialLifeTotal
        p2LifeTotal = initialLifeTotal
        p3LifeTotal = initialLifeTotal
        p4LifeTotal = initialLifeTotal
        
        P1Label.text = String(p1LifeTotal)
        P2Label.text = String(p1LifeTotal)
        P3Label.text = String(p1LifeTotal)
        P4Label.text = String(p1LifeTotal)
        
        // Rotate labels so it can face players on both ends
        P1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P3Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P2Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        P4Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        // Rotates buttons
        p1DecrementButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        p2DecrementButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        p3DecrementButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        p4DecrementButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)

        // Set round corners and border to labels
        P1Label.layer.borderWidth = 2
        P1Label.layer.cornerRadius = 15
        P1Label.layer.masksToBounds = true
        P1Label.layer.borderColor = UIColor.gray.cgColor
        
        P2Label.layer.borderWidth = 2
        P2Label.layer.cornerRadius = 15
        P2Label.layer.masksToBounds = true
        P2Label.layer.borderColor = UIColor.gray.cgColor
        
        P3Label.layer.borderWidth = 2
        P3Label.layer.cornerRadius = 15
        P3Label.layer.masksToBounds = true
        P3Label.layer.borderColor = UIColor.gray.cgColor
        
        P4Label.layer.borderWidth = 2
        P4Label.layer.cornerRadius = 15
        P4Label.layer.masksToBounds = true
        P4Label.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Resets life totals of all players to initial values
    @IBAction func resetPressed(_ sender: Any) {
        
        p1LifeTotal = initialLifeTotal
        p2LifeTotal = initialLifeTotal
        p3LifeTotal = initialLifeTotal
        p4LifeTotal = initialLifeTotal
        
        P1Label.text = String(initialLifeTotal)
        P2Label.text = String(initialLifeTotal)
        P3Label.text = String(initialLifeTotal)
        P4Label.text = String(initialLifeTotal)
    }
    
    /* Player1 Button Actions */
    @IBAction func p1IncrementPressedDown(_ sender: Any) {
        
        // Max life is set to 999 and cannot go past
        if p1LifeTotal == 999 {
            p1LifeTotal = 999
        } else {
            p1LifeTotal += 1
            P1Label.text = String(p1LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementP1Health), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func p1IncrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    @IBAction func p1DecrementPressedDown(_ sender: Any) {
        
        if p1LifeTotal == 0 {
            p1LifeTotal = 0
        } else {
            p1LifeTotal -= 1
            P1Label.text = String(p1LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(decrementP1Health), userInfo: nil, repeats: true)
    }
    
    @IBAction func p1DecrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    /* Player2 Button Actions */
    @IBAction func p2IncrementPressedDown(_ sender: Any) {
        // Max life is set to 999 and cannot go past
        if p2LifeTotal == 999 {
            p2LifeTotal = 999
        } else {
            p2LifeTotal += 1
            P2Label.text = String(p2LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementP2Health), userInfo: nil, repeats: true)
    }
    
    @IBAction func p2IncrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    @IBAction func p2DecrementPressedDown(_ sender: Any) {
        
        if p2LifeTotal == 0 {
            p2LifeTotal = 0
        } else {
            p2LifeTotal -= 1
            P2Label.text = String(p2LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(decrementP2Health), userInfo: nil, repeats: true)
    }
    @IBAction func p2DecrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    /* Player3 Button Actions */
    @IBAction func p3IncrementPressedDown(_ sender: Any) {
        
        // Max life is set to 999 and cannot go past
        if p3LifeTotal == 999 {
            p3LifeTotal = 999
        } else {
            p3LifeTotal += 1
            P3Label.text = String(p3LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementP3Health), userInfo: nil, repeats: true)
    }
    
    @IBAction func p3IncrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    @IBAction func p3DecrementPressedDown(_ sender: Any) {
        
        if p3LifeTotal == 0 {
            p3LifeTotal = 0
        } else {
            p3LifeTotal -= 1
            P3Label.text = String(p3LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(decrementP3Health), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func p3DecrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    /* Player4 Button Actions */
    @IBAction func p4IncrementPressedDown(_ sender: Any) {
        
        // Max life is set to 999 and cannot go past
        if p4LifeTotal == 999 {
            p4LifeTotal = 999
        } else {
            p4LifeTotal += 1
            P4Label.text = String(p4LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementP4Health), userInfo: nil, repeats: true)
    }
    
    @IBAction func p4IncrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    @IBAction func p4DecrementPressedDown(_ sender: Any) {
        
        if p4LifeTotal == 0 {
            p4LifeTotal = 0
        } else {
            p4LifeTotal -= 1
            P4Label.text = String(p4LifeTotal)
        }
        
        lifeCounter = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(decrementP4Health), userInfo: nil, repeats: true)
    }
    
    @IBAction func p4DecrementRelease(_ sender: Any) {
        lifeCounter.invalidate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == 
            "settingsIdentifierSegue" {
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        }
    }
}

