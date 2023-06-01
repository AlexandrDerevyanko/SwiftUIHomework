//
//  ProfileView.swift
//  SwiftUIHomework
//
//  Created by Aleksandr Derevyanko on 10.05.2023.
//

import SwiftUI
import SpriteKit

struct ProfileView: View {

    @Binding var logged: Bool
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if showingAlert {
                    SpriteView(scene: StarsScene.getScene(size: geo.size, 1))
                        .frame(width: geo.size.width, height: geo.size.height)
                } else {
                    SpriteView(scene: StarsScene.getScene(size: geo.size, 2))
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .ignoresSafeArea()

            
            Button("Tap me") {
                showingAlert = true
            }
            .font(.title)
            .foregroundColor(.white)
            .alert("SwiftUI is amazing!", isPresented: $showingAlert) {
                Button("Clear", role: .cancel) {
                    self.logged = false
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(logged: .constant(false))
    }
}
