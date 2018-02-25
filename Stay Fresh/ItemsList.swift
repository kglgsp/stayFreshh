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
    
    var expandedRows = Set<Int>()
    
    //things loaded when app opens
    override func viewDidLoad() {
        super.viewDidLoad()
        items = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
    
    //configure the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //grab the correct item from the array
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        cell.setItem(item: item)
        cell.cellExpanded = self.expandedRows.contains(indexPath.row)
        
        return cell
    }
    
    //when select a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        
        switch cell.cellExpanded {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        cell.cellExpanded = !cell.cellExpanded
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    //when deselect a cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        
        self.expandedRows.remove(indexPath.row)
        cell.cellExpanded = false
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144.0
        
    }
    
}






















