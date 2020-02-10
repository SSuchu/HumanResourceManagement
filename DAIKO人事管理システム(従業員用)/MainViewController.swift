//
//  MainViewController.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/04.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

enum BorderPosition {
    case top
    case left
    case right
    case bottom
}

//UIViewで特定の場所でborderをつける拡張
extension UIView {
    /// 特定の場所にborderをつける
    ///
    /// - Parameters:
    ///   - width: 線の幅
    ///   - color: 線の色
    ///   - position: 上下左右どこにborderをつけるか
    func addBorder(width: CGFloat, color: UIColor, position: BorderPosition) {

        let border = CALayer()

        switch position {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .right:
            print(self.frame.width)

            border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
            border.backgroundColor = color.cgColor
            self.layer.addSublayer(border)
        }
    }
}


class MainViewControler: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    let object: NCMBObject = NCMBObject(className: "UEzpMJc2f96fBmxW")
 
    //継承追加注意
    @IBOutlet weak var dekidaka: UILabel!
    override func viewDidLayoutSubviews() {
        self.dekidaka.addBorder(width: 0.8, color: UIColor.black, position: .right)
        self.dekidaka.addBorder(width: 0.8, color: UIColor.black, position: .bottom)
        self.dekidaka.addBorder(width: 0.8, color: UIColor.black, position: .top)
        self.dekidaka.addBorder(width: 0.8, color: UIColor.black, position: .left)
    }
    
    //従業員出来高
    struct employee {
        var name:String
        var to9:Int
        var to10:Int
        var to11:Int
        var to12:Int
        var to14:Int
        var to15:Int
        var to16:Int
        var to17:Int
        var to18:Int
        var to19:Int
        var to20:Int
        var total:Int
    }
    var employees = [employee]()
    @IBOutlet weak var tableView: UITableView!
    
    //画面遷移
    @IBAction func LogoutBtn(_ sender: UIButton){
        self.performSegue(withIdentifier: "toLoginFromMain", sender: nil)
    }
    
    //↓設備と整備品のPickerView作成
    //設備
    @IBOutlet weak var MachineTextField: UITextField!
    //製品名
    @IBOutlet weak var ItemTextField: UITextField!
    //日付
    @IBOutlet weak var Days: UILabel!
    //生産数
    @IBOutlet weak var to9TextField: UITextField!
    @IBOutlet weak var to10TextField: UITextField!
    @IBOutlet weak var to11TextField: UITextField!
    @IBOutlet weak var to12TextField: UITextField!
    @IBOutlet weak var to14TextField: UITextField!
    @IBOutlet weak var to15TextField: UITextField!
    @IBOutlet weak var to16TextField: UITextField!
    @IBOutlet weak var to17TextField: UITextField!
    @IBOutlet weak var to18TextField: UITextField!
    @IBOutlet weak var to19TextField: UITextField!
    @IBOutlet weak var to20TextField: UITextField!
    @IBOutlet weak var total: Label_Custom!
    
    
    
    var pickerView: UIPickerView = UIPickerView()
    var pickerView2: UIPickerView = UIPickerView()
    var pickerViewTo9: UIPickerView = UIPickerView()
    var pickerViewTo10: UIPickerView = UIPickerView()
    var pickerViewTo11: UIPickerView = UIPickerView()
    var pickerViewTo12: UIPickerView = UIPickerView()
    var pickerViewTo14: UIPickerView = UIPickerView()
    var pickerViewTo15: UIPickerView = UIPickerView()
    var pickerViewTo16: UIPickerView = UIPickerView()
    var pickerViewTo17: UIPickerView = UIPickerView()
    var pickerViewTo18: UIPickerView = UIPickerView()
    var pickerViewTo19: UIPickerView = UIPickerView()
    var pickerViewTo20: UIPickerView = UIPickerView()
    
    
    var arrForDisplay:[String] = [String]()
    let list1: [String] = ["Select" ,"Machine1", "Machine2", "Machine3"]
    let list2: [String] = ["Select" ,"Item1", "Item2", "Item3"]
    let listItem: [String] = ["0","1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        pickerViewTo9.delegate = self
        pickerViewTo9.dataSource = self
        pickerViewTo10.delegate = self
        pickerViewTo10.dataSource = self
        pickerViewTo11.delegate = self
        pickerViewTo11.dataSource = self
        pickerViewTo12.delegate = self
        pickerViewTo12.dataSource = self
        pickerViewTo14.delegate = self
        pickerViewTo14.dataSource = self
        pickerViewTo15.delegate = self
        pickerViewTo15.dataSource = self
        pickerViewTo16.delegate = self
        pickerViewTo16.dataSource = self
        pickerViewTo17.delegate = self
        pickerViewTo17.dataSource = self
        pickerViewTo18.delegate = self
        pickerViewTo18.dataSource = self
        pickerViewTo19.delegate = self
        pickerViewTo19.dataSource = self
        pickerViewTo20.delegate = self
        pickerViewTo20.dataSource = self
       // pickerView.showsSelectionIndicator = true
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
        to9TextField.inputView = pickerViewTo9
        to9TextField.inputAccessoryView = toolbar
        to10TextField.inputView = pickerViewTo10
        to10TextField.inputAccessoryView = toolbar
        to11TextField.inputView = pickerViewTo11
        to11TextField.inputAccessoryView = toolbar
        to12TextField.inputView = pickerViewTo12
        to12TextField.inputAccessoryView = toolbar
        to14TextField.inputView = pickerViewTo14
        to14TextField.inputAccessoryView = toolbar
        to15TextField.inputView = pickerViewTo15
        to15TextField.inputAccessoryView = toolbar
        to16TextField.inputView = pickerViewTo16
        to16TextField.inputAccessoryView = toolbar
        to17TextField.inputView = pickerViewTo17
        to17TextField.inputAccessoryView = toolbar
        to18TextField.inputView = pickerViewTo18
        to18TextField.inputAccessoryView = toolbar
        to19TextField.inputView = pickerViewTo19
        to19TextField.inputAccessoryView = toolbar
        to20TextField.inputView = pickerViewTo20
        to20TextField.inputAccessoryView = toolbar
        //total計算
        var numTo9 = 0
        var numTo10 = 0
        var numTo11 = 0
        var numTo12 = 0
        var numTo14 = 0
        var numTo15 = 0
        var numTo16 = 0
        var numTo17 = 0
        var numTo18 = 0
        var numTo19 = 0
        var numTo20 = 0
        if Int(self.to9TextField.text!) != nil && Int(self.to10TextField.text!) != nil {
            numTo9 = Int(self.to9TextField.text!)!
            numTo10 = Int(self.to10TextField.text!)!
            numTo11 = Int(self.to11TextField.text!)!
            numTo12 = Int(self.to12TextField.text!)!
            numTo14 = Int(self.to14TextField.text!)!
            numTo15 = Int(self.to15TextField.text!)!
            numTo16 = Int(self.to16TextField.text!)!
            numTo17 = Int(self.to17TextField.text!)!
            numTo18 = Int(self.to18TextField.text!)!
            numTo19 = Int(self.to19TextField.text!)!
            numTo20 = Int(self.to20TextField.text!)!
        }
        total.text = String(numTo9+numTo10+numTo11+numTo12+numTo14+numTo15+numTo16+numTo17+numTo18+numTo19+numTo20)
        
        
        //ユーザー名表示
        getUserName()
        
        //月日の表示
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        //formatter.timeStyle = .short
        print(formatter.string(from: date))
        Days.text = formatter.string(from: date)
        
        //tableViewCell追加
        employees.append(employee(name: "ソラ", to9: 15, to10: 15, to11: 15, to12: 16, to14: 14, to15: 17, to16: 15, to17: 15, to18: 14, to19: 17, to20: 15, total: 100))
        employees.append(employee(name: "John", to9: 16, to10: 15, to11: 15, to12: 16, to14: 14, to15: 17, to16: 15, to17: 15, to18: 14, to19: 17, to20: 15, total: 100))
        
        //ncmbに登録
        let ItemNumbers = [numTo9, numTo10, numTo11, numTo12, numTo14, numTo15, numTo16, numTo17, numTo18, numTo19, numTo20]
        object["numberOfProducts"] = ItemNumbers
        object.saveInBackground(callback: {result in
            switch result{
                case .success:
                    
                    print("保存に成功しました")
                case let .failure(error):
                    
                    print("保存に失敗しました: \(error)")
            }
        })
        
        
        
    }//ここまでViewDidLoad
    
    
    
    //セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }                               //DelegateとDataSourceをstoryboard上でviewcontrollerに繋げるの忘れない
    //セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        let Name = cell.viewWithTag(1) as! UILabel
        let To9 = cell.viewWithTag(2) as! UILabel
        let To10 = cell.viewWithTag(3) as! UILabel
        let To11 = cell.viewWithTag(4) as! UILabel
        let To12 = cell.viewWithTag(5) as! UILabel
        let To14 = cell.viewWithTag(6) as! UILabel
        let To15 = cell.viewWithTag(7) as! UILabel
        let To16 = cell.viewWithTag(8) as! UILabel
        let To17 = cell.viewWithTag(9) as! UILabel
        let To18 = cell.viewWithTag(10) as! UILabel
        let To19 = cell.viewWithTag(11) as! UILabel
        let To20 = cell.viewWithTag(12) as! UILabel
        let Total = cell.viewWithTag(13) as! UILabel
        
        Name.text = String(employees[indexPath.row].name)
        To9.text = String(employees[indexPath.row].to9)
        To10.text = String(employees[indexPath.row].to10)
        To11.text = String(employees[indexPath.row].to11)
        To12.text = String(employees[indexPath.row].to12)
        To14.text = String(employees[indexPath.row].to14)
        To15.text = String(employees[indexPath.row].to15)
        To16.text = String(employees[indexPath.row].to16)
        To17.text = String(employees[indexPath.row].to17)
        To18.text = String(employees[indexPath.row].to18)
        To19.text = String(employees[indexPath.row].to19)
        To20.text = String(employees[indexPath.row].to20)
        Total.text = String(employees[indexPath.row].total)
        
        return cell
    }
    
    
    //↓ユーザー情報の取得
    var text:String? = nil
    let currentUser = NCMBUser.currentUser
    @IBOutlet weak var UserName: UILabel!
    func getUserName(){
        if ((currentUser) != nil) {
            UserName.text = currentUser?.userName
        }else{
            UserName.text = "ログインできていません。"
        }
    }
    
    //決定ボタン押下時
    @objc func done() {
        MachineTextField.endEditing(true)
        MachineTextField.text = "\(list1[pickerView.selectedRow(inComponent: 0)])"
        ItemTextField.endEditing(true)
        ItemTextField.text = "\(list2[pickerView2.selectedRow(inComponent: 0)])"
        to9TextField.endEditing(true)
        to9TextField.text = "\(listItem[pickerViewTo9.selectedRow(inComponent: 0)])"
        to10TextField.endEditing(true)
        to10TextField.text = "\(listItem[pickerViewTo10.selectedRow(inComponent: 0)])"
        to11TextField.endEditing(true)
        to11TextField.text = "\(listItem[pickerViewTo11.selectedRow(inComponent: 0)])"
        to12TextField.endEditing(true)
        to12TextField.text = "\(listItem[pickerViewTo12.selectedRow(inComponent: 0)])"
        to14TextField.endEditing(true)
        to14TextField.text = "\(listItem[pickerViewTo14.selectedRow(inComponent: 0)])"
        to15TextField.endEditing(true)
        to15TextField.text = "\(listItem[pickerViewTo15.selectedRow(inComponent: 0)])"
        to16TextField.endEditing(true)
        to16TextField.text = "\(listItem[pickerViewTo16.selectedRow(inComponent: 0)])"
        to17TextField.endEditing(true)
        to17TextField.text = "\(listItem[pickerViewTo17.selectedRow(inComponent: 0)])"
        to18TextField.endEditing(true)
        to18TextField.text = "\(listItem[pickerViewTo18.selectedRow(inComponent: 0)])"
        to19TextField.endEditing(true)
        to19TextField.text = "\(listItem[pickerViewTo19.selectedRow(inComponent: 0)])"
        to20TextField.endEditing(true)
        to20TextField.text = "\(listItem[pickerViewTo20.selectedRow(inComponent: 0)])"
        self.viewDidLoad()
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
        case to9TextField.inputView:
            return listItem.count
        case to10TextField.inputView:
            return listItem.count
        case to11TextField.inputView:
            return listItem.count
        case to12TextField.inputView:
            return listItem.count
        case to14TextField.inputView:
            return listItem.count
        case to15TextField.inputView:
            return listItem.count
        case to16TextField.inputView:
            return listItem.count
        case to17TextField.inputView:
            return listItem.count
        case to18TextField.inputView:
            return listItem.count
        case to19TextField.inputView:
            return listItem.count
        case to20TextField.inputView:
            return listItem.count
        default:
            return 0
            
        }
        
        /* if pickerView == ItemTextField.inputView{
        return list2.count
        }else{
            return list1.count
        }*/
    }
    // ドラムロールの各タイトル
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case ItemTextField.inputView:
            return list2[row]
        case MachineTextField.inputView:
            return list1[row]
        case to9TextField.inputView:
            return listItem[row]
        case to10TextField.inputView:
            return listItem[row]
        case to11TextField.inputView:
            return listItem[row]
        case to12TextField.inputView:
            return listItem[row]
        case to14TextField.inputView:
            return listItem[row]
        case to15TextField.inputView:
            return listItem[row]
        case to16TextField.inputView:
            return listItem[row]
        case to17TextField.inputView:
            return listItem[row]
        case to18TextField.inputView:
            return listItem[row]
        case to19TextField.inputView:
            return listItem[row]
        case to20TextField.inputView:
            return listItem[row]
        default:
            return nil
            
        }
        
        /*if pickerView == ItemTextField.inputView{
        return list2[row]
        }else{
            return list1[row]
        }*/
    }
    // ドラムロール選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case ItemTextField.inputView:
            self.ItemTextField.text = list2[row]
            self.viewDidLoad()
        case MachineTextField.inputView:
            self.MachineTextField.text = list1[row]
            self.viewDidLoad()
        case to9TextField.inputView:
            self.to9TextField.text = listItem[row]
            self.viewDidLoad()
        case to10TextField.inputView:
            self.to10TextField.text = listItem[row]
            self.viewDidLoad()
        case to11TextField.inputView:
            self.to11TextField.text = listItem[row]
            self.viewDidLoad()
        case to12TextField.inputView:
            self.to12TextField.text = listItem[row]
            self.viewDidLoad()
        case to14TextField.inputView:
            self.to14TextField.text = listItem[row]
            self.viewDidLoad()
        case to15TextField.inputView:
            self.to15TextField.text = listItem[row]
            self.viewDidLoad()
        case to16TextField.inputView:
            self.to16TextField.text = listItem[row]
            self.viewDidLoad()
        case to17TextField.inputView:
            self.to17TextField.text = listItem[row]
            self.viewDidLoad()
        case to18TextField.inputView:
            self.to18TextField.text = listItem[row]
            self.viewDidLoad()
        case to19TextField.inputView:
            self.to19TextField.text = listItem[row]
            self.viewDidLoad()
        case to20TextField.inputView:
            self.to20TextField.text = listItem[row]
            self.viewDidLoad()
        default: break
            
        }
        /*if pickerView == ItemTextField.inputView{
        self.ItemTextField.text = list2[row]
        }else{
            self.MachineTextField.text = list1[row]
        }*/
    }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   

    
    
    
    
    

}//ここまでclass MainViewController

    
