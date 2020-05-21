//
//  ContentView.swift
//  DemoStackView
//
//  Created by Rishabh Jain on 21/05/20.
//  Copyright © 2020 Rishabh Jain. All rights reserved.
//

import UIKit
import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var segmentTitle = ["HStack", "VStack", "Vertical Picker"]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Image("fall-leaves")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
            
            Picker("Titles", selection: self.$selectedIndex) {
                
                ForEach(0 ..< self.segmentTitle.count) { index in
                    Text(self.segmentTitle[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.leading, 30)
            .padding(.trailing, 30)
            
            if self.selectedIndex == 0 {
                VerticalView()
            } else if self.selectedIndex == 1 {
                HorizontalView()
            } else {
                WheelPickerStyleView()
            }
        }
    }
}


struct VerticalView: View {
    
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                ForEach(1...8, id: \.self) {i in
                    
                    HStack(spacing: 15) {
                        
                        Image("acc")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80.0,height: 80.0)
                        .cornerRadius(40.0)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Alexa vertical")
                            Text("Index \(i)")
                        }
                        Spacer(minLength: 0)
                        
                    }.padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
                }
                
            }.padding()
        }.padding(EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
    }
}

struct HorizontalView: View {

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {

            VStack(spacing: 15) {

                ForEach(1..<11) {i in
                    HorizonView()
                }
            }
            
        }.padding(EdgeInsets(top: 40.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
    }
}

struct HorizonView: View {
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 15) {
                
                ForEach(1...8, id: \.self) {i in
                    
                    HStack(spacing: 15) {
                        
                        Image("fall-leaves")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80.0,height: 80.0)
                            .cornerRadius(40.0)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Alexa horizontal")
                            Text("Index \(i)")
                        }
                        
                        Spacer(minLength: 0)
                        
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
                
            }.padding()
        }
    }
}

struct WheelPickerStyleView: View {
    
    @State private var selectedIndex = 0
    @State private var segmentTitle = ["HStack", "VStack", "Vertical Picker"]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                Picker("", selection: self.$selectedIndex) {
                    
                    ForEach(0 ..< self.segmentTitle.count) { index in
                        Text(self.segmentTitle[index])
                        .foregroundColor(.red)
                    }
                    
                }
                .frame(width: geometry.size.width - 80.0)
                .pickerStyle(WheelPickerStyle())
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                Text("Selected Value: \(self.segmentTitle[self.selectedIndex])")
                .foregroundColor(.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}


