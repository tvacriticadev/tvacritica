//
//  RadioPlayer.swift
//  Acritica FM 93
//
//  Created by Administrador on 14/10/16.
//  Copyright © 2016 EasyTiDev. All rights reserved.
//
//http://servidor1.crossdigital.com.br:8104
//http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8


import AVFoundation
import MediaPlayer

class RadioPlayer {
    
    static let sharedInstance = RadioPlayer()
    
    private var player = AVPlayer(url: NSURL(string: "http://servidor1.crossdigital.com.br:8104")! as URL)
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
    
    
}

