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
    
     // errorLabel
    @IBOutlet weak var errorLabel: UILabel!
    
    
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
            }
        })
    }
    
    
    
    
    
    
    // Loginボタン押下時の処理
    @IBAction func LoginBtn(_ sender: UIButton) {
        // 入力確認
            if self.UserNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
                self.errorLabel.text = "未入力の項目があります"
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
                        self.performSegue(withIdentifier: "toMain", sender: nil)
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
            }
        })
    }
    
   // TextFieldを空にする
    func cleanTextField(){
        UserNameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    // errorLabelを空にする
    func cleanErrorLabel(){
        errorLabel.text = ""
        
    }
    
    // キーボードを閉じる
    func closeKeyboad(){
        UserNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }

}
