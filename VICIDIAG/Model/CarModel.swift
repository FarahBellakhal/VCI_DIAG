//
//  CarModel.swift


import UIKit
import Foundation
//import RealmSwift

/*class Country {
    //var name: String!
    var manufacturer: [ManufacturerCountry]!
    
    init(manufacturer:[ManufacturerCountry]) {
        //self.name = name
        self.manufacturer = manufacturer
    }
}
class ManufacturerCountry {
    var logo: UIImage!
    var brandName: String!
    var cars: [Car]!
   
    init(logo:UIImage, brandName:String, cars: [Car]) {
        self.logo = logo
        self.brandName = brandName
        self.cars = cars
        //self.Ecu = Ecu
        
    }
}
class Car {
    //var image: UIImage!
    //var logo: UIImage!
    var carModel: [Model]!
   
    
    
    init(carModel: [Model]) {
        //self.image = image
       // self.logo = logo
        self.carModel = carModel
       
    }
}
class Model {
    var image: UIImage!
    var ModelName: String!
    var ecu:[ECU]!
    
    init(image:UIImage,ModelName: String, ecu:[ECU] ){
        self.image = image
        self.ModelName = ModelName
        self.ecu = ecu
    }
}
class ECU {
    var ECUName: String!
    var fonct:[Fonct]!
    
    init(ECUName : String, fonct : [Fonct] ){
        self.ECUName = ECUName
        self.fonct = fonct
    }
}
class Fonct {
    var FonctName: String!
    init(FonctName : String){
        self.FonctName = FonctName
        
    }
}*/

/*class Country: Object {
    @objc  dynamic var  manufacturer : [ManufacturerCountry]!
    //@Persisted var manufacturer: List<ManufacturerCountry> // Embed an array of objects
    convenience init(manufacturer:[ManufacturerCountry]){
        self.init()
        self.manufacturer = manufacturer
    }
  
}*/
 class Marque{
      
    
      var brandName:String?
     var logo:String
     
      init(brandName : String?,logo:String) {
        
         //self.logo = logo
         self.brandName = brandName
          self.logo = logo
     }
}
//let marque1 = Marque(id:"11",brandName: "Peugeot")
//let marque2 = Marque(brandName: "Citroen")
//let marque3 = Marque(brandName: "BMW")
//let marques = Marque()
//let allmarque = [marque1,marque2,marque3]
class Car {
   
    var carModel: Model?
     init(carModel:Model){
       
        self.carModel = carModel
    }
   
}
class Model {
    //@objc  dynamic var image: UIImage!
    var ModelName: String =  ""
    init( ModelName: String) {
        
       // self.image = image
        self.ModelName = ModelName
       
    }

}



class ECU {
     var ECUName: String =  ""
     
     var logo:String
    init(ECUName : String, logo :String ) {
        
        self.ECUName = ECUName
        
        self.logo = logo
    }
}
class Fonct {
     var FonctName: String =  ""
     //var fonct : String =  ""
   
     var logo:String
    init(FonctName : String, logo :String ) {
        
        self.FonctName = FonctName
       
        self.logo = logo
    }
}
class Menu {
    var nom: String =  ""
    //var fonct : String =  ""

   init(nom : String ) {
       
       self.nom = nom
   }
}
 /*class Fonct: Object {
     @objc dynamic var FonctName: String =  ""
    convenience init(FonctName : String){
        self.init()
     self.FonctName = FonctName
}
}*/


//var model1 = Model(image: #imageLiteral(resourceName: "308"),ModelName: "308",ecu:[ecu1,ecu2,ecu3,ecu4])
//aDefaultRealm.write {
    //aDefaultRealm.add(anObject)
//}


//MODEL
/*let model1 = Model(ModelName: "308",ecu:"Mesures paramètres,Lecture Défauts,Vérification vin,Identification")
let model2 = Model(ModelName: "306",ecu:"Mesures paramètres,Lecture Défauts")
let model3 = Model(ModelName: "206",ecu:"Mesures paramètres,Lecture Défauts")
let allmodel = [model1,model2,model3]

//calculateurs
let ecu1 = ECU(ECUName: "Mesures paramètres",fonct:"Send Request Activation,Diagnostique Message,Régime Moteur,Température,Injections")
let ecu2 = ECU(ECUName: "Lecture Défauts",fonct: "Send Request Activation")
let ecu3 = ECU(ECUName: "Vérification vin",fonct:"Send Request Activation")
let ecu4 = ECU(ECUName: "Identification",fonct:"Send Request Activation")

let allECU = [ecu1,ecu2,ecu3,ecu4]*/

//fonctionalité
/*let fonc0 = Fonct(FonctName: "Send Request Activation")
let fonc1 = Fonct(FonctName: "Diagnostique Message ")
let fonc2 = Fonct(FonctName: "Régime Moteur")
let fonc3 = Fonct(FonctName: "Température")
let fonc4 = Fonct(FonctName: "Injections")
let allFonct = [fonc0,fonc1,fonc2,fonc3]*/


//peugeot cars
/*let peugeot1 = Car(carModel: model1)
let peugeot2 = Car(carModel: model2)
let peugeot3 = Car(carModel: model3)
let peugeotCars = ManufacturerCountry( brandName: "PEUGEOT", cars: peugeot1)



//mercedes cars
let mercedes1 = Car( carModel: model1)
let mercedes2 = Car( carModel: model1)
let mercedes3 = Car(carModel: model1)
let mercedesCars = ManufacturerCountry( brandName: "MERCEDES", cars: mercedes1)

let audi1 = Car( carModel: model1)
let audi2 = Car( carModel: model1)
let audi3 = Car( carModel: model1)
let audiCars = ManufacturerCountry( brandName: "AUDI", cars: audi1)

let germanCars = Country(manufacturer: [peugeotCars,mercedesCars,audiCars])


//Italy
let ferrari1 = Car( carModel: model1)
let ferrari2 = Car(carModel: model1)
let ferrari3 = Car(carModel: model1)
let ferrariCars = ManufacturerCountry( brandName: "FERRARI",cars: ferrari1)


let alfaromeo1 = Car( carModel: model1)
let alfaromeo2 = Car(carModel: model1)
let alfaromeo3 = Car( carModel: model1)
let alfaromeoCars = ManufacturerCountry( brandName: "ALFA ROMEO", cars: alfaromeo1)


let lamborghini1 = Car(carModel: model1)
let lamborghini2 = Car( carModel: model1 )
let lamborghini3 = Car(carModel: model1)
let lamborghiniCars = ManufacturerCountry(brandName: "LAMBORGHINI", cars: lamborghini1)

let italianCars = Country(manufacturer: [ferrariCars,alfaromeoCars,lamborghiniCars])


//USA
let chevrolet1 = Car( carModel: model1)
let chevrolet2 = Car( carModel: model1)
let chevrolet3 = Car(carModel: model1)
let chevroletCars = ManufacturerCountry( brandName: "CHEVROLET", cars: chevrolet1)

let tesla1 = Car(carModel: model1)
let tesla2 = Car(carModel: model1)
let tesla3 = Car(carModel: model1)
let teslaCars = ManufacturerCountry( brandName: "TESLA", cars: tesla1)

let bmw1 = Car(carModel:model1)
let bmw2 = Car(carModel: model1)
let bmw3 = Car(carModel: model1)
let bmwCars = ManufacturerCountry( brandName: "BMW", cars: bmw1)

let usaCars = Country(manufacturer: [chevroletCars,teslaCars,bmwCars])


let allCountry = [germanCars,italianCars,usaCars]
*/
