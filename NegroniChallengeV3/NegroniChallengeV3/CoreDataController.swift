//
//  CoreDataController.swift
//  NegroniChallengeV3
//
//  Created by Chiara Pellecchia on 21/11/2019.
//  Copyright © 2019 Chiara Pellecchia. All rights reserved.
//

import UIKit

import Foundation
import CoreData
import UIKit

class CoreDataController {
    static let shared = CoreDataController()
  
    private var context: NSManagedObjectContext
    var trips = [Trip]()
    var newTrip = Trip()
    
    private init() {
        let application = UIApplication.shared.delegate as! AppDelegate
        self.context = application.persistentContainer.viewContext
    }
    
    func addTrip(title: String, creationData: String, photo: Data) {
            /*
                Per creare un oggetto da inserire in memoria è necessario creare un riferimento all'Entity (NSEntityDescription) da cui si copierà la struttura di base
             */
            let entity = NSEntityDescription.entity(forEntityName: "Trip", in: self.context)
            
            /*
                creiamo un nuovo oggetto NSManagedObject dello stesso tipo descritto dalla NSEntityDescription
                che andrà inserito nel context dell'applicazione
             */
            newTrip = Trip(entity: entity!, insertInto: self.context)
            newTrip.id = 0
            newTrip.title = title
            newTrip.creationData = creationData
            
        do {
                try self.context.save() // la funzione save() rende persistente il nuovo oggetto (newLibro) in memoria
            } catch let errore {
                print("[CDC] Problema salvataggio Trip: \(newTrip.title!) in memoria")
                print("  Stampo l'errore: \n \(errore) \n")
            }
            
            print("[CDC] Libro \(newTrip.title!) salvato in memoria correttamente")
        }
    
    
    func addPage(date: String, desc: String, photo: Data ) {
            /*
                Per creare un oggetto da inserire in memoria è necessario creare un riferimento all'Entity (NSEntityDescription) da cui si copierà la struttura di base
             */
            let entity = NSEntityDescription.entity(forEntityName: "Page", in: self.context)
            
            /*
                creiamo un nuovo oggetto NSManagedObject dello stesso tipo descritto dalla NSEntityDescription
                che andrà inserito nel context dell'applicazione
             */
            let newPage = Page(entity: entity!, insertInto: self.context)
            newPage.date = date
            newPage.desc = desc

        newTrip.addToPage(newPage)
        
        do {
                try self.context.save() // la funzione save() rende persistente il nuovo oggetto (newLibro) in memoria
            } catch let errore {
                print("[CDC] Problema salvataggio Page: \(newPage.date!) in memoria")
                print("  Stampo l'errore: \n \(errore) \n")
            }
            
            print("[CDC] Pagina \(newPage.date!) salvato in memoria correttamente")
        }
        
        /*
            La funzione carica e stampa in console tutti i libri presenti nella memoria
         */
        func loadAllTrips() {
            print("[CDC] Recupero tutti i viaggi dal context ")
            
            let request: NSFetchRequest<Trip> = NSFetchRequest(entityName: "Trip") // l'oggetto rappresenta una richiesta da inviare al context per la ricerca di oggetti di tipo entityName (nome dell'entity da cercare)
            request.returnsObjectsAsFaults = false
            
            trips = self.loadTripsFromFetchRequest(request: request)
            
        }
        
        /*
          La funzione restituisce un array di libri dopo aver eseguito la request
        */
        private func loadTripsFromFetchRequest(request: NSFetchRequest<Trip>) -> [Trip] {
            var array = [Trip]()
            do {
                array = try self.context.fetch(request)
                
                guard array.count > 0 else {print("[CDC] Non ci sono elementi da leggere "); return []}
                
                for x in array {
                    print("[CDC] Viaggio \(x.title!) - Data \(x.creationData!)")
                }
                
            } catch let errore {
print("[CDC] Problema esecuzione FetchRequest")
                print("  Stampo l'errore: \n \(errore) \n")
            }
            
            return array
        }
        
    
    /*
      La funzione restituisce un array di viaggio dopo aver eseguito la request sulla Search Bar
    */
    func loadTripFromTitle(title: String) {
        print("[CDC] Recupero tutti i viaggi dal context ")
        
        let request: NSFetchRequest<Trip> = NSFetchRequest(entityName: "Trip")
        request.returnsObjectsAsFaults = false
        
        let predicate = NSPredicate(format: "title = %@", title) // L'oggetto predicate permette di aggiungere dei filtri sulla NSFetchRequest
        request.predicate = predicate
        
        trips = self.loadTripsFromFetchRequest(request: request)
    }
    
    
    /*
     La funzione recupera il viaggio che ha lo stesso id del parametro "id" (qualora esistesse)
     */
    func loadTripFromId(id: Int16) -> Trip {
        let request: NSFetchRequest<Trip> = NSFetchRequest(entityName: "Trip")
        request.returnsObjectsAsFaults = false
        
        let predicate = NSPredicate(format: "id = %@", id)
        request.predicate = predicate
        
        let trips = self.loadTripsFromFetchRequest(request: request)
        return trips[0]
    }

        
        /*
            La funzione cancella dalla memoria il libro che ha per nome il paramentro "name"
         */
        func deleteTrip(id: Int16) {
            let trip = self.loadTripFromId(id: id)
            self.context.delete(trip)
            
            do {
                try self.context.save()
            } catch let errore {
                print("[CDC] Problema eliminazione viaggio ")
                print("  Stampo l'errore: \n \(errore) \n")
            }
        }
        
    }
