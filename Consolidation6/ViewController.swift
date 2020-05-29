//
//  ViewController.swift
//  Consolidation6
//
//  Created by Yuki Shinohara on 2020/05/28.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//  https://restcountries.eu/rest/v2/

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://restcountries.eu/rest/v2/"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
//                print(data)
                parse(json: data)
                return
            }
        }

        showError()
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let json = try? decoder.decode([Country].self, from: json) {
            countries = json
            tableView.reloadData()
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let country = countries[indexPath.row]
//        if let lang = country.languages.first?.name{
//        print(lang)
//        }
        cell.textLabel?.text = country.name//table view cell subtitleの小さい方のテキスト
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let country = countries[indexPath.row]

            vc.country = country
        navigationController?.pushViewController(vc, animated: true) //画面遷移
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

