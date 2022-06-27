//
//  ContentView.swift
//  SpeechSynth
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct ContentView: View {
    
    private let conductor = SpeechConductor()
    
    var body: some View {
        Button {
            conductor.beginConversation()
        } label: {
            Text("Hello")
                .padding()
                .border(Color.blue, width: 1.0)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
