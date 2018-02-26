//
//  CardPopupViewController.swift
//  MagicD20
//
//  Created by Gener Iglesias on 2018-02-20.
//  Copyright © 2018 Gener Iglesias. All rights reserved.
//

import UIKit

class CardPopupViewController: UIViewController {
    
    @IBOutlet weak var cardNameLabel: UILabel?
    @IBOutlet weak var cardSetLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    
    @IBOutlet weak var cardImage: UIImageView!

    @IBOutlet weak var popupView: UIView!
    
    struct cardImages: Decodable {
        var small: String
        var normal: String
        var large: String
        var border_crop: String
        
    }
    
    struct cardInformation: Decodable{
        var image_uris: cardImages
        var type_line: String
        var oracle_text: String
        var set_name: String
        
    }
    
    var cardName: String = ""
    
    let urlNamedSearch = "https://api.scryfall.com/cards/named?fuzzy="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImage.clipsToBounds = false
        cardImage.layer.shadowColor = UIColor.black.cgColor
        cardImage.layer.shadowOpacity = 1
        cardImage.layer.shadowOffset = CGSize.zero
        cardImage.layer.shadowRadius = 10
        
        popupView.layer.cornerRadius = 15
        
        cardNameLabel?.text = cardName
        
        cardDescriptionLabel.lineBreakMode = .byWordWrapping
        
        cardDescriptionLabel.numberOfLines = 5
        
        loadImage()

        // Do any additional setup after loading the view.
    }
    
    func loadImage() {
        
        let cardNameEncode = cardName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlNamedSearch + cardNameEncode!) else { return }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
                guard let data = data else { return }
            
            do {
                let jsonResults = try JSONDecoder().decode(cardInformation.self, from: data)
                
                let urlImage = URL(string: jsonResults.image_uris.border_crop)
                if let data1 = try? Data(contentsOf: urlImage!)
                {
                    let imageNormal: UIImage = UIImage(data: data1)!

                    DispatchQueue.main.async {
                        self.cardImage.image = imageNormal
                    }
                }
                
                DispatchQueue.main.async {
                    self.cardSetLabel.text = jsonResults.set_name
                
                    self.cardDescriptionLabel.text = jsonResults.oracle_text
                }
                
                print(jsonResults)
            } catch {
                print(error)
            }
            
        }.resume()
        
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
