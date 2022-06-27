//
//  PushButton.swift
//  UIControls
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct PushButton: View {
    
    let title: String
    @Binding var isOn: Bool
    
    var offColors = [Color.gray, Color.blackStart]
    var onColors = [Color.blueStart, Color.blue]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .frame(height: 0)
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}















struct PushButton_Previews: PreviewProvider {
    
    @State static var isOn = false
    @State static var isOff = true
    
    static var previews: some View {
        
        VStack {
            PushButton(title: "Press", isOn: $isOn)
            PushButton(title: "Pressed", isOn: $isOff)
        }
    }
}
