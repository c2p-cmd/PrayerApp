//
//  AudioView.swift
//  PrayerApp Watch App
//
//  Created by Sharan Thakur on 13/04/23.
//

import Foundation
import AVFoundation
import SwiftUI

struct AudioView: View {
    var index: Int = 0
    var title: String = "Hanuman Chalisa"
    
    private let bhajanPlayer = AudioModel()
    @State private var isPlaying = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
            Image(systemName: self.isPlaying ? "pause.fill" : "play.circle")
                .foregroundColor(Color.green)
            .offset(y: 50)
            .buttonStyle(.borderless)
        }.onDisappear {
            bhajanPlayer.stop()
        }.onTapGesture {
            btnAction()
        }
    }
    
    private func btnAction() {
        isPlaying.toggle()
        if bhajanPlayer.isPlaying() {
            bhajanPlayer.pause()
            return
        }
        bhajanPlayer.play(index: index)
    }
}

struct AudioView_Previews: PreviewProvider {
    static var previews: some View {
        AudioView(title: "Ganesh Aarti")
    }
}
