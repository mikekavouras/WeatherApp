//
//  TableDataSource.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/3/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import UIKit


class TableDataSource: NSObject, UITableViewDataSource {
    var weatherArray:[WeatherObject]?
    var catFactsArray: [String]?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let weatherArray = weatherArray {
            return weatherArray.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherTableViewCell{
            
            
            if let weatherArray = weatherArray {
                
                let dateInteger = weatherArray[indexPath.row].date/1000
                let currentDate = Date(timeIntervalSince1970: TimeInterval(dateInteger))
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd,yyyy"
                let formattedDate = dateFormatter.string(from: currentDate)
                
                
                cell.minLabel.text       = "min" + String(describing: weatherArray[indexPath.row].min)
                cell.maxLabel.text       = "max" + String(describing: weatherArray[indexPath.row].max)
                cell.dateLabel.text     = formattedDate
                cell.morningLabel.text   = String(describing: weatherArray[indexPath.row].morn)
                cell.dayLabel.text       = String(describing: weatherArray[indexPath.row].day)
                cell.humidityLabel.text  = String(describing: weatherArray[indexPath.row].Humidity)
                cell.mainLabel.text     = weatherArray[indexPath.row].main
                cell.nightLabel.text    = String(describing: weatherArray[indexPath.row].night)
                cell.speedLabel.text    = String(describing: weatherArray[indexPath.row].speed)
                
                if let catFactsArray = catFactsArray {
                    if catFactsArray.count > 0 {
                        cell.catFactLabel.text = catFactsArray[indexPath.row]
                    }
                }
                cell.backgroundPusheenImage.image = UIImage(named: cell.mainLabel.text!)
                
                return cell
            }
            else{
                print("error")
                return UITableViewCell()
            }
        }
        else{
            print("error matching cells to array values")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250.00//Choose your custom row height
    }
    
    
    
    
}
