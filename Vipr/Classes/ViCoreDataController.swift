//
//  ViCoreDataController.swift
//  Pods
//
//  Created by iljn on 7/16/17.
//
//

import Foundation
import CoreData

open class ViCoreDataController: NSObject {
    
    // MARK: Static Data
    // --------------------------------------------------------------------------
    open static var momdResourceName:String?
    
    // MARK: Instance Data
    // --------------------------------------------------------------------------
    open var isInitialized: Bool = false
    open var managedObjectContext: NSManagedObjectContext?
    
    // MARK: Initialization
    // --------------------------------------------------------------------------
    public init(completionClosure: @escaping () -> ()) {
        if ViCoreDataController.momdResourceName == nil {
            ViLog.warn("ViCoreDataController", "failed to initialize, no momd resource name provided", .DEBUG)
            DispatchQueue.main.sync(execute: completionClosure)
            return
        }
        ViLog.open("ViCoreDataController", "init", .VERBOSE)
        
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: ViCoreDataController.momdResourceName!, withExtension:"momd") else {
            ViLog.err("ViCoreDataController", "error loading model from bundle", .DEBUG)
            DispatchQueue.main.sync(execute: completionClosure)
            return
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            ViLog.err("ViCoreDataController", "Error initializing mom from: \(modelURL)", .DEBUG)
            DispatchQueue.main.sync(execute: completionClosure)
            return
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext?.persistentStoreCoordinator = psc
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                ViLog.err("ViCoreDataController", "Unable to resolve document directory", .DEBUG)
                DispatchQueue.main.sync(execute: completionClosure)
                return
            }
            let storeURL = docURL.appendingPathComponent("DailyGraph.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
                DispatchQueue.main.sync(execute: completionClosure)
            } catch {
                ViLog.err("ViCoreDataController", "Error migrating store: \(error)", .DEBUG)
                DispatchQueue.main.sync(execute: completionClosure)
                return
            }
        }
        ViLog.close("ViCoreDataController", "init", .VERBOSE)
    }
    
    // MARK: Universal Save Context
    // --------------------------------------------------------------------------
    open func saveManagedObjectContext(_ action: String) -> Bool {
        do {
            try managedObjectContext?.save()
            ViLog.log("ViCoreDataController", "\(action) success", .VERBOSE)
            return true
        } catch let error as NSError {
            ViLog.err("ViCoreDataController", "failed to \(action): \(error.debugDescription)", .DEBUG)
            return false
        }
    }
    
    // MARK: Universal Get Persistant Object
    // --------------------------------------------------------------------------
    open func objectForUri(_ uri: URL?) -> NSManagedObject? {
        if uri == nil {
            ViLog.warn("ViCoreDataController objectForUri", "aborting, provided uri was nil", .DEBUG)
            return nil
        }
        let objectId: NSManagedObjectID? = managedObjectContext?.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: uri!)
        if objectId == nil {
            ViLog.warn("ViCoreDataController objectForUri", "aborting, could not find object for uri", .DEBUG)
            return nil
        }
        return managedObjectContext?.object(with: objectId!)
    }
    
    // MARK: Universal Create Managed Objects
    // --------------------------------------------------------------------------
    open func createMO(_ entityName: String) -> Any {
        if managedObjectContext == nil {
            ViLog.err("ViCoreDataController createMO", "aborted, managedObjectContext is not available", .VERBOSE)
            return false
        }
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext!)
    }
    
    // MARK: Universal Fetch Managed Objects
    // --------------------------------------------------------------------------
    open func fetchMO(_ entityName: String) -> [Any] {
        let graphFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            guard let objs = try managedObjectContext?.fetch(graphFetch) else {
                ViLog.err("ViCoreDataController", "failed to fetch saved \(entityName)s", .DEBUG)
                return []
            }
            ViLog.log("ViCoreDataController", "success fetching \(objs.count) saved \(entityName)s", .VERBOSE)
            return objs
        } catch {
            ViLog.err("ViCoreDataController", "failed to fetch saved \(entityName)s: \(error)", .DEBUG)
        }
        return []
    }
    
}
