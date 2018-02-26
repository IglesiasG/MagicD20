//
//  SearchCardViewController.swift
//  MagicD20
//
//  Created by Gener Iglesias on 2018-02-18.
//  Copyright © 2018 Gener Iglesias. All rights reserved.
//

import UIKit

class SearchCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let urlAutoComplete = "https://api.scryfall.com/cards/autocomplete?q="
    
    struct CardList: Decodable{
        var data: [String]
        
        init() {
            data = []
        }
    }
    
    var cardNameFull: String = ""
    
    var cardData = CardList()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        //tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardData.data.count
    }
    
    // Populate table cells using the cardListCell struct
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardListCell", for: indexPath)
        
        cell.textLabel?.text = cardData.data[indexPath.row]
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cardNameFull = cardData.data[indexPath.row]
        
    }*/
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        cardNameFull = cardData.data[indexPath.row]
    }
    
    // When search button is clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.activityIndicator.startAnimating()
        
        let searchBarEntry = searchBar.text!
        
        let searchBarEncode = searchBarEntry.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlAutoComplete + searchBarEncode!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            // decode the json results and store in struct
            do {
                let jsonResults = try JSONDecoder().decode(CardList.self, from: data)
                
                self.cardData = jsonResults
                
                // populates the table cells in main thread
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
                
                //print(jsonResults)
            } catch {
                print(error)
            }
            
        }.resume()
        
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popupCardIdentifierSegue" {
            let popup = segue.destination as! CardPopupViewController
            
            let textPass = cardNameFull
            
            popup.cardName = textPass
        }
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
