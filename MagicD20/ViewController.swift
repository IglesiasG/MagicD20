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
    
    @IBOutlet weak var P1ButtonLeft: UIButton!
    @IBOutlet weak var P1ButtonRight: UIButton!
    @IBOutlet weak var P2ButtonLeft: UIButton!
    @IBOutlet weak var P2ButtonRight: UIButton!
    @IBOutlet weak var P3ButtonLeft: UIButton!
    @IBOutlet weak var P3ButtonRight: UIButton!
    @IBOutlet weak var P4ButtonLeft: UIButton!
    @IBOutlet weak var P4ButtonRight: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Rotate labels so players can read them easier
        P1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P3Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P2Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        P4Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)

        // Add round corners and border to labels
        P1Label.layer.borderWidth = 2
        P1Label.layer.cornerRadius = 15
        P1Label.layer.borderColor = UIColor.gray.cgColor
        
        P2Label.layer.borderWidth = 2
        P2Label.layer.cornerRadius = 15
        P2Label.layer.borderColor = UIColor.gray.cgColor
        
        P3Label.layer.borderWidth = 2
        P3Label.layer.cornerRadius = 15
        P3Label.layer.borderColor = UIColor.gray.cgColor
        
        P4Label.layer.borderWidth = 2
        P4Label.layer.cornerRadius = 15
        P4Label.layer.borderColor = UIColor.gray.cgColor
        
        //
        refreshButton.layer.borderWidth = 2
        refreshButton.layer.cornerRadius = 15
        refreshButton.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

