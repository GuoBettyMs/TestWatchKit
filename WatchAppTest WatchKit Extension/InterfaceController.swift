//
//  InterfaceController.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by Que on 2022/7/7.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet weak var eletricityL: WKInterfaceLabel!
    @IBOutlet weak var comeBackL: WKInterfaceLabel!

    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)

        let session = WCSession.default
        session.delegate = self
        session.activate()

    }
    
    // MARK: 发送信息 message （"title"、"watchMessage"）到手机，并接收手机的回调信息
    @IBAction func sendMessage() {
        guard WCSession.default.isReachable else {
            let action = WKAlertAction(title: "OK", style: .default) {
                print("OK")
            }
            presentAlert(withTitle: "Failed", message: "Apple Watch is not reachable.", preferredStyle: .alert, actions: [action])
            return
        }
        
        let date = Date()
        let message = ["title": "Apple Watch send a messge to iPhone", "watchMessage": "The Date is \(date.description)"]
        WCSession.default.sendMessage(message, replyHandler: { (replyMessage) in
            print("回调2 replyMessage = \(replyMessage)")     //replyMessage 包含"title" 和"replyContent"
            DispatchQueue.main.sync {
                self.comeBackL.setText(replyMessage["replyContent"] as? String)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if error == nil {
            print(activationState)
        } else {
            print(error!.localizedDescription)
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print(session)
    }
    
    // MARK: 设置手表的回调信息："title"、"replyContent"
    func session(_ session: WCSession, didReceiveMessage message: [String: Any], replyHandler replyHander: @escaping([String: Any]) -> Void){
        print(message)
        replyHander(["title": "received successfully", "replyContent": "This is a reply from watch"])
        DispatchQueue.main.sync {
            comeBackL.setText(message["iPhoneMessage"] as? String)
        }
    }


    
    @IBAction func InVCTwo() {
        //栈导航方式，类似UINavigationController。触碰左上角可返回
        pushController(withName: "InterfaceControllerTwo", context: "我是传的值:InterfaceControllerTwo")
        
    }
    
    @IBAction func InVCThree() {
        //modal 方式
        presentController(withName: "InterfaceControllerThree", context: "我是传的值:InterfaceControllerThree")
    }
    
    
    
//    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
//        return "我是值"
//    }

    

}
