//
//  ContentView.swift
//  UIControls
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    @State private var panValue: Double = 0
    @State var percentage: Float = 50

    var body: some View {
        VStack {
            PushButton(title: "Play", isOn: $isPlaying)
            
            VStack {
                HStack {
                    Text("L")
                    Slider(value: $panValue, in: -100...100)
                    Text("R")
                }
                .padding()
                Text("Pan: \(panValue, specifier: "%.1f")")
                
                CustomSlider(percentage: $percentage)
                     .accentColor(.purple)
                     .frame(height: 44)
                     .padding(.horizontal)
                Text("\(percentage, specifier: "%.1f")%")
                
                Knob()
                    .padding()
            }
        }
        
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
