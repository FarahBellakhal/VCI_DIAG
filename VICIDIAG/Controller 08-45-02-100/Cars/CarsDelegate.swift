//
//  CarsDelegate.swift


import UIKit

protocol QuantityDelegate: AnyObject {
    func quantityController(car:CarsVC)
}
extension CarsVC: QuantityDelegate  {
    
    func removeData() {
      /*for i in allCountry {
            i.manufacturer[0].quantity! = 0
            i.manufacturer[1].quantity! = 0
            i.manufacturer[2].quantity! = 0
            
            for i in i.manufacturer[0].cars {
                i.carQuantity! = 0
            }
            for i in i.manufacturer[1].cars {
                i.carQuantity! = 0
            }
            for i in i.manufacturer[2].cars {
                i.carQuantity! = 0
            }
       }*/
      //  chosenCarQuantityLbl.text = "0"
       // chosenCarsOverallPriceLbl.text = "0"
        //addedCars.removeAll()
        //cancelBtn.isHidden = true
       // carTableView.reloadData()
  }
    
    func quantityController(car: CarsVC) {
        
      /* var sumOfQuantities = 0
        var sumOfPrices = 0
        
        //Germany
        var sum1 = 0
        for item in bmwCars.cars {
            if item.carQuantity! > 0 {
                sum1 += item.carQuantity!
                bmwCars.quantity! = sum1
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum1 -= item.carQuantity!
                bmwCars.quantity! = sum1
            }
        }
        var sum2 = 0
        for item in mercedesCars.cars {
            if item.carQuantity! > 0 {
                sum2 += item.carQuantity!
                mercedesCars.quantity! = sum2
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum2 -= item.carQuantity!
                mercedesCars.quantity! = sum2
            }
        }
        var sum3 = 0
        for item in audiCars.cars {
            if item.carQuantity! > 0 {
                sum3 += item.carQuantity!
                audiCars.quantity! = sum3
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum3 -= item.carQuantity!
                audiCars.quantity! = sum3
            }
        }
        
        //Italy
        var sum4 = 0
        for item in ferrariCars.cars {
            if item.carQuantity! > 0 {
                sum4 += item.carQuantity!
                ferrariCars.quantity! = sum4
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum4 -= item.carQuantity!
                ferrariCars.quantity! = sum4
            }
        }
        var sum5 = 0
        for item in alfaromeoCars.cars {
            if item.carQuantity! > 0 {
                sum5 += item.carQuantity!
                alfaromeoCars.quantity! = sum5
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum5 -= item.carQuantity!
                alfaromeoCars.quantity! = sum5
            }
        }
        var sum6 = 0
        for item in lamborghiniCars.cars {
            if item.carQuantity! > 0 {
                sum6 += item.carQuantity!
                lamborghiniCars.quantity! = sum6
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum6 -= item.carQuantity!
                lamborghiniCars.quantity! = sum6
            }
        }
        
        //USA
        var sum7 = 0
        for item in chevroletCars.cars {
            if item.carQuantity! > 0 {
                sum7 += item.carQuantity!
                chevroletCars.quantity! = sum7
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum7 -= item.carQuantity!
                chevroletCars.quantity! = sum7
            }
        }
        var sum8 = 0
        for item in teslaCars.cars {
            if item.carQuantity! > 0 {
                sum8 += item.carQuantity!
                teslaCars.quantity! = sum8
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum8 -= item.carQuantity!
                teslaCars.quantity! = sum8
            }
        }
        var sum9 = 0
        for item in fordCars.cars {
            if item.carQuantity! > 0 {
                sum9 += item.carQuantity!
                fordCars.quantity! = sum9
                sumOfPrices += item.carQuantity! * item.price!
                sumOfQuantities += item.carQuantity!
                cancelBtn.isHidden = false
            } else {
                sum9 -= item.carQuantity!
                fordCars.quantity! = sum9
            }
       }*/
        
       // chosenCarsOverallPriceLbl.text = "\(sumOfPrices)$"
      //  chosenCarQuantityLbl.text = "\(sumOfQuantities)"
        //carTableView.reloadData()
   }
}


/*extension CarsVC: chooseCar {
    
    func addCar(cell: CarCell) {
      /*  let indexPath = carTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        
        let currentGermanCar = allCountry[countryIndex].manufacturer[carIndex].cars[index]
        if currentGermanCar.carQuantity == nil {
            currentGermanCar.carQuantity = 0
        }
        currentGermanCar.carQuantity! += 1 */
        carTableView.reloadData()
   }
    
    func removeCar(cell: CarCell) {
       /* let indexPath = carTableView.indexPath(for: cell)
        let index = (indexPath?.row)!
        
        let currentGerman = allCountry[countryIndex].manufacturer[carIndex].cars[index]
        if currentGerman.carQuantity != 0 {
            currentGerman.carQuantity! -= 1
        }*/
        carTableView.reloadData()
    }
}*/
