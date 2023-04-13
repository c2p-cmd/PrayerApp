//
//  AudioModel.swift
//  PrayerApp Watch App
//
//  Created by Sharan Thakur on 13/04/23.
//

import Foundation
import AVFoundation

class AudioModel {
    private var audioPlayer: AVAudioPlayer!
    
    func isPlaying() -> Bool {
        if self.audioPlayer == nil {
            return false
        }
        
        return self.audioPlayer.isPlaying
    }
    
    func play(index i: Int) {
        let bhajan = bhajans[i]
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bhajan))
            self.audioPlayer.setVolume(1, fadeDuration: .zero)
            self.audioPlayer.play()
        } catch {
            print("Error was thrown")
        }
    }
    
    func pause() {
        if self.audioPlayer != nil {
            self.audioPlayer.pause()
        }
    }
    
    func stop() {
        if self.audioPlayer != nil {
            self.audioPlayer.stop()
        }
    }
}
