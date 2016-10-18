//
//  ViewController.swift
//  Acritica FM 93
//
//  Created by Administrador on 14/10/16.
//  Copyright © 2016 EasyTiDev. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            print("Receiving remote control events\n")
        } catch {
            print("Audio Session error.\n")
        }
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func playButtonPressed(_ sender: AnyObject) {
        
        toggle()
        
    }
    
    
    func toggle() {
        
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    
    func playRadio() {
        RadioPlayer.sharedInstance.play()
        playButton.setTitle("Pause", for: UIControlState.normal)
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playButton.setTitle("Play", for: UIControlState.normal)
        
    }
    //Criação do Método WebView
   // @IBOutlet weak var faceWebView: UIWebView!
    
    //webView.
    
    
}

