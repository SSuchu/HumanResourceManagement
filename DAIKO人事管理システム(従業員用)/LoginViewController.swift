//
//  LoginViewController.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/05.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
     // User Name
    @IBOutlet weak var UserNameTextField: UITextField!
    
     // Password
    @IBOutlet weak var passwordTextField: UITextField!
    
    //初期ログアウト化
    
    override func viewDidLoad() {
        NCMBUser.logOutInBackground(callback: { result in
            switch result {
                case .success:
                    // ログアウトに成功した場合の処理
                    print("ログアウトに成功しました")

                    // ログイン状況の確認
                    if let user = NCMBUser.currentUser {
                        print("ログインしています。ユーザー: \(user.userName!)")
                    } else {
                        print("ログインしていません")
                    }

                case let .failure(error):
                    // ログアウトに失敗した場合の処理
                    print("ログアウトに失敗しました: \(error)")
            }
        })
        self.view.addBackground(name: "Silver_Surfer.png")
    }
    
    
    
    
    // Logout押下時の処理
    @IBAction func LogoutBtn(_ sender: UIButton) {
        // ログアウト
        NCMBUser.logOutInBackground(callback: { result in
            switch result {
                case .success:
                    // ログアウトに成功した場合の処理
                    print("ログアウトに成功しました")

                    // ログイン状況の確認
                    if let user = NCMBUser.currentUser {
                        print("ログインしています。ユーザー: \(user.userName!)")
                    } else {
                        print("ログインしていません")
                    }

                case let .failure(error):
                    // ログアウトに失敗した場合の処理
                    print("ログアウトに失敗しました: \(error)")
                    let errorLabel1 = UILabel()
                    DispatchQueue.main.sync {
                    errorLabel1.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 44)
                    errorLabel1.textAlignment = NSTextAlignment.center //横揃えの設定
                    errorLabel1.text = "ログアウトに失敗しました"
                    errorLabel1.textColor = UIColor.blue
                    }
                    DispatchQueue.main.sync {
                    self.view.addSubview(errorLabel1) // ラベルの追加
                }
            }
        })
    }
    
    
    
    
    
    
    // Loginボタン押下時の処理
    @IBAction func LoginBtn(_ sender: UIButton) {
        // 入力確認
            if self.UserNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
                
                //self.errorLabel.text = "未入力の項目があります"
                // TextFieldを空に
                self.cleanTextField()
                
                return
        }
      //ユーザー名とパスワードでログイン
      // ログイン状況の確認
      if let user = NCMBUser.currentUser {
          print("ログインしています。ユーザー: \(user.userName!)")
      } else {
          print("ログインしていません")
      }
        
       // ログイン
        
        
        NCMBUser.logInInBackground(userName: self.UserNameTextField.text ?? "", password: self.passwordTextField.text ?? "", callback: { result in
            switch result {
                case .success:
                    // ログインに成功した場合の処理
                    print("ログインに成功しました")
                    DispatchQueue.main.sync {
                        self.performSegue(withIdentifier: "toSelect", sender: nil)
                    }
                    

                    // ログイン状況の確認
                    if let user = NCMBUser.currentUser {
                        print("ログインしています。ユーザー: \(user.userName!)")
                    } else {
                        print("ログインしていません")
                    }

                case let .failure(error):
                    // ログインに失敗した場合の処理
                    print("ログインに失敗しました: \(error)")
                    
                    let errorLabel2 = UILabel()
                    DispatchQueue.main.sync{
                    errorLabel2.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 44)
                    errorLabel2.textAlignment = NSTextAlignment.center //横揃えの設定
                    errorLabel2.text = "ログインに失敗しました"
                    errorLabel2.textColor = UIColor.blue
                    }
                    DispatchQueue.main.sync{
                    self.view.addSubview(errorLabel2) // ラベルの追加
                }
            }
        })
    }
    
   // TextFieldを空にする
    func cleanTextField(){
        UserNameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    // errorLabelを空にする
    /*func cleanErrorLabel(){
        errorLabel.text = ""
        
    }*/
    
    // キーボードを閉じる
    func closeKeyboad(){
        UserNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }

}
