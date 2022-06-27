//
//  PlayerView.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct PlayerView: View {
    
    @ObservedObject var conductor = AudioPlayerConductor()
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    conductor.play()
                } label: {
                    Image(systemName: "play")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button {
                    // Stop will undo the setup performed by prepareToPlay()
                    conductor.stop()
                } label: {
                    Image(systemName: "stop")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                HStack {
                    Text("Rate")
                    Slider(value: $conductor.playbackRate, in: 0.5...2.0, step: 0.01)
                }
            }
            .padding(.horizontal)
            
            HStack {
                ForEach(conductor.players.indices, id: \.self) { i in
                    VStack {
                        VStack {
                            Image(conductor.playerImages[i])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(conductor.playerImages[i])
                        }

                        
                        VStack {
                            Slider(value: $conductor.players[i].volume)
                            Text("Volume")
                        }
            
                        VStack {
                            Slider(value: $conductor.players[i].pan, in: -1...1, step: 0.01)
                            Text("Pan")
                        }
                    }
                }
                .padding(.horizontal)
            }

        }

    }
}

































struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
