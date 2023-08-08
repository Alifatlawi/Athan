//
//  PrayerTimeHeader.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct PrayerTimeHeader: View {
    
    let prayerName: String
    let prayerTime: Date
    let location: String
    let currentDate = Date()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let hijriCalender = Calendar(identifier: .islamicUmmAlQura)
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            VStack(spacing: 20){
                VStack{
                    HStack{
                        Text("Blessed")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Days")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("color"))
                    }
                    .padding()
                    
                    Text("\(prayerName) Time")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorIcon"))
                }
                .padding(.horizontal)
                
                VStack {
                    Text("\(prayerTime, style: .timer)")
                        .font(.system(size: 64))
                        .fontWeight(.semibold)
                }
                HStack{
                 Text("\(getFormattedDate(date: currentDate, calendar: hijriCalender))")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorIcon"))
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
            .padding(.top)
            HStack{
                Text("\(location)")
                    .bold()
                
                Image(systemName: "location.circle.fill")
                    .foregroundColor(Color("color"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
    func getFormattedDate(date: Date, calendar: Calendar) -> String {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
            let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = "yyyy MMMM dd"
        let formatteDate = dateFormatter.string(from: calendar.date(from: components) ?? date)
        return formatteDate
    }
}
