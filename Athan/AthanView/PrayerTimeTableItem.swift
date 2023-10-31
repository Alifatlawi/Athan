//
//  PrayerTimeTableItem.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct PrayerTimeTableItem: View {
    
    let prayerName: String
    let prayerTime: String
    @State var isPlayin = true
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                VStack{
                    ZStack{
                        VStack(alignment: .trailing){
                            Button(action: {
                                isPlayin.toggle()
                            }, label: {
                                Image(systemName: "clock.circle.fill")
                                    .foregroundColor(Color("color"))
                                    .padding(.leading, 60)
                                    .padding(.bottom, 70)
                            })
                        }
                        VStack(alignment: .leading){
                            Text(prayerName)
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .frame(maxHeight: 15, alignment: .leading)
                            
                            Text(prayerTime)
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .padding(.trailing, 15)
                        .padding(.top, 30)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}

struct PrayerTimeTableItem_Previews: PreviewProvider {
    static var previews: some View {
        PrayerTimeTableItem(prayerName: "Fajr", prayerTime: "04:17:00")
            .preferredColorScheme(.dark)
    }
}
