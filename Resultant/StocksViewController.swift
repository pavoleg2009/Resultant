//
//  ViewController.swift
//  Resultant
//
//  Created by Oleg Pavlichenkov on 10/05/2018.
//  Copyright © 2018 Oleg Pavlichenkov. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    let apiService: ApiService = ApiServiceImpl()
    var stocks: [Stock] = []
    var asOf: String?

}

// MARK: - View Life Cycle
extension StocksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.fetchRates { (responseModel) in
            guard let fetchedStocks = responseModel.stock, let asOf = responseModel.asOf else {
                print("=== Error: no data fetched")
                return
            }
        }
    }

}


// MARK: - UITableViewDatasource
extension StocksViewController: UITableViewDataSource {
    
}
