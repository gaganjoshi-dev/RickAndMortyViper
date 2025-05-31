//
//  CoreDataManager.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-31.
//


import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RickAndMortyViper")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("CoreData load failed: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save cartoons to Core Data
    func saveCartoons(_ cartoons: [Cartoon]) {
        clearCartoons()
        for cartoon in cartoons {
            let entity = CartoonEntity(context: context)
            entity.id = Int64(cartoon.id)
            entity.name = cartoon.name
            entity.image = cartoon.image
            entity.species = cartoon.species
        }
        try? context.save()
    }
    
    // Fetch cartoons from Core Data
    func fetchCartoons() -> [Cartoon] {
        let request: NSFetchRequest<CartoonEntity> = CartoonEntity.fetchRequest()
        guard let entities = try? context.fetch(request) else { return [] }
        return entities.map {
            Cartoon(id: Int($0.id), name: $0.name ?? "", image: $0.image ?? "", species: $0.species ?? "")
        }
    }
    
    // Clear cartoons before saving new ones
    private func clearCartoons() {
        let fetchRequest: NSFetchRequest<CartoonEntity> = CartoonEntity.fetchRequest()
        do {
            let entities = try context.fetch(fetchRequest)
            for entity in entities {
                context.delete(entity)
            }
            try context.save()
        } catch {
            print("Failed to clear cartoons: \(error)")
        }
    }
    
}
