//
//  ViewController.swift
//  cal1
//
//  Created by 佐藤 圭祐 on 2015/05/04.
//  Copyright (c) 2015年 佐藤 圭祐. All rights reserved.
//  aaaaaaa

import UIKit

class ViewController: UIViewController {

    //計算結果を表示するラベルを宣言
    var resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //計算結果ラベルのフレームを設定。横幅は端末の画面サイズから左右の隙間20ポイントを引く
        resultLabel.frame = CGRect(x: 10, y: 30, width: screenWidth-20, height: 170)
        //計算結果ラベルの背景色を灰色にする
        resultLabel.backgroundColor = UIColor.grayColor()
     　　//計算結果ラベルのフォントと文字サイズを設定
       　resultLabel.font = UIFont(name: "Arial", size: 50)
        
        
        
        
        //計算結果ラベルをViewControllerクラスのviewに設置
        self.view.addSubview(resultLabel)
        
    //画面の横幅のサイズを格納するメンバ変数
        let screenWidth:Double = Double(UIScreen.mainScreen().bounds.size.width)
        
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

