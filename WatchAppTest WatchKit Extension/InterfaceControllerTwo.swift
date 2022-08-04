//
//  InterfaceControllerTwo.swift
//  ISD Link Watch WatchKit Extension
//
//  Created by gbt on 2022/7/11.
//

import WatchKit
import Foundation



class InterfaceControllerTwo: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    @IBOutlet weak var listPicker: WKInterfacePicker!
    @IBOutlet weak var stackPicker: WKInterfacePicker!
    @IBOutlet weak var sequencePicker: WKInterfacePicker!
    
    let dataArr = [["title":"警告弹窗功能", "num":"3", "ID": "AlertStyleController"],
                   ["title":"手势功能", "num":"4", "ID": "GestureRecongnizerController"],
                   ["title":"中国建设银行", "num":"￥1000", "ID": ""],
                   ["title":"中国银行", "num":"￥20000", "ID": ""]]
    
    
    lazy var itemArray: [WKPickerItem] = {
        var its = [WKPickerItem]()
        let titles = ["①","②","③","④","⑤"]
        let captions = ["① is one","② is two","③ is three","④ is four","⑤ is five"]
        
        for i in 0...4{
            let item = WKPickerItem()
            item.title = titles[i]
            item.caption = captions[i]
            let string = "PB10DW-GreenArrow\(i + 1)"
            item.accessoryImage = WKImage(imageName: string)
            item.contentImage = WKImage(imageName: string)
            its.append(item)
        }
        return its
    }()

    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
        
        
        table.setNumberOfRows(dataArr.count, withRowType: "TableRowController")
        for (i, info) in dataArr.enumerated(){
            let cell: TableRowController = table.rowController(at: i) as! TableRowController
            cell.titleL.setText(info["title"])
            cell.numberL.setText(info["num"])
            cell.setColor()
        }

        
        listPicker.setItems(itemArray)
        stackPicker.setItems(itemArray)
        sequencePicker.setItems(itemArray)
        stackPicker.focus()

    }
    
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(dataArr[rowIndex], dataArr[rowIndex]["title"]!)
        pushController(withName: dataArr[rowIndex]["ID"]!, context: dataArr[rowIndex])
    }
    
//    @IBAction func listPickerSelect(_ value: Int) {
//        print(itemArray[value].title!)
//    }
    @IBAction func stackPickerSelect(_ value: Int) {
        print(itemArray[value].title!)
    }
//    @IBAction func sequencePickerSelect(_ value: Int) {
//        print(itemArray[value].title!)
//    }
    
    
    //当Picker获得焦点、失去焦点、选择保持稳定时会触发的方法
//    override func pickerDidFocus(_ picker: WKInterfacePicker) {
//        if picker == listPicker{
//            print("listPicker did focus")
//        }else if picker == stackPicker{
//            print("stackPicker did focus")
//        }else{
//            print("sequencePicker did focus")
//        }
//    }
//
//    override func pickerDidResignFocus(_ picker: WKInterfacePicker) {
//        if picker == listPicker{
//            print("listPicker did Resign focus")
//        }else if picker == stackPicker{
//            print("stackPicker did Resign focus")
//        }else{
//            print("sequencePicker did Resign focus")
//        }
//    }
//
//    override func pickerDidSettle(_ picker: WKInterfacePicker) {
//        if picker == listPicker{
//            print("listPicker did Settle")
//        }else if picker == stackPicker{
//            print("stackPicker did Settle")
//        }else{
//            print("sequencePicker did Settle")
//        }
//    }
    



    
    
    
}
