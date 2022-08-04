//
//  AlertStyleController.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by gbt on 2022/7/12.
//

import WatchKit
import Foundation


class AlertStyleController: WKInterfaceController {

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
    
    @IBAction func AlertStyleController() {
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        let cancelAction = WKAlertAction(title: "Cancel", style: .cancel) {
            print("Cancel")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .alert, actions: [confirmAction, denyAction, cancelAction])
    }
    
    @IBAction func sideBySideAction() {
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .sideBySideButtonsAlert, actions: [confirmAction, denyAction])
    }
    
    @IBAction func sheeetAction() {
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        let cancelAction = WKAlertAction(title: "Custom Cancel", style: .cancel) {
            print("Cancel")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .actionSheet, actions: [confirmAction, denyAction, cancelAction])
    }
    
    
}
