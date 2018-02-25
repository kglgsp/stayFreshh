//
//  ItemsList.swift
//  Stay Fresh
//
//  Created by jessie chou on 2/25/18.
//  Copyright © 2018 jessie chou. All rights reserved.
//

import UIKit

class ItemsList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //initilize an arry of items
    var items: [Item] = []
    
    var expandCell: Bool = false
    
    //things loaded when app opens
    override func viewDidLoad() {
        super.viewDidLoad()
        items = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //create an array of item
    func createArray() -> [Item] {
        var tempItems: [Item] = []
        
        let item1 = Item(image: #imageLiteral(resourceName: "good"), title: "Milk")
        let item2 = Item(image: #imageLiteral(resourceName: "bad"), title: "Egg")
        
        tempItems.append(item1)
        tempItems.append(item2)
        
        return tempItems
    }
}

extension ItemsList: UITableViewDelegate, UITableViewDataSource {
    
    //number of cells that gonna show up
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //grab the correct item from the array
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        cell.setItem(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
            if expandCell {
                expandCell = false
            } else {
                expandCell = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if expandCell {
                return 300
            } else {
                return 50
            }
        return 50
    }
}






















