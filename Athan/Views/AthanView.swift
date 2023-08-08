//
//  AthanView.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct AthanView: View {
    
    @ObservedObject var prayerClass: PrayerTimesClass
    @State private var isPresented = false
    @State private var isShowSettings = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bg")
                    .ignoresSafeArea()
                ScrollView{
                    if let error = prayerClass.error {
                        VStack{}
                        .onAppear{
                            isPresented = true
                        }
                    } else {
                        if let prayers = prayerClass.prayers {
                            if let nextPrayer = prayers.nextPrayer(){
                                PrayerTimeHeader(prayerName: "\(nextPrayer)", prayerTime: prayers.time(for: nextPrayer), location: prayerClass.city ?? "__")
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                        PrayerTimeHeader(prayerName: "Imsak", prayerTime: Date(), location: prayerClass.city ?? "__")
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    AthanTimeTable(prayerClass: prayerClass)
                                        .listRowSeparator(.hidden)
                                        .onAppear {
                                            isPresented = false
                                        }
                                }
                            }
                        }
                .navigationTitle("Athan")
                
                .fullScreenCover(isPresented: $isPresented, content: { LocationNotFoundView() })
                
                .onAppear{
                    prayerClass.startUpdatingLocation()
                }
                .onDisappear{
                    prayerClass.stopUpdatingLocation()
                      }
                   }
        
               }
      
            }
          
        }

struct AthanView_Previews: PreviewProvider {
    static var previews: some View {
        AthanView(prayerClass: PrayerTimesClass())
            .preferredColorScheme(.dark)
            
    }
}
