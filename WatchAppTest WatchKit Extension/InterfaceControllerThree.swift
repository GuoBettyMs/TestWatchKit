//
//  InterfaceControllerThree.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by gbt on 2022/7/11.
//

import UIKit
import WatchKit


class InterfaceControllerThree: WKInterfaceController {

    @IBOutlet weak var backGroup: WKInterfaceGroup!
    @IBOutlet weak var picker: WKInterfacePicker!
    
    @IBOutlet weak var image: WKInterfaceImage!
    private let duration: TimeInterval = 1.25
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.

        
        // 通过不断改变group的背景图片
        var pickerItems = [WKPickerItem]()

        for i in 0...100 {
            let pickerItem = WKPickerItem()
            pickerItem.title = "No.\(i)"
            pickerItems.append(pickerItem)
        }
        backGroup.setBackgroundImageNamed("activity-")
        backGroup.startAnimatingWithImages(in: NSRange(location: 1, length: 100), duration: 1.6, repeatCount: 0)

        // 遵循WKImageAnimatable协议的对象数组,数组中的对象展示动画图像
        picker.setCoordinatedAnimations([backGroup])
        picker.setItems(pickerItems)

    }

    @IBAction func planingAction() {
        animate(withDuration: duration) {
            self.image.setHorizontalAlignment(.right)
        }
        originalState()
    }
    
    @IBAction func zoomAction() {
        animate(withDuration: duration) {
            self.image.setWidth(100)
            self.image.setHeight(100)
        }
        originalState()
    }
    
    @IBAction func fadAction() {
        animate(withDuration: duration) {
            self.image.setAlpha(0.0)
        }
        originalState()
    }
    
    @IBAction func gifAction() {
        image.setImageNamed("Loading_")
        let range = NSRange(location: 1, length: 28)
        image.startAnimatingWithImages(in: range, duration: duration, repeatCount: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.image.setImageNamed("heart")
        }
    }

    private func originalState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.animate(withDuration: self.duration) {
                self.image.setHorizontalAlignment(.center)
                self.image.setWidth(50)
                self.image.setHeight(50)
                self.image.setAlpha(1.0)
            }
        }
    }

}
