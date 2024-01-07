//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Laxman Singh Koranga on 07/01/2024.
//

import SwiftUI

struct ContentView: View {
    //    func executeDelete() {
    //        print("Now deleting...")
    //    }
    @State private var showingAlert = false
    
    var body: some View {
        //        VStack() {
        //            Spacer()
        //            Text("Hello, Swift!")
        //            Text("I'm Laxman Singh Koranga.")
        //            Text("I live in Uttrakhand.")
        //            Spacer()
        //            Spacer()
        //        }
        //        ZStack(alignment: .top) {
        //            // overlaps both text views.
        //            Text("Hello, Swift!")
        //            Text("I'm Laxman Singh Koranga.")
        //        }
        //        ZStack {
        //           Color.orange                                // spreads colour to whole screen.
        //                .frame(width: 200, height: 200)
        //               .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        //            Color(red: 0.3, green: 0.6, blue: 0.9)            // if want specific colour.
        //                .frame(width: .infinity, height: .infinity)
        //                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        //            Text("Hello, Swift.")
        //             .background(.orange)                // colours filled the whole area behind the text.
        //        }
        //        .background(.black)
        //        .ignoresSafeArea()
        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            Text("Hello, SwiftUI.")
//            .foregroundStyle(.secondary)
//            .padding(9)
//                           .background(.ultraThinMaterial)
//            .background(.white.gradient)
//
            //            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            //            LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.45), Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom)
            // swift knows we're creating gradient stops here, so we can use ".init" rather than "Gradient.Stop".
            //            LinearGradient(stops: [.init(color: .white, location: 0.45), .init(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom)
            //            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            //            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .orange, .pink, .red], center: .center)
            
            //            Button("Delete Selection") {
            //                print("Now deleting...")
            //            }
            //            Button("Delete selection", role: .destructive, action: executeDelete)
            //        }
            VStack {
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                    .tint(.purple)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                // Used Image.
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                }
                // If we want both text and image at the same time.
                Button("Edit", systemImage: "pencil") {
                    print("Edit button was tapped.")
                }
                // more customized button.
                Button {
                    print("Edit button was tapped.")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding()
                        .foregroundStyle(.black)
                        .background(.green)
                }
                
                
            }
            .ignoresSafeArea()
        }
        // Alert.
        Button("Submit") {
            showingAlert = true
        }
        .alert("Are your sure?", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }                 // destructive role, colours text value red.
            Button("Cancel", role: .cancel) { }                      // cancel role, colours text value blue.
        } message: {
            Text("Please read this.")
        }
    }
}
#Preview {
    ContentView()
}
