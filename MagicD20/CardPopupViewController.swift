//
//  CardPopupViewController.swift
//  MagicD20
//
//  Created by Gener Iglesias on 2018-02-20.
//  Copyright © 2018 Gener Iglesias. All rights reserved.
//

import UIKit

class CardPopupViewController: UIViewController {
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonPressedDown(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
