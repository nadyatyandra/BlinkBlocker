//
//  MusicPlayer.swift
//  VisionFaceTrack
//
//  Created by Nadya Tyandra on 20/05/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func playBackgroundMusic(backgroundMusicFileName: String, format: String) {
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: format) {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
    
    func playSoundEffect(soundEffectFileName: String, format: String) {
        if let bundle = Bundle.main.path(forResource: soundEffectFileName, ofType: format) {
            let soundEffect = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:soundEffect as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = 0
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
