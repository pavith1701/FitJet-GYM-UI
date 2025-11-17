//
//  LoginView.swift
//  FitJet
//
//  Created by Pavithran P K on 13/11/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("FitJetHomeImg")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("FIT-JET WORKOUT PLANNER").foregroundStyle(.white)
                    Spacer().frame(height: geo.size.height * 0.03)
                    Text("VOLUME UP YOUR BODY GOALS")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    Spacer().frame(height: geo.size.height * 0.7)
                    VStack{
                        Button(action: {
                            
                        }, label: {
                            Text("START BUILDING YOUR BODY")
                                .padding()
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .background(Color.yellow)
                                .cornerRadius(12)
                                
                        })
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
