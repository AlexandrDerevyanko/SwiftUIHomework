//
//  SettingsView.swift
//  SwiftUIHomework
//
//  Created by Aleksandr Derevyanko on 01.06.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsOn = true
    @State private var darkOn = false
    
    @State private var sliderValue = 10.0
    @State private var isChanging = false
    
    var body: some View {
        ZStack {
            Color(darkOn ? .black : .white)
            
            Form {
                Section {
                    Toggle(isOn: $notificationsOn) {
                        Text("Push Notifications")
                    }
                    Toggle(isOn: $darkOn) {
                        Text("Dark Theme")
                    }
                }
                .foregroundColor( Color(notificationsOn ? .darkGray : .blue) )
                
                Slider(value: $sliderValue, in: 0 ... 100) { changed in
                    isChanging = changed
                }
                Text("Progress value: \(Int(sliderValue))")
                    .foregroundColor(.secondary)
                
                ZStack {
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, angle: Angle(radians: sliderValue/10))
                        .ignoresSafeArea(edges: .top)
                    
                    Text("\(isChanging ? "I Like to Move It" : "I see you")")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(height: 200)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
