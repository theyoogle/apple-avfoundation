//
//  PlayerView.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct PlayerView: View {
    
    @ObservedObject var conductor = AudioPlayerConductor()
    
    @State var volume: Float = 1.0
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    conductor.player.play()
                } label: {
                    Image(systemName: "play")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button {
                    conductor.player.pause()
                } label: {
                    Image(systemName: "pause")
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button {
                    // Stop will undo the setup performed by prepareToPlay()
                    conductor.player.stop()
                } label: {
                    Image(systemName: "stop")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
            HStack {
                Text("Volume")
                Slider(value: $conductor.data.volume)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Pan      ")
                Slider(value: $conductor.data.pan, in: -1...1, step: 0.01)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Rate     ")
                Slider(value: $conductor.data.playbackRate, in: 0.5...2.0, step: 0.01)
            }
            .padding(.horizontal)

        }

    }
}

































struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
