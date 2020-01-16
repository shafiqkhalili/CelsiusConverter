//
//  CelsiusConverter.swift
//  CelsiusConverter
//
//  Created by Shafigh Khalili on 2020-01-16.
//  Copyright © 2020 Shafigh Khalili. All rights reserved.
//

import Foundation
class CelsiusConverter{
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        let  degreeF = 1.8 * Double(degreesCelsius) + 32.0
        return Int(round(degreeF))
    }
}
