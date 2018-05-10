//
//  ViewController.swift
//  Resultant
//
//  Created by Oleg Pavlichenkov on 10/05/2018.
//  Copyright © 2018 Oleg Pavlichenkov. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    // MARK: - Outlets:
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let apiService: ApiService = ApiServiceImpl()
    var stocks: [Stock] = []
    var asOf: String?
    
    private func updateView() {
        tableView.reloadData()
    }
}

// MARK: - View Life Cycle
extension StocksViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.fetchRates { [weak self] (responseModel) in
            
            guard let sself = self else { return }
            
            guard let fetchedStocks = responseModel.stock, let asOf = responseModel.asOf else {
                print("=== Error: no data fetched")
                return
            }
            sself.stocks = fetchedStocks
            sself.asOf = asOf
            sself.updateView()
            
        }
    }

}


// MARK: - UITableViewDatasource
extension StocksViewController: UITableViewDataSource {
    
    private struct Keys {
        static let cellIdentifier = "StockCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier, for: indexPath) as? StockCell
            else { return UITableViewCell() }
        
        cell.configure(with: stocks[indexPath.row])
        return cell
    }
    
    
}
