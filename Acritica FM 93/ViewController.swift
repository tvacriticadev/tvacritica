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

    @IBOutlet weak var myVolumeController: UISlider!
    @IBAction func controlVolume(_ sender: AnyObject) {
        RadioPlayer.sharedInstance.mudaVolume(volume: myVolumeController.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TRY CATCH PARA PLAY EM BACKBROUND
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
    }

    
    @IBAction func playButtonPressed(_ sender: AnyObject) { //ACTION DO BOTÃO PLAY/PAUSE
        
        toggle()//COMUTA PARA O STREAMING
        
    }
    
    
    func toggle() {//VERIFICA SE ESTÁ TOCANDO
        
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


}

