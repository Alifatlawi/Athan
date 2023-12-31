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
    
    func getIconName(for prayer: String) -> String {
            switch prayer {
            case "Fajr":
                return "sunrise.fill"
            case "Dhuhr":
                return "sun.max.fill"
            case "Asr":
                return "cloud.sun.fill"
            case "Maghrib":
                return "sunset.fill"
            case "Isha":
                return "moon.fill"
            default:
                return "sunrise.fill"  // default icon if prayer name doesn't match
            }
        }
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                VStack{
                    ZStack{
                        VStack(alignment: .trailing){
                            Button(action: {
                                isPlayin.toggle()
                            }, label: {
                                HStack {
                                    Image(systemName: getIconName(for: prayerName))
                                        .foregroundColor(Color("color"))
                                        .padding(.leading, 60)
                                    .padding(.bottom, 70)
                                }
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
