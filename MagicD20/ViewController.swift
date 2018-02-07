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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Rotate labels so players can read them easier
        P1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P3Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P2Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        P4Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        // Make round corners on labels
        P1ButtonLeft.layer.borderWidth = 5

        // Round button corners
        P1ButtonLeft.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

