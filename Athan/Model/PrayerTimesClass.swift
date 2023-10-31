//
//  PrayerTimesClass.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import Adhan
import CoreLocation
import SwiftUI
import UserNotifications

class PrayerTimesClass: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private let gecoder = CLGeocoder()
    
    @Published var prayers: PrayerTimes?
    @Published var city: String?
    @Published var error: Error?
    
    
    var notificationSettings: [String: Bool] = [
        "Fajr": true,
        "Dhuhr": true,
        "Asr": true,
        "Maghrib": true,
        "Isha": true
    ]
    
    private var notificationCenter: UNUserNotificationCenter {
        UNUserNotificationCenter.current()
    }
    
    func scheduleNotification(for prayerTime: Date, with prayerName: String, note: String?) {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "\(prayerName) Prayer Time", arguments: nil)
        if let note = note, !note.isEmpty {
            content.body = NSString.localizedUserNotificationString(forKey: note, arguments: nil)
        } else {
            content.body = NSString.localizedUserNotificationString(forKey: "\(prayerName) prayer is at \(formattedPrayerTime(prayerTime))", arguments: nil)
        }
        
        // Set the sound for the notification
        content.sound = UNNotificationSound.default

        let prayerComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: prayerTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: prayerComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }


    func schedulePrayerTimeNotifications() {
        guard let prayers = prayers else {
            print("Cannot schedule notifications because prayer times are not available yet.")
            return
        }
        
        let prayerTimes = [
            ("Fajr", prayers.fajr, UserDefaults.standard.string(forKey: "Fajr Note")),
            ("Dhuhr", prayers.dhuhr, UserDefaults.standard.string(forKey: "Dhuhr Note")),
            ("Asr", prayers.asr, UserDefaults.standard.string(forKey: "Asr Note")),
            ("Maghrib", prayers.maghrib, UserDefaults.standard.string(forKey: "Maghrib Note")),
            ("Isha", prayers.isha, UserDefaults.standard.string(forKey: "Isha Note")),
        ]
        
        notificationCenter.removeAllPendingNotificationRequests()
        for (prayerName, prayerTime, note) in prayerTimes {
            if notificationSettings[prayerName] == true {
                scheduleNotification(for: prayerTime, with: prayerName, note: note)
            }
        }
    }

    
    func ubdateNotificationSettings(for prayerName: String, sendNotification: Bool){
        
        notificationSettings[prayerName] = sendNotification
        schedulePrayerTimeNotifications()
        
        
        let defaults = UserDefaults.standard
        defaults.set(notificationCenter, forKey: "notificationSettings")
    }
    
    override init() {
        
        super.init()
        
        
        let defaults = UserDefaults.standard
        if let savedSettings = defaults.object(forKey: "notificationSettings") as? [String: Bool] {
            notificationSettings = savedSettings
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                print("Error requesting authorization for notifications: \(error.localizedDescription)")
            } else if granted {
                print("User granted permission for notifications.")
            } else {
                print("User denied permission for notifications.")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        let coordinates = Coordinates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let params = CalculationMethod.turkey.params
        
        let components = Calendar.current.dateComponents([.year, .month, .day], from: location.timestamp)
        let prayerTimes = PrayerTimes(coordinates: coordinates, date: components, calculationParameters: params)
        
        DispatchQueue.main.async {
            self.prayers = prayerTimes
            self.error = nil
            
            self.schedulePrayerTimeNotifications()
        }
        gecoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = error
                }
            }else if let placemarks = placemarks? .first {
                DispatchQueue.main.async {
                    self.city = placemarks.locality ?? placemarks.administrativeArea ?? placemarks.country ?? "Unknown location"
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
    
    func startUpdatingLocation() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func formattedPrayerTime(_ prayerTime: Date?) -> String {
        guard let prayerTime = prayerTime else { return "N/A" }
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone.current
        
        return formatter.string(from: prayerTime)
    }
}
