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

public enum CalculationMethod: Int, Codable, CaseIterable {
    case karachi              = 1
    case northAmericaUSA      = 2
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
    case northAmericaCanada   = 20
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
            case .muslimWorldLeague: return "Muslim World League (MWL)"
            case .egyptian: return "Egyptian General Authority of Survey"
            case .karachi: return "University of Islamic Sciences, Karachi"
            case .ummAlQura: return "Umm al-Qura University, Makkah"
            case .dubai: return "UAE – General Authority of Islamic Affairs & Endowments (Dubai)"
            case .moonsightingCommittee: return "Moonsighting Committee Worldwide"
            case .northAmericaUSA: return "Islamic Society of North America (ISNA) - USA"
            case .northAmericaCanada: return "Fiqh Council of North America - Canada"
            case .kuwait: return "Ministry of Awqaf and Islamic Affairs, Kuwait"
            case .qatar: return "Qatar Calendar House"
            case .singapore: return "Majlis Ugama Islam Singapura (MUIS)"
            case .tehran: return "Institute of Geophysics, University of Tehran"
            case .turkey: return "Türkiye Diyanet İşleri Başkanlığı (Diyanet)"
            case .algerian: return "Ministry of Religious Affairs and Endowments, Algeria"
            case .france: return "Union des Organisations Islamiques de France (UOIF)"
            case .russia: return "Spiritual Administration of Muslims of Russia"
            case .tunisia: return "Ministry of Religious Affairs, Tunisia"
            case .morocco: return "Ministry of Habous and Islamic Affairs, Morocco"
            case .jordan: return "Jordanian Ministry of Awqaf Islamic Affairs and Holy Places"
            case .oman: return "Ministry of Awqaf and Religious Affairs, Oman"
            case .munich: return "Islamic Centre of Munich"
            case .maldives: return "Ministry of Islamic Affairs, Maldives"
            case .tajikistan: return "Islamic Centre of Tajikistan"
            case .vienna: return "Islamic Centre of Vienna"
            case .belgium: return "Islamic and Cultural Centre of Belgium"
            case .sudan: return "Sudan University of Science and Technology (Astronomy Dept.)"
            case .libya: return "General Authority of Islamic Affairs, Libya"
            case .iraq: return "Sunni Endowment Office, Iraq"
            case .luxembourg: return "Islamic Centre of Luxembourg"
            case .other: return "Custom / Manual Method"
        }
    }
    
    // MARK: - Description with calculation details
    public var detailedDescription: String {
        switch self {
            case .muslimWorldLeague:
                return "Muslim World League (MWL) - Fajr: 18°, Isha: 17°"
            case .egyptian:
                return "Egyptian General Authority of Survey - Fajr: 19.5°, Isha: 17.5°"
            case .karachi:
                return "University of Islamic Sciences, Karachi - Fajr: 18°, Isha: 18°"
            case .ummAlQura:
                return "Umm al-Qura University, Makkah - Fajr: 18.5°, Isha: 90 min after Maghrib"
            case .dubai:
                return "UAE Dubai - Fajr: 18.2°, Isha: 18.2°"
            case .northAmericaUSA:
                return "ISNA USA - Fajr: 15°, Isha: 15°"
            case .northAmericaCanada:
                return "Fiqh Council Canada - Fajr: 13°, Isha: 13°"
            case .qatar:
                return "Qatar Calendar House - Fajr: 18°, Isha: 90 min after Maghrib"
            case .jordan:
                return "Jordan Ministry of Awqaf - Fajr: 18.5°, Isha: 90 min after Maghrib"
            case .oman:
                return "Oman Ministry of Awqaf - Fajr: 18.5°, Isha: 90 min after Maghrib"
            case .tehran:
                return "University of Tehran - Fajr: 17.7°, Maghrib: 4.5°, Isha: 14°"
            case .singapore:
                return "MUIS Singapore - Fajr: 20°, Isha: 18°"
            case .france:
                return "UOIF France - Fajr: 12°, Isha: 12°"
            case .russia:
                return "Russia Muslims Administration - Fajr: 16°, Isha: 15°"
            default:
                return name
        }
    }
    
    // MARK: - Reverse Lookup
    public static func from(code: Int) -> CalculationMethod {
        return CalculationMethod(rawValue: code) ?? .muslimWorldLeague
    }
    
    // MARK: - Parameters
    public var params: CalculationParameters {
        switch self {
            case .muslimWorldLeague, .other:
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
                
            case .northAmericaUSA:
                var params = CalculationParameters(fajrAngle: 15, ishaAngle: 15, method: self)
                params.methodAdjustments = PrayerAdjustments(dhuhr: 1)
                return params
                
            case .northAmericaCanada:
                var params = CalculationParameters(fajrAngle: 13, ishaAngle: 13, method: self)
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
        }
    }
}
