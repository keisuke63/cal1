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
    let xButtonCount = 4    // 1行に配置するボタンの数
    let yButtonCount = 5    // 1列に配置するボタンの数
    
    
    //画面の横サイズを格納するメンバ変数
    let screenWidth:Double = Double(UIScreen.mainScreen().bounds.size.width)
    //画面の縦幅
    let screenHidth:Double = Double(UIScreen.mainScreen().bounds.size.height)
    //ボタン間の余白（縦）＆（横）
    let buttonmargin = 5.0
    //計算結果表示エリアの縦幅
    var resultArea = 0.0
    
    //入力数値1,入力数値2,計算結果,演算子
    var number1:NSDecimalNumber = 0 // 入力数値を格納する変数1
    var number2:NSDecimalNumber = 0 // 入力数値を格納する変数2
    var result:NSDecimalNumber = 0  // 計算結果を格納する変数
    var operatorId:String = ""      // 演算子を格納する変数
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画面全体の縦幅に応じて計算結果表示エリアの縦幅を決定
        switch screenHidth {
        case 480:
            resultArea = 200.0
        case 568:
            resultArea = 250.0
        case 667:
            resultArea = 300.0
        case 736:
            resultArea = 350.0
        default:
            resultArea = 0.0
        }
        
        
        //計算結果ラベルのフレームを設定。横幅は端末の画面サイズから左右の隙間20ポイントを引く
        resultLabel.frame = CGRect(x: 5, y: 30, width: screenWidth-10, height: resultArea - 30)
        //計算結果ラベルの背景色を灰色にする
        resultLabel.backgroundColor = UIColor.darkGrayColor()
//      　計算結果ラベルのフォントと文字サイズを設定
        resultLabel.font = UIFont(name: "LetsgoDigital-Regular", size: 50)
//        計算結果ラベルのアラインメントを右揃えに設定
        resultLabel.textAlignment = NSTextAlignment.Right
        //計算結果ラベルの表示行数を4桁に設定
        resultLabel.numberOfLines = 4
        //計算結果ラベルの初期値を"0"に設定
        resultLabel.text = "0"
        //計算結果ラベルをviewcontrollerクラスのviewに設置
        self.view.addSubview(resultLabel)
        
        // ボタンのラベルタイトルを配列で用意
        let buttonLabels = [
            "AC","+/-","%","÷",
            "7","8","9","×",
            "4","5","6","-",
            "1","2","3","+",
            "0","00",".","="
        ]
       
        //繰り返し処理でボタンを配置
        for var y = 0; y < yButtonCount; y++ {
            for var x = 0; x < xButtonCount; x++ {
    
        //計算機のボタンを作成
        var button = UIButton()
        //ボタンの横幅作成
        var buttonWidth = ( screenWidth - ( buttonmargin * ( Double(xButtonCount) + 1 ) ) ) /  Double(xButtonCount)
        //ボタンの縦幅サイズ作成
        var buttonHeight = ( screenHidth - resultArea - ( ( buttonmargin * Double(yButtonCount) + 1 ) ) ) / Double(yButtonCount)
        //ボタンのX座標
        var buttonPositionX =  ( screenWidth - buttonmargin) / Double(xButtonCount) * Double(x) + buttonmargin
        //ボタンのY座標
        var buttonPositionY = ( screenHidth - resultArea - buttonmargin) / Double(yButtonCount) * Double(y) + buttonmargin + resultArea
        //ボタンの縦幅サイズの作成
            button.frame = CGRect(x: buttonPositionX, y: buttonPositionY,
                width: buttonWidth, height: buttonHeight)
        //ボタン背景色設定
        button.backgroundColor = UIColor.lightGrayColor()
        //ボタンのラベルタイトルを取り出すインデックス番号
                var buttonNumber = y * xButtonCount + x
        //ボタンのラベルタイトルを設定
                button.setTitle( buttonLabels[buttonNumber], forState: UIControlState.Normal)
        //ボタン配置
        self.view.addSubview(button)
        
        //ボタンタップ時のアクション設定
                button.addTarget(self, action: "buttonTapped", forControlEvents: UIControlEvents.TouchUpInside)
                
                
            }
        }
    }
    
        //ボタンがタップされた時のメソッド
        func buttonTapped(sender: UIButton){
            var tappedButtonTitle:String = sender.currentTitle!
            println("\(tappedButtonTitle)ボタンがタップされました!")
//         ボタンのタイトルで条件分岐
            switch tappedButtonTitle {
            case "0","1","2","3","4","5","6","7","8","9":   //数字ボタン
            numberButtonTapped(tappedButtonTitle)
            case "×","-","+","÷":                           //演算子ボタン
            operatorButtonTapped(tappedButtonTitle)
            case "=":                                       //等号ボタン
            equalButtonTapped(tappedButtonTitle)
            default:                                        //クリアボタン
            clearButtonTapped(tappedButtonTitle)
            
        }
        
        
    }

    func numberButtonTapped(tappedButtonTitle:String){
        println("数字ボタンタップ:\(tappedButtonTitle)")
        
        // タップされた数字タイトルを計算できるようにDouble型に変換
        var tappedButtonNum:NSDecimalNumber = NSDecimalNumber(string: tappedButtonTitle)
        // 入力されていた値を10倍にして1桁大きくして、その変換した数値を加算
        number1 = number1.decimalNumberByMultiplyingBy(NSDecimalNumber(string: "10")).decimalNumberByAdding(tappedButtonNum)
        // 計算結果ラベルに表示
        resultLabel.text = number1.stringValue
}
    func operatorButtonTapped(tappedButtonTitle:String){
        println("演算子ボタンタップ:\(tappedButtonTitle)")
        operatorId = tappedButtonTitle
        number2 = number1
        number1 = NSDecimalNumber(string: "0")
    }
    func equalButtonTapped(tappedButtonTitle:String){
        println("等号ボタンタップ:\(tappedButtonTitle)")
        switch operatorId {
        case "+":
            result = number2.decimalNumberByAdding(number1)
        case "-":
            result = number2.decimalNumberBySubtracting(number1)
        case "×":
            result = number2.decimalNumberByMultiplyingBy(number1)
        case "÷":
            if(number1.isEqualToNumber(0)){
                number1 = 0
                resultLabel.text = "無限大"
                return
            } else {
                result = number2.decimalNumberByDividingBy(number1)
            }
        default:
            println("その他")
        }
        number1 = result
        resultLabel.text = String("\(result)")
        
    }
    func clearButtonTapped(tappedButtonTitle:String){
        println("クリアボタンタップ:\(tappedButtonTitle)")
        number1 = NSDecimalNumber(string: "0")
        number2 = NSDecimalNumber(string: "0")
        result = NSDecimalNumber(string: "0")
        operatorId = ""
        resultLabel.text = "0"
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




