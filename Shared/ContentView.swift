//
//  ContentView.swift
//  Shared
//
//  Created by Tuan Son Nguyen on 31/12/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var dataViewModel = DataViewModel()

    var body: some View {
        
        VStack {
            Group {
                if dataViewModel.data != nil {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "thermometer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60, alignment: .center)
                            .foregroundColor(Color("TextColorMain"))
                            .opacity(0.8)
                            
                        Text("\(dataViewModel.data!.temperature)°C")
                            .font(.system(size: 30, design: .rounded))
                            .foregroundColor(Color("TextColorMain"))
                        
                        Spacer()
                        
                        Image(systemName: "drop.triangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60, alignment: .center)
                            .foregroundColor(Color("TextColorMain"))
                            .opacity(0.8)
                        
                        Text("\(dataViewModel.data!.humidity)%")
                            .font(.system(size: 30, design: .rounded))
                            .foregroundColor(Color("TextColorMain"))
                        
                        Spacer()
                    }
                        .frame(maxWidth: .infinity)
                        .frame(height: 100, alignment: .center)
                    
                    HStack {
                        Text("Connected")
                            .foregroundColor(Color("TextColorBlue"))
                            .font(.system(size: 16, design: .rounded))
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 20, alignment: .center)
                    
                    HStack {
                        Text("Last Updated: \(dataViewModel.data!.timestamp)")
                            .foregroundColor(Color("TextColorSubheading")).opacity(0.3)
                            .font(.system(size: 16, design: .rounded))
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 20, alignment: .center)
                }
                else {
                    Text("Loading..")
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("StartColor"), Color("EndColor")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
