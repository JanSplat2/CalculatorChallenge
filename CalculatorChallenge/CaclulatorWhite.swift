//
//  ContentView.swift
//  CalculatorChallenge
//
//  Created by Dittrich, Jan - Student on 8/29/25.
//

import SwiftUI

struct CalculatorWhite: View {
    var body: some View {
        
        Spacer()
        
        VStack {
            
            Text("0")
                .foregroundStyle(.black)
                .font(.system(size: 110))
                .frame(width: 350, height: 150, alignment: .trailing)
            
            HStack{
                ZStack {
                    Circle()
                        .fill(Color.gray)
                    
                    
                    Text("AC")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ZStack {
                    Circle()
                        .fill(Color.gray)
                    
                    
                    Text("+/-")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ZStack {
                    Circle()
                        .fill(Color.gray)
                    
                    
                    Text("%")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ZStack {
                    Circle()
                        .fill(.orange)
                    
                    Text("÷")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
            HStack{
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("7")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("8")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("9")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(.orange)
                    
                    
                    Text("X")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
            HStack{
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("4")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("5")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("6")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(.orange)
                    
                    
                    Text("-")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
            HStack{
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("1")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("2")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    
                    Text("3")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                ZStack {
                    Circle()
                        .fill(.orange)
                    
                    
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
            HStack{
                
                ZStack{
                    
                    Capsule()
                        .fill(Color(white: 0.35))
                        .frame(width: 200, height: 90)
                    
                    Text("0")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                }
                ZStack{
                    
                    Circle()
                        .fill(Color(white: 0.35))
                    
                    Text(".")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                }
                
                ZStack{
                    
                    Circle()
                        .fill(.orange)
                    
                    Text("=")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                }
                
            }
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

#Preview {
    CalculatorWhite()
    
}
//Test
