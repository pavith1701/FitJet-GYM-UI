//
//  HomeView.swift
//  FitJet
//
//  Created by Pavithran P K on 15/11/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedIndex = 0
    @State var arrayList = [DataModelMain]()
    @State var urlImg = "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/"
    
    let items = ["MucelesFont", "gymfont", "exerciseFont"]
    
    let Apiconfig = ApiConfigAF()
    
    var body: some View {
        
        GeometryReader{ proxy in
            let screenCenter = proxy.size.width / 2
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "#f7f8f8"),Color(hex: "#f7f8f8")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image("FitJetHomeImg").resizable().frame(width: 90, height: 90)
                            .clipShape(.circle)
                            .overlay(
                                Circle().stroke(Color.gray,lineWidth: 4)
                            )
                        Spacer().frame(width: proxy.size.width*0.06)
                        VStack {
                            Text("Welcome Back").font(.system(size: 17,weight: .light))
                                .foregroundStyle(.black)
                            Text("Pavithran P K").font(.system(size: 20,weight: .semibold))
                                .foregroundStyle(.black)
                        }
                        Spacer().frame(width: proxy.size.width*0.3)
                        
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0.05) {
                            ForEach(items.indices, id: \.self) { index in
                                
                                GeometryReader { itemGeo in
                                    let itemCenter = itemGeo.frame(in: .global).midX
                                    
                                    // distance from item to center of screen
                                    let distance = abs(screenCenter - itemCenter)
                                    
                                    // smaller distance → bigger scale
                                    let scale = max(0.8, 1.2 - (distance / 300))
                                    
                                    Image(items[index])
                                        .resizable()
                                        .cornerRadius(20)
                                        .scaleEffect(scale)
                                        .animation(.easeInOut, value: distance)
                                }
                                .frame(width: 250, height: 160)
                            }
                            .padding()
                        }
                        .padding(.horizontal, 40)
                    }
                    Spacer().frame(height: proxy.size.height*0.02)
                    List {
                        
                        ForEach(arrayList.indices, id: \.self) { item in
                            
                            HStack(spacing: 15) {
                                let img = arrayList[item].images
                                AsyncImage(url: URL(string: urlImg + String(img[0]))) { image in
                                    image
                                        .resizable()
                                        
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .cornerRadius(20)
                                
                                    
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(arrayList[item].name ?? "")
                                        .font(.headline)
                                        .foregroundColor(.black)

                                    Text(arrayList[item].equipment ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()
                            }
                            .frame(height: 70)
                            .padding()
                            .background(Color(hex: "e5e6e6"))
                            .cornerRadius(20)
                            .padding(.vertical,-10)
                                                    }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(hex: "f7f8f8"))
                        
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    
                }
                .onAppear {
                    getdata()
                }
            }
            
        
            
        }
        
    }
    
    func getdata() {
        let urlRequest = "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json"
        Apiconfig.GetRequestAF(userReq: urlRequest, completion: { result in
            if let responseAfdata = DataModelMain.praseData(data: result) {
                self.arrayList = responseAfdata
                print(arrayList[0].name ?? "")
                print(arrayList[0].images)
            }
        })
    }
    
}

#Preview {
    HomeView()
}
