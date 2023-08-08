//
//  AthanTimeTable.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct AthanTimeTable: View {
    
    let gridItems = Array(repeating: GridItem(.flexible()), count: 3)
    let prayerClass: PrayerTimesClass
    
    var body: some View {
        VStack(alignment: .leading){
            LazyVGrid(columns: gridItems, spacing: 6) {
                ForEach(0..<1) { _ in
                    PrayerTimeTableItem(prayerName: "Fajr", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.fajr))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    PrayerTimeTableItem(prayerName: "Sunrise", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.sunrise))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    PrayerTimeTableItem(prayerName: "Dhuhr", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.dhuhr))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    PrayerTimeTableItem(prayerName: "Asr", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.asr))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    PrayerTimeTableItem(prayerName: "Maghrib", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.maghrib))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    PrayerTimeTableItem(prayerName: "Isha", prayerTime: "\(prayerClass.formattedPrayerTime(prayerClass.prayers?.isha))")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fill)
                        .background(.ultraThinMaterial)
                        .cornerRadius(22)
                    
                }
            }
        }
    }
}

struct AthanTimeTable_Previews: PreviewProvider {
    static var previews: some View {
        AthanTimeTable(prayerClass: PrayerTimesClass())
            .preferredColorScheme(.dark)
    }
}
