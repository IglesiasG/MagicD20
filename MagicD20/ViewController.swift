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
    
    var p1LifeTotal = 40
    var p2LifeTotal = 40
    var p3LifeTotal = 40
    var p4LifeTotal = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set initial life totals
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
        
        // Set round corner and border to refresh button
        /*refreshButton.layer.borderWidth = 2
        refreshButton.layer.cornerRadius = 15
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.borderColor = UIColor.gray.cgColor*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func p1IncrementPressed(_ sender: UIButton) {
        /*if p1IncrementButton.isSelected {
            p1IncrementButton.backgroundColor = UIColor.lightGray
            p1IncrementButton.isSelected = false
        } else {
            p1IncrementButton.backgroundColor = UIColor.clear
            p1IncrementButton.isSelected = true
        }*/

    }
    
}

