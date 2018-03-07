//
//  ViewController.swift
//  StupidProjectXCode
//
//  Created by Lamb, Isaac on 10/6/17.
//  Copyright © 2017 Lamb, Isaac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Imageview: UIImageView!
    @IBOutlet weak var Slider: UISlider!
    
    private var imageCounter = 0
    private var images: [String] = ["image1", "image2", "image3"]
    private var soundPlayer: AVAudioPlayer?
    
    @IBAction func prev(_ sender:UIButton) {
        imageCounter -= 1
        image()
        view.backgroundColor = randColor()
    }
    @IBAction func next(_ sender:UIButton) {
        imageCounter += 1
        image()
        view.backgroundColor = randColor()
    }
/*    @IBAction func slide(_ sender:UISlider) {
        let num = 1/3
        if (Slider.value <= num) {
            imageFrame.image = UIImage(named: "image1")
        }
        if (Slider.value > num && Slider.value < (num * 2)) {
            imageFrame.image = UIImage(named: "image2")
        }
        if (Slider.value <= (num * 2)) {
            imageFrame.image = UIImage(named: "image3")
        }
    } */
    
    private func image () -> Void {
        let file = images.index(after: imageCounter)
        if (imageCounter > images.count) {
            imageCounter = 0
        }
        if (imageCounter < 0) {
            imageCounter = images.count
        }
        if (imageCounter == 0) {
            Imageview.image = UIImage(named: file)
        }
        if (imageCounter == 1) {
            Imageview.image = UIImage(named: "image2")
        }
        if (imageCounter == 2) {
            Imageview.image = UIImage(named: "image3")
        }
    }
    private func randColor() -> UIColor {
        let rand :UIColor
        let redValue : CGFloat = CGFloat (Double (arc4random_uniform(256)) / 255.00)
        let greenValue :CGFloat = CGFloat (Double (arc4random_uniform(256)) / 255.00)
        let blueValue :CGFloat = CGFloat (Double (arc4random_uniform(256)) / 255.00)
        rand = UIColor (red : redValue, green : greenValue, blue : blueValue, alpha : CGFloat(1.0))
        return rand
    }
    private func loadAudioFile() -> Void {
        if let soundURL = NSDataAsset(name: "The_Ultimate_Showdown_of_Ultimate_Destiny") {
            do {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                try soundPlayer = AVAudioPlayer(data: soundURL.data, fileTypeHint: AVFileType.mp3.rawValue)
                soundSlider.maximumValue = Float ((soundPlayer?.duration)!)
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: (#selector)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

