//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Marcell Julienne on 14/05/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import MediaPlayer

var musicP = MPMusicPlayerController.applicationMusicPlayer
var displayString: String?
var title = ["Lament, Pt.II by myuu", "Loveable by www.bensound", "Memento by myuu","Tender Remains by myuu","Shelter by myuu" ]
var whichTitlestoChoose = 1


class ViewController: UIViewController {

    @IBOutlet weak var logoDowncast: UIImageView!
    @IBOutlet weak var uimoonImage: UIImageView!
    @IBOutlet weak var view1: UIView!

    
    
//    func playMusicBytitle(){
//
//        chooseATitle()
//
//        MPMediaLibrary.requestAuthorization { (status) in if status == .authorized{
//            playTitle(title: displayString!)
//            }
//        }
//    }
    
    var skView: SKView!
    var player:AVAudioPlayer = AVAudioPlayer()
    var isRain: Bool = false
    var isPause: Bool = false
    @IBOutlet weak var labelCredit: UILabel!
//    @IBOutlet weak var rainSwitch: UISwitch!
    @IBOutlet weak var rainButton: UIButton!
    var musicPlayer:AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var rainBackgroundLabel: UILabel!
    
    @IBAction func stopButton(_ sender: UIButton) {
        lightTapped()
        if isPause == false{
        player2.pause()
            isPause = true
        }
        else{
            player2.play()
            isPause = false
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundMusic(forResource: "backgroundmusic3")
        setupUIScene()
        logoDowncast.alpha = 0.3
        rainBackgroundLabel.isHidden = true
        
        view1.isUserInteractionEnabled = true
        
        let swipeLeft = UISwipeGestureRecognizer (target: self, action: #selector(ViewController.viewSwipped(gesture:)))
        swipeLeft.direction = .left
        view1.addGestureRecognizer(swipeLeft)
        musicLabel.text = "Lament, Pt.II by myuu"
//        playMusicThroughLabel()
    }
    
    @objc func viewSwipped(gesture: UIGestureRecognizer){
        chooseATitle()
        
        if let swippedView = gesture.view {
            if swippedView.tag == 1 {
                musicLabel.leftToRightAnimation()
                musicLabel.text = displayString
                playMusicThroughLabel()
            }
            else{
                musicLabel.leftToRightAnimation()
                musicLabel.text = displayString
                playMusicThroughLabel()
            }
        }
        
    }
    
    
    func moonImageShrink(){
        UIView.animate(withDuration: 1.0, animations: {
            self.uimoonImage.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            self.uimoonImage.frame.origin.y += 175
        }, completion: nil)
        rainBackgroundLabel.isHidden = false
    }
    
    func moonImageExpand(){
        UIView.animate(withDuration: 1.0, animations: {
            self.uimoonImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.uimoonImage.frame.origin.y -= 175
        }, completion: nil)
        rainBackgroundLabel.isHidden = true
    }
    
    @IBAction func rainButtonChanged(_ sender: UIButton) {
        if isRain == false {
            backgroundRain()
            setupEmitterScene()
            lightTapped()
            isRain = true
            moonImageShrink()
        }
        else
        {
            setupUIScene()
            lightTapped()
            player.volume = 0
            isRain = false
            moonImageExpand()
        }
    }
    

    func lightTapped()
    {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.prepare()
    generator.impactOccurred()
    }
        
    func backgroundRain(){
        
        do{
            let audioPath = Bundle.main.path(forResource: "backgroundrain", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            
        }
        let session = AVAudioSession.sharedInstance()
        
        do{
            try session.setCategory(AVAudioSession.Category.ambient)
            try session.setActive(true)
        }
        catch{
            
        }
        player.volume = 0.1
        player.numberOfLoops = -1
        player.play()
        
    }
    
    
    func setupUIScene() {
        let scene = GameScene(size: CGSize(width: self.view.frame.maxX, height: self.view.frame.maxY))
        scene.scaleMode = .aspectFill
        skView = self.view as? SKView
        skView.presentScene(scene)
        print("test")
    }
    
    func setupEmitterScene() {
        let scene = EmitterScene(size: CGSize(width: self.view.frame.maxX, height: self.view.frame.maxY))
        scene.scaleMode = .aspectFill
        skView = self.view as? SKView
        skView.presentScene(scene)
        print("test")
    }

}

func chooseATitle(){
    displayString = title[whichTitlestoChoose]
    
    if whichTitlestoChoose < 4{
        whichTitlestoChoose += 1
    }
    else{
        whichTitlestoChoose = 0
    }
}


var player2:AVAudioPlayer = AVAudioPlayer()

func backgroundMusic(forResource: String){
    
    do{
        let audioPath = Bundle.main.path(forResource: "Lament, Pt.II by myuu", ofType: "mp3")
        try player2 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch{
        
    }
    let session = AVAudioSession.sharedInstance()
    
    do{
        try session.setCategory(AVAudioSession.Category.ambient)
        try session.setActive(true)
    }
    catch{
        
    }
    player2.volume = 0.4
    player2.numberOfLoops = -1
    player2.play()
    
}

func playMusicThroughLabel(){
    do{
        let audioPath = Bundle.main.path(forResource: displayString, ofType: "mp3")
        try player2 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch{

    }
    let session = AVAudioSession.sharedInstance()

    do{
        try session.setCategory(AVAudioSession.Category.ambient)
        try session.setActive(true)
    }
    catch{

    }
    player2.volume = 0.4
    player2.numberOfLoops = -1
    player2.play()

}

//func playTitle(title: String){
//
//    musicP.stop()
//    let query = MPMediaQuery()
//    let predicate = MPMediaPropertyPredicate(value: uname, forProperty: MPMediaItemPropertyTitle)
//
//    query.addFilterPredicate(predicate)
//
//    musicP.setQueue(with: query)
//    musicP.play()
//
//}


extension UIView{
    func leftToRightAnimation(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil){
        let leftToRightTransition = CATransition()
        
        if let delegate: AnyObject = completionDelegate{
            leftToRightTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        leftToRightTransition.type = CATransitionType.push
        leftToRightTransition.subtype = CATransitionSubtype.fromRight
        leftToRightTransition.duration = duration
        leftToRightTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        self.layer.add(leftToRightTransition, forKey: "leftToRightTransition")
    }
}
