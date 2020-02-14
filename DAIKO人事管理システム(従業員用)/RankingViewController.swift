//
//  RankingViewController.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/12.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    @IBAction func BackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        //tableViewCell追加
        employees.append(employee(name: "ソラ", to9: 15, to10: 15, to11: 15, to12: 16, to14: 14, to15: 17, to16: 15, to17: 15, to18: 14, to19: 17, to20: 15, total: 100))
        employees.append(employee(name: "John", to9: 16, to10: 15, to11: 15, to12: 16, to14: 14, to15: 17, to16: 15, to17: 15, to18: 14, to19: 17, to20: 15, total: 100))
        
        //背景
        self.view.addBackground(name: "Wolverine.png")
    }//ここまでViewDidLoad
    
    //セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }                               //DelegateとDataSourceをstoryboard上でviewcontrollerに繋げるの忘れない
    //セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Rankingcell", for: indexPath)
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
    
}//ここまでclass RankingViewController
