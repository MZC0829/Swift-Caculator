//
//  ViewController.swift
//  Swift-Caculator
//
//  Created by 麦志超 on 2017/3/12.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var lblShow:UILabel!     //计算器顶部的数字，用Label显示
    var btnDelete:UIButton!  //计算器按键，Delete(C)键
    var btnReverse:UIButton! //计算器按键，取反(+/-)键
    var btnPercent:UIButton! //计算器按键，(%)键
    var btnDivision:UIButton!//计算器按键，(÷)键
    var btnAdd:UIButton!     //计算器按键，(+)键
    var btnSubtraction:UIButton!  //计算器按键，(-)键
    var btnMultiplication:UIButton!  //计算器按键，(X)键
    var btnResult:UIButton!  //计算器按键，(=)键
    var btnPoint:UIButton!  //计算器按键，(.)键
    var btnZero:UIButton!  //计算器按键，(0)键
    var btnOne:UIButton!  //计算器按键，(1)键
    var btnTwo:UIButton!  //计算器按键，(2)键
    var btnThree:UIButton!  //计算器按键，(3)键
    var btnFour:UIButton!  //计算器按键，(4)键
    var btnFive:UIButton!  //计算器按键，(5)键
    var btnSix:UIButton!  //计算器按键，(6)键
    var btnSeven:UIButton!  //计算器按键，(7)键
    var btnEight:UIButton!  //计算器按键，(8)键
    var btnNine:UIButton!  //计算器按键，(9)键
    
    var resultString:String = "0" //lblShow显示的内容
    var howManyPoint:Int = 0      //小数点的数量
    var firstNumber:Float = 0        //第一个数
    var result:Float = 0             //结果
    var operatorString:String = ""   //运算符(+ - * /)
    var flag:Int = 0           //flag判断是否点击了运算符号，0(没点)，1(点了)
    
    var screenHeight:CGFloat! //当前屏幕高度
    var screenWidth:CGFloat!  //当前屏幕的宽度
    var perHeight:CGFloat!
    var perWidth:CGFloat!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        screenWidth = view.bounds.width
        screenHeight = view.bounds.height
        perWidth = screenWidth / 4   //宽度平均分成4份
        perHeight = screenHeight / 7 //高度平均分成7份
        funcInitUI()
    }

    // MARK: 初始化UI，加载计算器按键
    func funcInitUI()
    {
        self.view.backgroundColor = UIColor.black
        
        // MARK: 显示数字控件Label
        lblShow = UILabel(frame: CGRect(x: 0, y: perHeight, width: screenWidth, height: perHeight))
        lblShow.backgroundColor = UIColor.black
        lblShow.textAlignment = NSTextAlignment.right
        lblShow.textColor = UIColor.white
        lblShow.font = UIFont.systemFont(ofSize: 68)
        lblShow.text = resultString
        self.view.addSubview(lblShow)
        
        // MARK: 删除归零按键
        btnDelete = UIButton(frame:CGRect(x: 0, y: 2*perHeight, width: perWidth, height: perHeight))
        btnDelete.backgroundColor = UIColor.lightGray
        btnDelete.setTitle("C", for: UIControlState.normal)
        btnDelete.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnDelete.showsTouchWhenHighlighted = true
        btnDelete.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btnDelete.titleLabel?.textAlignment = NSTextAlignment.center
        btnDelete.layer.borderWidth = 0.5
        btnDelete.layer.borderColor = UIColor.black.cgColor
        btnDelete.addTarget(self, action: #selector(ViewController.funcBtnDelete), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnDelete)
        
        // MARK: 取反按键
        btnReverse = UIButton(frame: CGRect(x: perWidth, y: 2*perHeight, width: perWidth, height: perHeight))
        btnReverse.backgroundColor = UIColor.lightGray
        btnReverse.setTitle("+/-", for: UIControlState.normal)
        btnReverse.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnReverse.showsTouchWhenHighlighted = true
        btnReverse.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btnReverse.titleLabel?.textAlignment = NSTextAlignment.center
        btnReverse.layer.borderWidth = 0.5
        btnReverse.layer.borderColor = UIColor.black.cgColor
        btnReverse.addTarget(self, action: #selector(ViewController.funcBtnReverse), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnReverse)
        
        // MARK: 加上%按键
        btnPercent = UIButton(frame: CGRect(x: 2*perWidth, y: 2*perHeight, width: perWidth, height: perHeight))
        btnPercent.backgroundColor = UIColor.lightGray
        btnPercent.setTitle("%", for: UIControlState.normal)
        btnPercent.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnPercent.showsTouchWhenHighlighted = true
        btnPercent.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btnPercent.titleLabel?.textAlignment = NSTextAlignment.center
        btnPercent.layer.borderWidth = 0.5
        btnPercent.layer.borderColor = UIColor.black.cgColor
        btnPercent.addTarget(self, action: #selector(ViewController.funcBtnPercent), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnPercent)
        
        // MARK: 除号 ÷ 按键
        btnDivision = UIButton(frame: CGRect(x: 3*perWidth, y: 2*perHeight, width: perWidth, height: perHeight))
        btnDivision.backgroundColor = UIColor.orange
        btnDivision.setTitle("÷", for: UIControlState.normal)
        btnDivision.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnDivision.showsTouchWhenHighlighted = true
        btnDivision.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btnDivision.titleLabel?.textAlignment = NSTextAlignment.center
        btnDivision.layer.borderWidth = 0.5
        btnDivision.layer.borderColor = UIColor.black.cgColor
        btnDivision.addTarget(self, action: #selector(ViewController.funcBtnDivision), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnDivision)
        
        // MARK: 数字 7 按键
        btnSeven = UIButton(frame: CGRect(x: 0, y: 3*perHeight, width: perWidth, height: perHeight))
        btnSeven.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnSeven.setTitle("7", for: UIControlState.normal)
        btnSeven.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnSeven.showsTouchWhenHighlighted = true
        btnSeven.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnSeven.titleLabel?.textAlignment = NSTextAlignment.center
        btnSeven.layer.borderWidth = 0.5
        btnSeven.layer.borderColor = UIColor.black.cgColor
        btnSeven.addTarget(self, action: #selector(ViewController.funcBtnSeven), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnSeven)
        
        // MARK: 数字 8 按键
        btnEight = UIButton(frame: CGRect(x: perWidth, y: 3*perHeight, width: perWidth, height: perHeight))
        btnEight.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnEight.setTitle("8", for: UIControlState.normal)
        btnEight.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnEight.showsTouchWhenHighlighted = true
        btnEight.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnEight.titleLabel?.textAlignment = NSTextAlignment.center
        btnEight.layer.borderWidth = 0.5
        btnEight.layer.borderColor = UIColor.black.cgColor
        btnEight.addTarget(self, action: #selector(ViewController.funcBtnEight), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnEight)
        
        // MARK: 数字 9 按键
        btnNine = UIButton(frame: CGRect(x: 2*perWidth, y: 3*perHeight, width: perWidth, height: perHeight))
        btnNine.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnNine.setTitle("9", for: UIControlState.normal)
        btnNine.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnNine.showsTouchWhenHighlighted = true
        btnNine.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnNine.titleLabel?.textAlignment = NSTextAlignment.center
        btnNine.layer.borderWidth = 0.5
        btnNine.layer.borderColor = UIColor.black.cgColor
        btnNine.addTarget(self, action: #selector(ViewController.funcBtnNine), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnNine)
        
        // MARK: 乘号 X 按键
        btnMultiplication = UIButton(frame: CGRect(x: 3*perWidth, y: 3*perHeight, width: perWidth, height: perHeight))
        btnMultiplication.backgroundColor = UIColor.orange
        btnMultiplication.setTitle("X", for: UIControlState.normal)
        btnMultiplication.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnMultiplication.showsTouchWhenHighlighted = true
        btnMultiplication.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnMultiplication.titleLabel?.textAlignment = NSTextAlignment.center
        btnMultiplication.layer.borderWidth = 0.5
        btnMultiplication.layer.borderColor = UIColor.black.cgColor
        btnMultiplication.addTarget(self, action: #selector(ViewController.funcBtnMultiplication), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnMultiplication)
        
        // MARK: 数字 4 按键
        btnFour = UIButton(frame: CGRect(x: 0, y: 4*perHeight, width: perWidth, height: perHeight))
        btnFour.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnFour.setTitle("4", for: UIControlState.normal)
        btnFour.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnFour.showsTouchWhenHighlighted = true
        btnFour.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnFour.titleLabel?.textAlignment = NSTextAlignment.center
        btnFour.layer.borderWidth = 0.5
        btnFour.layer.borderColor = UIColor.black.cgColor
        btnFour.addTarget(self, action: #selector(ViewController.funcBtnFour), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnFour)
        
        // MARK: 数字 5 按键
        btnFive = UIButton(frame: CGRect(x: perWidth, y: 4*perHeight, width: perWidth, height: perHeight))
        btnFive.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnFive.setTitle("5", for: UIControlState.normal)
        btnFive.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnFive.showsTouchWhenHighlighted = true
        btnFive.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnFive.titleLabel?.textAlignment = NSTextAlignment.center
        btnFive.layer.borderWidth = 0.5
        btnFive.layer.borderColor = UIColor.black.cgColor
        btnFive.addTarget(self, action: #selector(ViewController.funcBtnFive), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnFive)
        
        // MARK: 数字 6 按键
        btnSix = UIButton(frame: CGRect(x: 2*perWidth, y: 4*perHeight, width: perWidth, height: perHeight))
        btnSix.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnSix.setTitle("6", for: UIControlState.normal)
        btnSix.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnSix.showsTouchWhenHighlighted = true
        btnSix.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnSix.titleLabel?.textAlignment = NSTextAlignment.center
        btnSix.layer.borderWidth = 0.5
        btnSix.layer.borderColor = UIColor.black.cgColor
        btnSix.addTarget(self, action: #selector(ViewController.funcBtnSix), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnSix)
        
        // MARK: 减号 — 按键
        btnSubtraction = UIButton(frame: CGRect(x: 3*perWidth, y: 4*perHeight, width: perWidth, height: perHeight))
        btnSubtraction.backgroundColor = UIColor.orange
        btnSubtraction.setTitle("-", for: UIControlState.normal)
        btnSubtraction.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnSubtraction.showsTouchWhenHighlighted = true
        btnSubtraction.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnSubtraction.titleLabel?.textAlignment = NSTextAlignment.center
        btnSubtraction.layer.borderWidth = 0.5
        btnSubtraction.layer.borderColor = UIColor.black.cgColor
        btnSubtraction.addTarget(self, action: #selector(ViewController.funcBtnSubtraction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnSubtraction)
        
        // MARK: 数字 1 按键
        btnOne = UIButton(frame: CGRect(x: 0, y: 5*perHeight, width: perWidth, height: perHeight))
        btnOne.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnOne.setTitle("1", for: UIControlState.normal)
        btnOne.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnOne.showsTouchWhenHighlighted = true
        btnOne.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnOne.titleLabel?.textAlignment = NSTextAlignment.center
        btnOne.layer.borderWidth = 0.5
        btnOne.layer.borderColor = UIColor.black.cgColor
        btnOne.addTarget(self, action: #selector(ViewController.funcBtnOne), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnOne)
        
        // MARK: 数字 2 按键
        btnTwo = UIButton(frame: CGRect(x: perWidth, y: 5*perHeight, width: perWidth, height: perHeight))
        btnTwo.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnTwo.setTitle("2", for: UIControlState.normal)
        btnTwo.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnTwo.showsTouchWhenHighlighted = true
        btnTwo.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnTwo.titleLabel?.textAlignment = NSTextAlignment.center
        btnTwo.layer.borderWidth = 0.5
        btnTwo.layer.borderColor = UIColor.black.cgColor
        btnTwo.addTarget(self, action: #selector(ViewController.funcBtnTwo), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnTwo)
        
        // MARK: 数字 3 按键
        btnThree = UIButton(frame: CGRect(x: 2*perWidth, y: 5*perHeight, width: perWidth, height: perHeight))
        btnThree.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnThree.setTitle("3", for: UIControlState.normal)
        btnThree.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnThree.showsTouchWhenHighlighted = true
        btnThree.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnThree.titleLabel?.textAlignment = NSTextAlignment.center
        btnThree.layer.borderWidth = 0.5
        btnThree.layer.borderColor = UIColor.black.cgColor
        btnThree.addTarget(self, action: #selector(ViewController.funcBtnThree), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnThree)
        
        // MARK: 加号 + 按键
        btnAdd = UIButton(frame: CGRect(x: 3*perWidth, y: 5*perHeight, width: perWidth, height: perHeight))
        btnAdd.backgroundColor = UIColor.orange
        btnAdd.setTitle("+", for: UIControlState.normal)
        btnAdd.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnAdd.showsTouchWhenHighlighted = true
        btnAdd.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        btnAdd.titleLabel?.textAlignment = NSTextAlignment.center
        btnAdd.layer.borderWidth = 0.5
        btnAdd.layer.borderColor = UIColor.black.cgColor
        btnAdd.addTarget(self, action: #selector(ViewController.funcBtnAdd), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnAdd)

        // MARK: 数字 0 按键
        btnZero = UIButton(frame: CGRect(x: 0, y: 6*perHeight, width: 2*perWidth, height: perHeight))
        btnZero.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnZero.setTitle("0", for: UIControlState.normal)
        btnZero.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnZero.showsTouchWhenHighlighted = true
        btnZero.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnZero.titleLabel?.textAlignment = NSTextAlignment.center
        btnZero.layer.borderWidth = 0.5
        btnZero.layer.borderColor = UIColor.black.cgColor
        btnZero.addTarget(self, action: #selector(ViewController.funcBtnZero), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnZero)
        
        // MARK: 小数点 . 按键
        btnPoint = UIButton(frame: CGRect(x: 2*perWidth, y: 6*perHeight, width: perWidth, height: perHeight))
        btnPoint.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        btnPoint.setTitle(".", for: UIControlState.normal)
        btnPoint.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnPoint.showsTouchWhenHighlighted = true
        btnPoint.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        btnPoint.titleLabel?.textAlignment = NSTextAlignment.center
        btnPoint.layer.borderWidth = 0.5
        btnPoint.layer.borderColor = UIColor.black.cgColor
        btnPoint.addTarget(self, action: #selector(ViewController.funcBtnPoint), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnPoint)
        
        // MARK: 等于号 = 按键
        btnResult = UIButton(frame: CGRect(x: 3*perWidth, y: 6*perHeight, width: perWidth, height: perHeight))
        btnResult.backgroundColor = UIColor.orange
        btnResult.setTitle("=", for: UIControlState.normal)
        btnResult.setTitleColor(UIColor.black, for: UIControlState.normal)
        btnResult.showsTouchWhenHighlighted = true
        btnResult.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btnResult.titleLabel?.textAlignment = NSTextAlignment.center
        btnResult.layer.borderWidth = 0.5
        btnResult.layer.borderColor = UIColor.black.cgColor
        btnResult.addTarget(self, action: #selector(ViewController.funcBtnResult), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnResult)
    }
    
    // MARK: 按键 0,1,2,3,4,5,6,7,8,9的事件,参数number为按键的数字
    func funcBtnNumber(number:Int)
    {
        if flag == 1
        {
            lblShow.text = resultString
            flag = 0
        }
        
        if lblShow.text == "0"
        {
            lblShow.text = ""
        }
        if ((lblShow.text?.characters.count)! < 9 )
        {
            lblShow.text? += "\(number)"
        }

    }
    
    // MARK: 按键1的事件
    func funcBtnOne()
    {
        funcBtnNumber(number: 1)
    }
    
    // MARK: 按键2的事件
    func funcBtnTwo()
    {
        funcBtnNumber(number: 2)
    }
    
    // MARK: 按键3的事件
    func funcBtnThree()
    {
        funcBtnNumber(number: 3)
    }
    // MARK: 按键4的事件
    func funcBtnFour()
    {
        funcBtnNumber(number: 4)
    }

    // MARK: 按键5的事件
    func funcBtnFive()
    {
        funcBtnNumber(number: 5)
    }

    // MARK: 按键6的事件
    func funcBtnSix()
    {
        funcBtnNumber(number: 6)
    }
    
    // MARK: 按键7的事件
    func funcBtnSeven()
    {
        funcBtnNumber(number: 7)
    }
    
    // MARK: 按键8的事件
    func funcBtnEight()
    {
        funcBtnNumber(number: 8)
    }

    // MARK: 按键9的事件
    func funcBtnNine()
    {
        funcBtnNumber(number: 9)
    }

    // MARK: 按键0的事件
    func funcBtnZero()
    {
        funcBtnNumber(number: 0)
    }
    
    // MARK: 按键小数点(.)的事件
    func funcBtnPoint()
    {
        if (((lblShow.text?.characters.count)! < 9) && (howManyPoint == 0))
        {
            lblShow.text? += "."
            howManyPoint = 1
        }
    }

    // MARK: 按键Delete事件,归零
    func funcBtnDelete()
    {
        resultString = "0"
        self.lblShow.text = resultString
        howManyPoint = 0
    }
    
    // MARK: 按键Reverse事件,取反
    func funcBtnReverse()
    {
        var tempValue = (Float)(lblShow.text!)
        tempValue = tempValue! * (-1.0)
        lblShow.text = String(tempValue!)
        
        if( tempValue == Float(String(Int(tempValue!))))
        {
            lblShow.text = String(Int(tempValue!))
        }
        else
        {
            lblShow.text = String(tempValue!)
        }
        
        funcLblShowLength()
    }
    
    // MARK: 按键 % 事件,在数字后面加上%，然后用小数表示
    func funcBtnPercent()
    {
        let tempValue = (Float)(lblShow.text!)
        lblShow.text = String(tempValue! / 100)
        funcLblShowLength()
    }
    
    // MARK: 判断字符长度，控制字体大小
    func funcLblShowLength()
    {
        if ((lblShow.text?.characters.count)! > 9)
        {
            lblShow.font = UIFont.systemFont(ofSize: 60)
        }
        else
       {
            lblShow.font = UIFont.systemFont(ofSize: 68)
       }
    }
    
    // MARK: 按键 + 事件(加法)
    func funcBtnAdd()
    {
        firstNumber = Float(lblShow.text!)!
        operatorString = "+"
        funcReturnFlag()
    }
    
    // MARK: 按键 - 事件(减法)
    func funcBtnSubtraction()
    {
        firstNumber = Float(lblShow.text!)!
        operatorString = "-"
        funcReturnFlag()
    }
    
    // MARK: 按键 X 事件(乘法)
    func funcBtnMultiplication()
    {
        firstNumber = Float(lblShow.text!)!
        operatorString = "X"
        funcReturnFlag()
    }
    
    // MARK: 按键 ÷ 事件(减法)
    func funcBtnDivision()
    {
        firstNumber = Float(lblShow.text!)!
        operatorString = "÷"
        funcReturnFlag()
    }

    // MARK: 点击了运算符后要变更的参数 事件
    func funcReturnFlag()
    {
        resultString = ""
        howManyPoint = 0
        flag = 1
    }
    
    // MARK: 按键 = 事件(等于)
    func funcBtnResult()
    {
        switch operatorString
        {
        
        case "+":
            result = firstNumber + Float(lblShow.text!)!
            funcDeletePointZero()
            
        case "-":
            result = firstNumber - Float(lblShow.text!)!
            funcDeletePointZero()
            
        case "X":
            result = firstNumber * Float(lblShow.text!)!
            funcDeletePointZero()
            
        case "÷":
            if(lblShow.text == "0")
            {
                lblShow.text = "错误"
            }
            else
            {
                result = firstNumber / Float(lblShow.text!)!
                funcDeletePointZero()
            }
                
        default:
            break
        }
        
        funcReturnFlag()
    }
    
    // MARK: 把小数点后面没有的 0 去掉(如:结果为2.0则显示2；结果为2.4还是显示2.4)
    func funcDeletePointZero()
    {
        if(result == Float(String(Int(result))))
        {
            lblShow.text = String(Int(result))
        }
        else
        {
            lblShow.text = String(result)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

