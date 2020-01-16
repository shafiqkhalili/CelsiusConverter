//
//  ViewController.swift
//  CelsiusConverter
//
//  Created by Shafigh Khalili on 2020-01-16.
//  Copyright © 2020 Shafigh Khalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let userDefaultsRowKey = "defaultPickerRow"
    
    private var temperatureValues = (-100...100).map{$0}
    
    let converter = CelsiusConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        temperatureLabel.text = "\(0) °F"
        
        let defaultPickerRow = initialPickerRow()
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: 0, inComponent: 0)
        
        //        for index in -100...100{
        //            temperatureValues.append(index)
        //        }
    }
    
    func initialPickerRow() -> Int{
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = savedRow{
            return row
        }else{
            return temperatureValues.count / 2
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureValues[row]) °C"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let degreeF = temperatureValues[row]
        let degreeC = converter.degreesFahrenheit(degreesCelsius: Int(degreeF))
        temperatureLabel.text = "\(String(degreeC)) °F"
        
        //Save selected row
        saveSelectedRow(row: row)
    }
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }
}

