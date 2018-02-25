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
    var expandedPickers = Set<Int>()
    
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
        cell.datePickerExpanded = self.expandedPickers.contains(indexPath.row)
        
        return cell
    }
    
    //when select a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
            
            switch cell.cellExpanded {
            case true:
                self.expandedRows.remove(indexPath.row)
                cell.datePickerExpanded = false
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
        self.expandedPickers.remove(indexPath.row)
        cell.cellExpanded = false
        cell.datePickerExpanded = false
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    @IBAction func selectExpireDate(_ sender: UIButton) {
        let cell = sender.superview?.superview as! CustomCell
        let indexPath = tableView.indexPath(for: cell)
        
        //let cellClick = tableView.cellForRow(at: indexPath!) as! CustomCell
        //cellClick.datePickerExpanded = !cellClick.datePickerExpanded
        
        switch cell.datePickerExpanded {
        case true:
            self.expandedPickers.remove((indexPath?.row)!)
        case false:
            self.expandedPickers.insert((indexPath?.row)!)
        }
        
        cell.datePickerExpanded = !cell.datePickerExpanded
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144.0
        
    }
    
}






















