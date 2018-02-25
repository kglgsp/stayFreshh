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

    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
    @IBOutlet weak var dateHeight: NSLayoutConstraint!
    @IBOutlet weak var PBheight: NSLayoutConstraint!
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: ExpireDatePicker.date)
        ExpireDate.text = strDate
    }
    
    func setItem(item: Item) {
        StatusFace.image = item.image
        Title.text = item.title
    }
    
    var cellExpanded:Bool = false {
        didSet {
            if !cellExpanded {
                self.dateHeight.constant = 0.0
                self.PBheight.constant = 0.0
                self.datePickerHeight.constant = 0.0
            } else {
                self.dateHeight.constant = 39.0
                self.PBheight.constant = 3.0
                self.datePickerHeight.constant = 158.0
            }
        }
    }
    
//    var datePickerExpanded:Bool = false {
//        didSet {
//            if !datePickerExpanded {
//                self.datePickerHeight.constant = 0.0
//            } else {
//                self.datePickerHeight.constant = 158.0
//            }
//        }
//    }
    
}
