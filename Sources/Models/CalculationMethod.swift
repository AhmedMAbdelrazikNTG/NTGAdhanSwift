//
//  CalculationMethod.swift
//  Adhan
//
//  Copyright © 2018 Batoul Apps. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/**
  Preset calculation parameters for different regions.

  *Descriptions of the different options*

  **muslimWorldLeague**

  Muslim World League. Standard Fajr time with an angle of 18°. Earlier Isha time with an angle of 17°.

  **egyptian**

  Egyptian General Authority of Survey. Early Fajr time using an angle 19.5° and a slightly earlier Isha time using an angle of 17.5°.

  **karachi**

  University of Islamic Sciences, Karachi. A generally applicable method that uses standard Fajr and Isha angles of 18°.

  **ummAlQura**

  Umm al-Qura University, Makkah. Uses a fixed interval of 90 minutes from maghrib to calculate Isha. And a slightly earlier Fajr time
  with an angle of 18.5°. Note: you should add a +30 minute custom adjustment for Isha during Ramadan.

  **dubai**

  Used in the UAE. Slightly earlier Fajr time and slightly later Isha time with angles of 18.2° for Fajr and Isha in addition to 3 minute
  offsets for sunrise, Dhuhr, Asr, and Maghrib.

  **moonsightingCommittee**

  Method developed by Khalid Shaukat, founder of Moonsighting Committee Worldwide. Uses standard 18° angles for Fajr and Isha in addition
  to seasonal adjustment values. This method automatically applies the 1/7 approximation rule for locations above 55° latitude.
  Recommended for North America and the UK.

  **northAmerica**

  Also known as the ISNA method. Can be used for North America, but the moonsightingCommittee method is preferable. Gives later Fajr times and early
  Isha times with angles of 15°.

  **kuwait**

  Standard Fajr time with an angle of 18°. Slightly earlier Isha time with an angle of 17.5°.

  **qatar**

  Same Isha interval as `ummAlQura` but with the standard Fajr time using an angle of 18°.

  **singapore**

  Used in Singapore, Malaysia, and Indonesia. Early Fajr time with an angle of 20° and standard Isha time with an angle of 18°.

  **tehran**

  Institute of Geophysics, University of Tehran. Early Isha time with an angle of 14°. Slightly later Fajr time with an angle of 17.7°.
  Calculates Maghrib based on the sun reaching an angle of 4.5° below the horizon.

  **turkey**

  An approximation of the Diyanet method used in Turkey. This approximation is less accurate outside the region of Turkey.

  **other**

  Defaults to angles of 0°, should generally be used for making a custom method and setting your own values.

*/
//public enum CalculationMethod: String, Codable, CaseIterable {
//
//    // Muslim World League
//    case muslimWorldLeague
//
//    // Egyptian General Authority of Survey
//    case egyptian
//
//    // University of Islamic Sciences, Karachi
//    case karachi
//
//    // Umm al-Qura University, Makkah
//    case ummAlQura
//
//    // UAE
//    case dubai
//
//    // Moonsighting Committee
//    case moonsightingCommittee
//
//    // ISNA
//    case northAmerica
//
//    // Kuwait
//    case kuwait
//
//    // Qatar
//    case qatar
//
//    // Singapore
//    case singapore
//
//    // Institute of Geophysics, University of Tehran
//    case tehran
//
//    // Dianet
//    case turkey
//
//    // Other
//    case other
//
//    public var params: CalculationParameters {
//        switch(self) {
//        case .muslimWorldLeague:
//            var params = CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
//            return params
//        case .egyptian:
//            var params = CalculationParameters(fajrAngle: 19.5, ishaAngle: 17.5, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
//            return params
//        case .karachi:
//            var params = CalculationParameters(fajrAngle: 18, ishaAngle: 18, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
//            return params
//        case .ummAlQura:
//            return CalculationParameters(fajrAngle: 18.5, ishaInterval: 90, method: self)
//        case .dubai:
//            var params = CalculationParameters(fajrAngle: 18.2, ishaAngle: 18.2, method: self)
//            params.methodAdjustments = PrayerAdjustments(sunrise: -3, dhuhr: 3, asr: 3, maghrib: 3)
//            return params
//        case .moonsightingCommittee:
//            var params = CalculationParameters(fajrAngle: 18, ishaAngle: 18, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 5, maghrib: 3)
//            return params
//        case .northAmerica:
//            var params = CalculationParameters(fajrAngle: 15, ishaAngle: 15, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
//            return params
//        case .kuwait:
//            return CalculationParameters(fajrAngle: 18, ishaAngle: 17.5, method: self)
//        case .qatar:
//            return CalculationParameters(fajrAngle: 18, ishaInterval: 90, method: self)
//        case .singapore:
//            var params = CalculationParameters(fajrAngle: 20, ishaAngle: 18, method: self)
//            params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
//            params.rounding = .up
//            return params
//        case .tehran:
//            return CalculationParameters(fajrAngle: 17.7, maghribAngle: 4.5, ishaAngle: 14, method: self)
//        case .turkey:
//            var params = CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
//            params.methodAdjustments = PrayerAdjustments(fajr: 0, sunrise: -7, dhuhr: 5, asr: 4, maghrib: 7, isha: 0)
//            return params
//        case .other:
//            return CalculationParameters(fajrAngle: 0, ishaAngle: 0, method: self)
//        }
//    }
//}


public enum CalculationMethod: Int, Codable, CaseIterable {
    case karachi              = 1
    case northAmerica         = 2
    case muslimWorldLeague    = 3
    case ummAlQura            = 4
    case egyptian             = 5
    case dubai                = 6
    case kuwait               = 7
    case qatar                = 8
    case singapore            = 9
    case algerian             = 10
    case france               = 11
    case russia               = 12
    case tunisia              = 13
    case turkey               = 14
    case morocco              = 15
    case jordan               = 16
    case oman                 = 17
    case munich               = 18
    case maldives             = 19
    case canada               = 20
    case tajikistan           = 21
    case vienna               = 22
    case belgium              = 23
    case sudan                = 24
    case libya                = 25
    case iraq                 = 26
    case luxembourg           = 27
    case tehran               = 28
    case moonsightingCommittee = 29
    case other                = 30
    
    // MARK: - Human-readable name
    public var name: String {
        switch self {
            case .muslimWorldLeague: return "Muslim World League"
            case .egyptian: return "Egyptian General Authority of Survey"
            case .karachi: return "University of Islamic Sciences, Karachi"
            case .ummAlQura: return "Umm al-Qura University, Makkah"
            case .dubai: return "UAE (Dubai)"
            case .moonsightingCommittee: return "Moonsighting Committee"
            case .northAmerica: return "ISNA (North America)"
            case .kuwait: return "Kuwait"
            case .qatar: return "Qatar"
            case .singapore: return "Singapore"
            case .tehran: return "Tehran"
            case .turkey: return "Turkey"
            case .algerian: return "Algerian"
            case .france: return "France"
            case .russia: return "Russia"
            case .tunisia: return "Tunisia"
            case .morocco: return "Morocco"
            case .jordan: return "Jordan"
            case .oman: return "Oman"
            case .munich: return "Munich"
            case .maldives: return "Maldives"
            case .canada: return "Canada"
            case .tajikistan: return "Tajikistan"
            case .vienna: return "Vienna"
            case .belgium: return "Belgium"
            case .sudan: return "Sudan"
            case .libya: return "Libya"
            case .iraq: return "Iraq"
            case .luxembourg: return "Luxembourg"
            case .other: return "Other"
        }
    }
    
    // MARK: - Reverse Lookup
    public static func from(code: Int) -> CalculationMethod {
        return CalculationMethod(rawValue: code) ?? .muslimWorldLeague
    }
    
    // MARK: - Parameters
    public var params: CalculationParameters {
        switch self {
            case .muslimWorldLeague:
                var params = CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                return params
                
            case .egyptian:
                var params = CalculationParameters(fajrAngle: 19.5, ishaAngle: 17.5, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                return params
                
            case .karachi:
                var params = CalculationParameters(fajrAngle: 18, ishaAngle: 18, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                return params
                
            case .ummAlQura:
                return CalculationParameters(fajrAngle: 18.5, ishaInterval: 90, method: self)
                
            case .dubai:
                var params = CalculationParameters(fajrAngle: 18.2, ishaAngle: 18.2, method: self)
                params.methodAdjustments = PrayerAdjustments(sunrise: -3, dhuhr: 3, asr: 3, maghrib: 3)
                return params
                
            case .moonsightingCommittee:
                var params = CalculationParameters(fajrAngle: 18, ishaAngle: 18, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 5, maghrib: 3)
                return params
                
            case .northAmerica:
                var params = CalculationParameters(fajrAngle: 15, ishaAngle: 15, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                return params
                
            case .kuwait:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17.5, method: self)
                
            case .qatar:
                return CalculationParameters(fajrAngle: 18, ishaInterval: 90, method: self)
                
            case .singapore:
                var params = CalculationParameters(fajrAngle: 20, ishaAngle: 18, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                params.rounding = .up
                return params
                
            case .tehran:
                return CalculationParameters(fajrAngle: 17.7, maghribAngle: 4.5, ishaAngle: 14, method: self)
                
            case .turkey:
                var params = CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                params.methodAdjustments = PrayerAdjustments(fajr: 0, sunrise: -7, dhuhr: 5, asr: 4, maghrib: 7, isha: 0)
                return params
                
            case .algerian:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .france:
                return CalculationParameters(fajrAngle: 12, ishaAngle: 12, method: self)
                
            case .russia:
                return CalculationParameters(fajrAngle: 16, ishaAngle: 15, method: self)
                
            case .tunisia:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 18, method: self)
                
            case .morocco:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .jordan:
                return CalculationParameters(fajrAngle: 18.5, ishaInterval: 90, method: self)
                
            case .oman:
                return CalculationParameters(fajrAngle: 18.5, ishaInterval: 90, method: self)
                
            case .munich:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .maldives:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .canada:
                return CalculationParameters(fajrAngle: 15, ishaAngle: 15, method: self)
                
            case .tajikistan:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .vienna:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .belgium:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .sudan:
                return CalculationParameters(fajrAngle: 19.5, ishaAngle: 17.5, method: self)
                
            case .libya:
                return CalculationParameters(fajrAngle: 19.5, ishaAngle: 17.5, method: self)
                
            case .iraq:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .luxembourg:
                return CalculationParameters(fajrAngle: 18, ishaAngle: 17, method: self)
                
            case .other:
                return CalculationParameters(fajrAngle: 0, ishaAngle: 0, method: self)
        }
    }
}
