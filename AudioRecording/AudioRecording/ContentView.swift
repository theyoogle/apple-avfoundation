//
//  ContentView.swift
//  AudioRecording
//
//  Created by The YooGle on 29/06/22.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    let recorderConductor = RecorderConductor()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
