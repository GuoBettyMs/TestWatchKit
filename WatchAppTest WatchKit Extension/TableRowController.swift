//
//  TableRowController.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by gbt on 2022/7/11.
//

import WatchKit


//类似于UITableViewCell
class TableRowController: NSObject {

    @IBOutlet weak var numberL: WKInterfaceLabel!
    @IBOutlet weak var titleL: WKInterfaceLabel!
    
    

    func setColor(){
        numberL.setTextColor(.gray)
    }

    
}
