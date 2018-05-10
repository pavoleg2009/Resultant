//
//  StockCell.swift
//  Resultant
//
//  Created by Oleg Pavlichenkov on 10/05/2018.
//  Copyright © 2018 Oleg Pavlichenkov. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet var labels: [UILabel]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        labels.forEach{ $0.text = "" }
    }
    
    func configure(with stock: Stock) {
        nameLabel.text = stock.name
        volumeLabel.text = "Volume: \(String(stock.volume ?? -1))"
        amountLabel.text = "Amount: \(String(format: "%.2f", stock.price?.amount ?? 0.0))"
    }
}
