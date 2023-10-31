import SwiftUI

struct SettingsView: View {
    @State private var fajrNote: String = UserDefaults.standard.string(forKey: "Fajr Note") ?? ""
    @State private var dhuhrNote: String = UserDefaults.standard.string(forKey: "Dhuhr Note") ?? ""
    @State private var asrNote: String = UserDefaults.standard.string(forKey: "Asr Note") ?? ""
    @State private var maghribNote: String = UserDefaults.standard.string(forKey: "Maghrib Note") ?? ""
    @State private var ishaNote: String = UserDefaults.standard.string(forKey: "Isha Note") ?? ""

    var body: some View {
        NavigationView {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Prayer Notes")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    PrayerNoteEntry(iconName: "sunrise.fill", color: .orange, placeholder: "Fajr Note", note: $fajrNote)
                    PrayerNoteEntry(iconName: "sun.max.fill", color: .yellow, placeholder: "Dhuhr Note", note: $dhuhrNote)
                    PrayerNoteEntry(iconName: "cloud.sun.fill", color: .orange, placeholder: "Asr Note", note: $asrNote)
                    PrayerNoteEntry(iconName: "sunset.fill", color: .red, placeholder: "Maghrib Note", note: $maghribNote)
                    PrayerNoteEntry(iconName: "moon.fill", color: .yellow, placeholder: "Isha Note", note: $ishaNote)
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text("App Idea by Souad Haider")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Developed by Ali Alfatalwi")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct PrayerNoteEntry: View {
    var iconName: String
    var color: Color
    var placeholder: String
    @Binding var note: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(color)
            TextField(placeholder, text: $note, onCommit: {
                UserDefaults.standard.set(note, forKey: placeholder)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(10)
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
