//
//  ContentView.swift
//  PrayerApp Watch App
//
//  Created by Sharan Thakur on 13/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<4) { i in
                    NavigationLink {
                        AudioView(index: i, title: bhajanTitles[i])
                    } label: {
                        ButtonWithBG(title: "Play \"\(bhajanTitles[i])\"")
                            .frame(height: 45)
                    }
                }
            }
        }.navigationTitle("Bhajan Chooser")
    }
}

struct ButtonWithBG: View {
    @StateObject private var motion: MotionManager = MotionManager()
    var title: String
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFit()
            
            VStack {
                Image("pxfuel")
                    .resizable()
                    .offset(x: motion.x * 50, y: motion.y * 50)
                    .mask {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                    }
                    .shadow(
                        color: Color(#colorLiteral(
                            red: 0.5725490196,
                            green: 0.5725490196,
                            blue: 0.6862745098,
                            alpha: 1)
                        ),
                        radius: 2, x: 0, y: 0
                    )
                    .rotation3DEffect(.degrees(motion.x * 5), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(motion.y * 5), axis: (x: -1, y: 0, z: 0))
            }
            
            Text(title)
                .font(.headline)
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color(#colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 0.82)), Color(#colorLiteral(red: 0.5141947269, green: 0.5141947269, blue: 0.5141947269, alpha: 1))],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
