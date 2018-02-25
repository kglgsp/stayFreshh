//
//  CustomCell.swift
//  Stay Fresh
//
//  Created by jessie chou on 2/25/18.
//  Copyright © 2018 jessie chou. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var StatusFace: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var ExpireDatePicker: UIDatePicker!
    @IBOutlet weak var ExpireDate: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    func setItem(item: Item) {
        
        StatusFace.image = item.image
        Title.text = item.title
        
    }
    
    
}
