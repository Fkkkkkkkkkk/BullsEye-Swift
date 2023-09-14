//
//  ViewController.swift
//  BullsEye
//
//  Created by 刘冠中 on 2018/5/7.
//  Copyright © 2018年 刘冠中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue:Int = 50;
    var targetValue:Int = 0;
    var score = 0;
    var round: Int = 0
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(currentValue - targetValue)
        var point = 100 - difference
        score += point
        let title: String
        
        if difference == 0 {
            
            title = "运气逆天！赶紧去买注彩票吧！"
            point += 100
            
        }else if difference < 5 {
            
            title = "太棒了！差一点就到了！"
            
        }else if difference < 10 {
            
            title = "很不错！继续努力！"
            
        }else {
            
            title = "差太远了，君在长江头，我在长江尾~"
            
        }
        let mesage = "滑动条的当前数值是：\(currentValue)" + "\n目标数值是： \(targetValue)"+"\n两者的差值是： \(difference)" + "\n最终得分：\(point)";
        let alert = UIAlertController(title:title,message:mesage,preferredStyle: .alert);
        let action = UIAlertAction(title:"ok",style: .default,handler: nil);
        alert.addAction(action);
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        
        //print("滑动条的当前数值是： \(slider.value)")
        currentValue = lroundf(slider.value);
        
    }
    
    func startNewRound() {
        round += 1
        
        targetValue = 1 + Int (arc4random_uniform(100))
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        updateLabels()
        
    }
    
    func updateLabels(){
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startOver(){
        
        
        
        startNewGame()
        
        
        
    }
    
    func startNewGame(){
        
        score = 0
        
        round = 0
        
        startNewRound()
        
    }

}

