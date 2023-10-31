//
//  LocationNotFoundView.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct LocationNotFoundView: View {
      var body: some View {
          ZStack(alignment: .center){
              Color.clear
                  .ignoresSafeArea(.all)
                  .background(.ultraThinMaterial)
              
              VStack(spacing: 30){
                  Image(systemName: "location.fill")
                      .font(.system(size: 88))
                      .foregroundColor(Color("color"))
                  
                  HStack{
                      Text("Correct")
                          .font(.title)
                          .fontWeight(.bold)
                          .multilineTextAlignment(.center)
                      
                      Text("Location")
                          .font(.title)
                          .fontWeight(.bold)
                          .foregroundColor(Color("color"))
                          .multilineTextAlignment(.center)
                  }
                  Text("To access the most accurate prayer times instantly through the Salah app, you need to allow location access.")
                      .font(.system(size: 15))
                      .fontWeight(.light)
                      .multilineTextAlignment(.leading)
                      .padding()
                  
                  Text("We only need your location information while you are using the app. This enables us to provide prayer times specific to your location and is not shared with any other parties.")
                      .font(.system(size: 15))
                      .fontWeight(.light)
                      .multilineTextAlignment(.leading)
                      .padding()
                  
                  Spacer()
                  
                  Button {
                      if let url = URL(string: UIApplication.openSettingsURLString){
                          UIApplication.shared.open(url, options: [:], completionHandler: nil)
                      }
                           
                  } label: {
                      Image(systemName: "location.fill")
                          .font(.system(size: 22).bold())
                          .foregroundColor(.white)
                      
                      Text("Allow Location Access")
                          .frame(minWidth: 0, maxWidth: .infinity)
                          .foregroundColor(.white)
                  }
                  .padding()
                  .background(Color("color"))
                  .cornerRadius(15)
                  
                  Text("Enable Location Access from Settings")
                      .font(.system(size: 15))
                      .foregroundColor(.gray)
              }
              .padding(30)
          }
    }
}

struct LocationNotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        LocationNotFoundView()
            .preferredColorScheme(.dark)
    }
}
