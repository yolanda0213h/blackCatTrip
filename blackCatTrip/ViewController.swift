//
//  ViewController.swift
//  blackCatTrip
//
//  Created by Yolanda H. on 2018/12/24.
//  Copyright © 2018 Yolanda H. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var beachImageView: UIImageView!
    @IBOutlet weak var sakuraImageView: UIImageView!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var personImageView: UIImageView!
    
    func lyrics(flowers: String, person: String, something: String, colorR: CGFloat, colorB: CGFloat){
        label.text = "在 一個 "+flowers+" 盛 開 喔   晚風 徐 徐 的夜晚   \n  小黑貓遇上了"+person+" 而"+person+"給了牠"+something
        
        let labelLayer = CAGradientLayer()
        labelLayer.frame = labelView.bounds
        labelLayer.colors = [UIColor(displayP3Red: colorR, green: 1, blue: colorB, alpha: 1).cgColor,UIColor.white.cgColor, UIColor(displayP3Red: colorR, green: 1, blue: colorB, alpha: 1).cgColor,UIColor.white.cgColor]
        labelLayer.startPoint = CGPoint(x: 0, y: 0)
        labelLayer.endPoint = CGPoint(x: 0, y: 1)
        labelLayer.locations = [0,0.4,0.7,0.8]
        labelView.layer.addSublayer(labelLayer)
        labelView.mask = label
    }
    func personGradient(gradationNumber: NSNumber, colorname0: CGColor, colorname1: CGColor, colorname2: CGColor) {
        let gradationLayer = CAGradientLayer()
        gradationLayer.frame = gradientView.bounds
        gradationLayer.colors = [colorname0, colorname1, colorname2]
        gradationLayer.startPoint = CGPoint(x: 1, y: 0)
        gradationLayer.endPoint = CGPoint(x: 0, y: 1)
        gradationLayer.locations = [0,gradationNumber,1]
        gradientView.layer.addSublayer(gradationLayer)
        gradientView.mask = personImageView
    }
    func skyfly (image: String) {
        let snowCell = CAEmitterCell()
        snowCell.contents = UIImage(named: image)?.cgImage
        snowCell.birthRate = 20
        snowCell.lifetime = 10
        snowCell.scale = 0.03
        snowCell.scaleRange = 0.35
        snowCell.velocity = 10
        snowCell.velocityRange = -20
        snowCell.spin = 1
        snowCell.spinRange = 1
        snowCell.emissionRange = .pi * 10
        snowCell.yAcceleration = 200
        snowCell.beginTime = 5.5
        let snowLayer = CAEmitterLayer()
        snowLayer.position = CGPoint(x: cityImageView.bounds.width / 2, y: -15)
        snowLayer.emitterSize = CGSize(width: cityImageView.bounds.width, height: 0)
        snowLayer.emitterShape = .line
        snowLayer.emitterCells = [snowCell]
        snowLayer.beginTime = CACurrentMediaTime()
        snowLayer.timeOffset = 10
        backImageView.layer.addSublayer(snowLayer)
    }
    func skysakura (image: String) {
        let snowCell = CAEmitterCell()
        snowCell.contents = UIImage(named: image)?.cgImage
        snowCell.birthRate = 12
        snowCell.lifetime = 10
        snowCell.scale = 0.03
        snowCell.scaleRange = 0.15
        snowCell.velocity = 10
        snowCell.velocityRange = -20
        snowCell.spin = -1
        snowCell.spinRange = 1
        snowCell.yAcceleration = 180
        snowCell.xAcceleration = 100
        snowCell.emissionRange = .pi
        snowCell.emissionLongitude = .pi * 2
        let snowLayer = CAEmitterLayer()
        snowLayer.position = CGPoint(x: -30, y: -50)
        snowLayer.emitterSize = CGSize(width: 900, height: 0)
        snowLayer.emitterShape = .sphere
        snowLayer.emitterCells = [snowCell]
        sakuraImageView.layer.addSublayer(snowLayer)
    }
    func spindrift (){
        let spindriftCell = CAEmitterCell()
        let spindriftLayer = CAEmitterLayer()
        spindriftCell.contents = UIImage(named: "water120")?.cgImage
        spindriftCell.color = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        spindriftCell.birthRate = 40
        spindriftCell.scale = 0.03
        spindriftCell.scaleRange = 0.1
        spindriftCell.alphaSpeed = 0.3
        spindriftCell.lifetime = 0.5
        spindriftCell.velocity = 100
        spindriftCell.yAcceleration = -50
        spindriftCell.emissionRange = .pi
        spindriftCell.emissionLongitude = .pi * 2
        spindriftLayer.emitterCells = [spindriftCell]
        spindriftLayer.renderMode = .backToFront
        spindriftLayer.emitterShape = .line
        spindriftLayer.position = CGPoint(x: beachImageView.bounds.width / 2, y: 160)
        spindriftLayer.emitterSize = CGSize(width: beachImageView.bounds.width, height: 100)
        beachImageView.layer.addSublayer(spindriftLayer)
    }
    func skyfly2 (image: String, x: CGFloat, y: CGFloat, time: Double) {
        let trailCell = CAEmitterCell()
        trailCell.contents = UIImage(named: image)?.cgImage
        trailCell.lifetime = 1.5
        trailCell.birthRate = 65
        trailCell.velocity = 80
        trailCell.scale = 0.04
        trailCell.alphaSpeed = -0.7
        trailCell.scaleSpeed = -0.1
        trailCell.scaleRange = 0.1
        trailCell.beginTime = 0.01
        trailCell.duration = 1.7
        trailCell.emissionRange = CGFloat.pi / 8
        trailCell.emissionLongitude = CGFloat.pi * 2
        trailCell.yAcceleration = -5
        let fireCell = CAEmitterCell()
        fireCell.contents = UIImage(named: image)?.cgImage
        fireCell.lifetime = 0.5
        fireCell.birthRate = 30
        fireCell.scale = 0.04
        fireCell.alphaSpeed = -0.7
        fireCell.emissionRange = CGFloat.pi / 8
        fireCell.emissionLongitude = CGFloat.pi * 2
        let emitterCell = CAEmitterCell()
        emitterCell.color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        emitterCell.redRange = 0
        emitterCell.greenRange = 0.9
        emitterCell.blueRange = 0.9
        emitterCell.lifetime = 0.3
        emitterCell.birthRate = 3
        emitterCell.velocity = 300
        emitterCell.velocityRange = 100
        emitterCell.emissionRange = CGFloat.pi
        emitterCell.emissionLongitude = CGFloat.pi / 2
        emitterCell.yAcceleration = 5
        emitterCell.emitterCells = [fireCell, trailCell]
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = CGPoint(x: cityImageView.bounds.width / 10 + x, y: y)
        emitterLayer.emitterSize = CGSize(width: 2, height: 2)
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive
        emitterLayer.emitterCells = [emitterCell]
        emitterLayer.beginTime = time
        cityImageView.layer.addSublayer(emitterLayer)
    }
    func mv01() {
        backImageView.image = UIImage(named: "winterNight")
        backImageView.alpha = 0.7
        cityImageView.alpha = 0
        sakuraImageView.alpha = 0
        beachImageView.alpha = 0
        personImageView.image = UIImage(named: "santa")
        lyrics(flowers: "雪花", person: "老聖誕  ", something: "一匹 軟軟的毛毯", colorR: 1, colorB: 0)
        
    }
    func mv02() {
        sakuraImageView.image = UIImage(named: "sakuraNight")
        sakuraImageView.alpha = 1
        backImageView.alpha = 0
        cityImageView.alpha = 0
        beachImageView.alpha = 0
        skysakura(image: "sakura")
        personImageView.image = UIImage(named: "boy")
        lyrics(flowers: "櫻花", person: "小男孩  ", something: "一碗 溫溫的牛奶", colorR: 0, colorB: 1)
        
    }
    func mv03() {
        beachImageView.image = UIImage(named: "realBeach2")
        beachImageView.alpha = 1
        backImageView.alpha = 0
        cityImageView.alpha = 0
        sakuraImageView.alpha = 0
        spindrift()
        personImageView.image = UIImage(named: "fish")
        lyrics(flowers: "浪花", person: "小人魚  ", something: "一條 亮亮的髮帶", colorR: 1, colorB: 0)
        
    }
    func mv04() {
        cityImageView.image = UIImage(named: "cityNight")
        cityImageView.alpha = 1
        backImageView.alpha = 0
        sakuraImageView.alpha = 0
        beachImageView.alpha = 0
        skyfly2(image: "ruby120", x: 15, y: 70, time: 0)
        skyfly2(image: "bj120", x: 95, y: 140, time: 2)
        personImageView.image = UIImage(named: "witch")
        lyrics(flowers: "煙花", person: "小女巫  ", something: "一瓶 香香的藥罐", colorR: 0, colorB: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        skyfly(image: "icecrystal")
        backImageView.image = UIImage(named: "winterNight")
        backImageView.alpha = 0.7
        cityImageView.alpha = 0
        sakuraImageView.alpha = 0
        beachImageView.alpha = 0
        
    }

    @IBAction func sliderfunc(_ sender: UISlider) {
        playButton.setTitle("❤︎", for: UIControl.State.normal)
        let move = CGFloat(slider.value)
        var gradationMove = NSNumber(value: Float(move)/10)
        if move < 10 {
            mv01()
            catImage.frame.origin.x = 20 + 49 * move
            gradientView.frame.origin.x = 510 - 49 * move
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.red.cgColor, colorname1: UIColor.darkGray.cgColor, colorname2: UIColor.green.cgColor)
            sliderLabel.text = "12~2 \n" + String(Int(slider.value+1)) + " of year"
        }
        else if move < 20 {
            mv02()
            catImage.frame.origin.x = 20 + 49 * (move-10)
            gradientView.frame.origin.x = 510 - 49 * (move-10)
            gradationMove = NSNumber(value: Float(move-10)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.cyan.cgColor, colorname1: UIColor.blue.cgColor, colorname2: UIColor.orange.cgColor)
            sliderLabel.text = "3~5 \n" + String(Int(slider.value+1)) + " of year"
        }
        else if move < 30 {
            mv03()
            catImage.frame.origin.x = 20 + 49 * (move-20)
            gradientView.frame.origin.x = 510 - 49 * (move-20)
            gradationMove = NSNumber(value: Float(move-20)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.blue.cgColor, colorname1: UIColor.cyan.cgColor, colorname2: UIColor.purple.cgColor)
            sliderLabel.text = "6~8 \n" + String(Int(slider.value+1)) + " of year"
        }
        else if move < 40 {
            mv04()
            catImage.frame.origin.x = 20 + 49 * (move-30)
            gradientView.frame.origin.x = 510 - 49 * (move-30)
            gradationMove = NSNumber(value: Float(move-30)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.red.cgColor, colorname1: UIColor.purple.cgColor, colorname2: UIColor.blue.cgColor)
            sliderLabel.text = "9~11 \n" + String(Int(slider.value+1)) + " of year"
        }
        else {
            
            sliderLabel.text = "9~11 \n" + String(Int(slider.value)) + " of year"
        }
    }
   
    @IBAction func clickButton(_ sender: UIButton) {
        let speechUtterance =  AVSpeechUtterance(string: label.text!)
        speechUtterance.voice =   AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.rate = 0.5
        speechUtterance.pitchMultiplier = 1.0
        let synthesizer = AVSpeechSynthesizer()
        let move = CGFloat(slider.value)
        var gradationMove = NSNumber(value: Float(move)/10)
        if slider.value < 1 {
            mv01()
            catImage.frame.origin.x = 20 + 49 * move
            gradientView.frame.origin.x = 510 - 49 * move
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.red.cgColor, colorname1: UIColor.darkGray.cgColor,colorname2: UIColor.green.cgColor)
            sliderLabel.text = "12~2 \n" + String(Int(slider.value + 1)) + " of year"
            slider.value = slider.value + 1
            sender.setTitle("❤︎", for: UIControl.State.normal)
        }
        else if slider.value < 10 {
            catImage.frame.origin.x = 20 + 49 * move
            gradientView.frame.origin.x = 510 - 49 * move
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.red.cgColor, colorname1: UIColor.darkGray.cgColor,colorname2: UIColor.green.cgColor)
            sliderLabel.text = "12~2 \n" + String(Int(slider.value + 1)) + " of year"
            slider.value = slider.value + 1
            synthesizer.speak(speechUtterance)
        }
        else if slider.value < 20 {
            mv02()
            catImage.frame.origin.x = 20 + 49 * (move-10)
            gradientView.frame.origin.x = 510 - 49 * (move-10)
            gradationMove = NSNumber(value: Float(move-10)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.gray.cgColor, colorname1: UIColor.blue.cgColor, colorname2: UIColor.orange.cgColor)
            sliderLabel.text = "12~2 \n" + String(Int(slider.value + 1)) + " of year"
            slider.value = slider.value + 1
            sender.setTitle("❤︎", for: UIControl.State.normal)
            synthesizer.speak(speechUtterance)
        }
        else if slider.value < 30 {
            mv03()
            catImage.frame.origin.x = 20 + 49 * (move-20)
            gradientView.frame.origin.x = 510 - 49 * (move-20)
            gradationMove = NSNumber(value: Float(move-20)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.blue.cgColor, colorname1: UIColor.cyan.cgColor, colorname2: UIColor.purple.cgColor)
            sliderLabel.text = "6~8 \n" + String(Int(slider.value+1)) + " of year"
            slider.value = slider.value + 1
            sender.setTitle("❤︎", for: UIControl.State.normal)
            synthesizer.speak(speechUtterance)
        }
        else if slider.value < 40 {
            mv04()
            catImage.frame.origin.x = 20 + 49 * (move-30)
            gradientView.frame.origin.x = 510 - 49 * (move-30)
            gradationMove = NSNumber(value: Float(move-30)/10)
            personGradient(gradationNumber: gradationMove, colorname0: UIColor.red.cgColor, colorname1: UIColor.purple.cgColor, colorname2: UIColor.blue.cgColor)
            sliderLabel.text = "9~11 \n" + String(Int(slider.value+1)) + " of year"
            slider.value = slider.value + 1
            sender.setTitle("❤︎", for: UIControl.State.normal)
            synthesizer.speak(speechUtterance)
            
        }
        else {
            sender.setTitle("✹", for: UIControl.State.normal)
            catImage.frame.origin.x = 20 + 49 * (move-30)
            gradientView.frame.origin.x = 510 - 49 * (move-30)
            label.text = "blackCatTrip"
            sliderLabel.text = "a wonderful year"
        }
        
    }
    
   
}

