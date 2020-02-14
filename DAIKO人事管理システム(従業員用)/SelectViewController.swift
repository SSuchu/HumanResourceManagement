//
//  SelectViewController.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/10.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //エラーメッセージ
    @IBOutlet weak var errortext: UILabel!
    
    @IBAction func decideBtn(_ sender: UIButton) {
        if self.MachineTextField.text != "Select" && self.ItemTextField.text != "Select"{
            self.performSegue(withIdentifier: "toMain", sender: nil)
        }else{
            errortext.text = "設備と整備品を選択してください"
        }
    }
    //NCMB
    let object: NCMBObject = NCMBObject(className: "UEzpMJc2f96fBmxW")
    var ItemNumbers:[Int] = []
    var dayTime:Bool = true
    var unachievedReason:String = ""
    
    //設備と製品のtextfield
    @IBOutlet weak var MachineTextField: UITextField!
    @IBOutlet weak var ItemTextField: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    var pickerView2: UIPickerView = UIPickerView()
    let list1: [String] = ["Select" ,"Machine1", "Machine2", "Machine3"]
    let list2: [String] = ["Select" ,"Item1", "Item2", "Item3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        //決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        // インプットビュー設定
        MachineTextField.inputView = pickerView
        MachineTextField.inputAccessoryView = toolbar
        ItemTextField.inputView = pickerView2
        ItemTextField.inputAccessoryView = toolbar
        
        self.view.addBackground(name: "Wolverine.png")
    }//ここまでviewDidLoad
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    //決定ボタン押下時
    @objc func done() {
        MachineTextField.endEditing(true)
        MachineTextField.text = "\(list1[pickerView.selectedRow(inComponent: 0)])"
        ItemTextField.endEditing(true)
        ItemTextField.text = "\(list2[pickerView2.selectedRow(inComponent: 0)])"
    }
    // ドラムロールの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // ドラムロールの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
            case ItemTextField.inputView:
                return list2.count
            case MachineTextField.inputView:
                return list1.count
        default:
            return 0
        }
    }
    // ドラムロールの各タイトル
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case ItemTextField.inputView:
            return list2[row]
        case MachineTextField.inputView:
            return list1[row]
        default:
            return nil
        }
    }
    // ドラムロール選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case ItemTextField.inputView:
            self.ItemTextField.text = list2[row]
        case MachineTextField.inputView:
            self.MachineTextField.text = list1[row]
        default:
            break
        }
    }
    
    //MainViewControllerへの値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != nil) {
            if segue.identifier == "toMain" {
                let nextView = segue.destination as! MainViewControler
                nextView.argStringMachine = self.MachineTextField.text!
                nextView.argStringItem = self.ItemTextField.text!
                nextView.object = self.object
            }
        }
    }
}
