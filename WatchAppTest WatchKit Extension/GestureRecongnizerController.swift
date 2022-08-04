//
//  GestureRecongnizerController.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by gbt on 2022/7/12.
//

import WatchKit
import Foundation


class GestureRecongnizerController: WKInterfaceController {

    @IBOutlet weak var tapL: WKInterfaceLabel!
    @IBOutlet weak var longL: WKInterfaceLabel!
    @IBOutlet weak var panL: WKInterfaceLabel!
    @IBOutlet weak var swipeL: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


    @IBAction func tapAction(_ sender: Any) {
        tapL.setText("Taped!")
    }
    
    @IBAction func longAction(_ sender: Any) {
        longL.setText("Long Pressed!")
    }
    
    @IBAction func panAction(_ sender: Any) {
        panL.setText("paned!")
    }
    
    @IBAction func swipeAction(_ sender: Any) {
        swipeL.setText("Swiped!")
    }
    
    
}
