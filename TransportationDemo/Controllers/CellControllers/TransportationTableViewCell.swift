//
//  TransportationTableViewCell.swift
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/8/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

import UIKit

class TransportationTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnilImage: UIImageView!
    
    @IBOutlet weak var imageProgress: UIActivityIndicatorView!
    
    @IBOutlet weak var departureTimeLbi: UILabel!
    
    @IBOutlet weak var arrivalTimeLbi: UILabel!
    
    
    @IBOutlet weak var durationTimeLbl: UILabel!
    
    
    @IBOutlet weak var numberOfStopImage: UIImageView!
    @IBOutlet weak var numberOfStopLbi: UILabel!
    
    
    @IBOutlet weak var priceImageView: UIImageView!
   
    @IBOutlet weak var priceLbl: UILabel!
    
    
    
    @IBOutlet weak var sepratorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
