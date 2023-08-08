//
//  AthanHome.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct AthanHome: View {
    var body: some View {
        AthanView(prayerClass: PrayerTimesClass())
     
    }
}

struct AthanHome_Previews: PreviewProvider {
    static var previews: some View {
        AthanHome()
    }
}
