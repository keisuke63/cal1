//
//  ViewController.swift
//  Calculator
//
//  Created by 桑村 治良 on 2015/01/28.
//  Copyright (c) 2015年 KuwamuraHaruyoshi. All rights reserved.
//

import UIKit
//import QuartzCore

class ViewController: UIViewController {
    
    //計算結果を表示するラベルを宣言
    var resultLabel = UILabel()
    let xButtonCount = 4    // 1行に配置するボタンの数
    let yButtonCount = 5    // 1列に配置するボタンの数
    // 画面の横幅のサイズを格納するメンバ変数
    let screenWidth:Double = Double(UIScreen.mainScreen().bounds.size.width)
    // 画面の縦幅
    let screenHeight:Double = Double(UIScreen.mainScreen().bounds.size.height)
    // ボタン間の余白（縦）&（横）
    let buttonMargin = 10.0
    // 計算結果表示エリアの縦幅
    var resultArea = 0.0
    //入力数値1,入力数値2,計算結果,演算子
    var number1:NSDecimalNumber = 0 // 入力数値を格納する変数1
    var number2:NSDecimalNumber = 0 // 入力数値を格納する変数2
    var result:NSDecimalNumber = 0  // 計算結果を格納する変数
    var operatorId:String = ""      // 演算子を格納する変数
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画面の背景色を設定
        self.view.backgroundColor = .blackColor()
        
        
        // 画面全体の縦幅に応じて計算結果表示エリアの縦幅を決定
        switch screenHeight {
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
        //計算結果ラベルのフレームを設定。
        resultLabel.frame = CGRect(x: 10, y: 30, width: screenWidth-20, height: resultArea - 30)
        
        //計算結果ラベルの背景色を灰色にする。
        //resultLabel.backgroundColor = UIColor.grayColor()
        resultLabel.backgroundColor = self.colorWithRGBHex(0xF5F5DC, alpha: 1.0)
        //計算結果ラベルのフォントと文字サイズを設定
        resultLabel.font = UIFont(name: "LetsgoDigital-Regular", size: 50)
        //計算結果ラベルのアラインメントを右揃えに設定
        resultLabel.textAlignment = NSTextAlignment.Right
        //計算結果ラベルの表示行数を4行に設定
        resultLabel.numberOfLines = 4
        //計算結果ラベルの初期値を"0"に設定
        resultLabel.text = "0"
        //計算結果ラベルをViewControllerクラスのviewに設置
        self.view.addSubview(resultLabel)
        
        // ボタンのラベルタイトルを配列で用意
        let buttonLabels = [
            "AC","+/-","%","÷",
            "7","8","9","×",
            "4","5","6","-",
            "1","2","3","+",
            "0","00",".","="
        ]
        
        // 繰り返し処理でボタンを配置
        for var y = 0; y < yButtonCount; y++ {
            for var x = 0; x < xButtonCount; x++ {
                // 計算機のボタンを作成
                var button = UIButton()
                //ボタンの横幅サイズ作成
                var buttonWidth = ( screenWidth - ( buttonMargin * ( Double(xButtonCount) + 1 ) ) ) / Double(xButtonCount)
                
                //ボタンの縦幅サイズ
                var buttonHeight =
                ( screenHeight - resultArea - ( ( buttonMargin * Double(yButtonCount) + 1 ) ) ) / Double(yButtonCount)
                //ボタンのX座標
                var buttonPositionX =
                ( screenWidth - buttonMargin ) / Double(xButtonCount) * Double(x) + buttonMargin
                //ボタンのY座標
                var buttonPositionY =
                ( screenHeight - resultArea - buttonMargin ) / Double(yButtonCount) * Double(y) + buttonMargin + resultArea
                //ボタンの配置場所、サイズを設定
                button.frame = CGRect(x:buttonPositionX,y: buttonPositionY,width:buttonWidth,height:buttonHeight)
                //ボタン背景色設定
                //button.backgroundColor = UIColor.greenColor()
                //ボタン背景をグラデーション色設定
                var gradient = CAGradientLayer()
                gradient.frame = button.bounds
                var arrayColors = [
                    colorWithRGBHex(0xFFFFFF, alpha: 1.0).CGColor as AnyObject,
                    colorWithRGBHex(0xCCCCCC, alpha: 1.0).CGColor as AnyObject]
                gradient.colors = arrayColors
                button.layer.insertSublayer(gradient, atIndex: 0)
                //ボタンを角丸にする
                button.layer.masksToBounds = true
                button.layer.cornerRadius = 5.0
                //ボタンのテキストカラーを設定
                button.setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
                button.setTitleColor(UIColor.grayColor(), forState:UIControlState.Highlighted)
                //ボタンのラベルタイトルを取り出すインデックス番号
                var buttonNumbaer = y * xButtonCount + x
                //ボタンのラベルタイトルを設定
                button.setTitle(buttonLabels[buttonNumbaer], forState: UIControlState.Normal)
                // ボタンタップ時のアクション設定
                button.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                // ボタン配置
                self.view.addSubview(button)
            }
        }
    }
    // ボタンがタップされた時のメソッド
    func buttonTapped(sender:UIButton){
        var tappedButtonTitle:String = sender.currentTitle!
        println("\(tappedButtonTitle)ボタンが押されました！")
        // ボタンのタイトルで条件分岐
        switch tappedButtonTitle {
        case "0","00","1","2","3","4","5","6","7","8","9":   //数字ボタン
            numberButtonTapped(tappedButtonTitle)
        case "×","-","+","÷":                           //演算子ボタン
            operatorButtonTapped(tappedButtonTitle)
        case "=":                                       //等号ボタン
            equalButtonTapped(tappedButtonTitle)
        case "."                                        //小数点ボタン
            
        case "+/-"                                      //プラス＆マイナスボタン
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
    
    // HEX値で設定メソッド
    func colorWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

