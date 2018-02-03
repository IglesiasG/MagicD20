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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Rotate labels so players can read them easier
        P1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P3Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        P2Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        P4Label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

