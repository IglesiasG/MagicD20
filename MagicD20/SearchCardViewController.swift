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
    
    var cardData = CardList()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardListCell", for: indexPath)
        
        cell.textLabel?.text = cardData.data[indexPath.row]
        
        return cell
    }
    
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
            //JSON decoding and store into struct
            do {
                let jsonResults = try JSONDecoder().decode(CardList.self, from: data)
                
                self.cardData = jsonResults
                
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
                
                print(jsonResults)
            } catch {
                print(error)
            }
            
        }.resume()
        
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
