//
//  DetailViewController.swift
//  Consolidation6
//
//  Created by Yuki Shinohara on 2020/05/28.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
///UIImage isn't going to work with SVG files.


import UIKit
import WebKit

class DetailViewController: UIViewController {

    var country: Country?
    
    @IBOutlet var capital: UILabel!
    
    @IBOutlet var region: UILabel!
    
    @IBOutlet var population: UILabel!
    
    @IBOutlet var language: UILabel!
    
    @IBOutlet var flag: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let country = country else { return }
        
        title = country.name
        capital.text = country.capital
        region.text = country.region
        population.text = String(country.population)
        language.text = country.languages.first?.name
        
        let str = country.flag
        guard let flagUrl = URL(string: str) else { return }
        
        let request = URLRequest(url:flagUrl)
        flag.load(request)
    }
    
    

    
//    func getImage(pass: String, view: UIImageView) -> Void {
//        if let url = URL(string: pass) {
//            let request = URLRequest(url: url)
//            let session = URLSession.shared
//            let task = session.dataTask(with: request, completionHandler: {
//                (data:Data?, response:URLResponse?, error:Error?) in
//                if let data = data, let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        view.image = image
//                    }
//                }
//            })
//            task.resume()
//        }
//    }
}
