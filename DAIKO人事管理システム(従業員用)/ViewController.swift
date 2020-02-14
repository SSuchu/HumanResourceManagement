//
//  ViewController.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/04.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像インスタンス用
    let imageSample = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // スクリーンサイズの取得
        let screenW:CGFloat = view.frame.size.width
        let screenH:CGFloat = view.frame.size.height
         
        // 画像を読み込んで、準備しておいたimageSampleに設定
        imageSample.image = UIImage(named: "DAIKO_Logo")
        // 画像のフレームを設定
        imageSample.frame = CGRect(x:0, y:0, width:240, height:90)
         
        // 画像を中央に設定
        imageSample.center = CGPoint(x:screenW/2, y:screenH/2-120)
         
        // 設定した画像をスクリーンに表示する
        self.view.addSubview(imageSample)
        
        self.view.addBackground(name: "Silver_Surfer.png")

    }
    
    
    
    
    @IBAction func tap(_ sender: UIButton) {
        
        let storyboard: UIStoryboard = self.storyboard!
        
        let nextView = storyboard.instantiateViewController(withIdentifier: "loginviewcontroller") as! LoginViewController
        
        nextView.modalTransitionStyle = .flipHorizontal
        
        self.present(nextView, animated: true, completion: nil)
        
        
    }
    


}

