import Foundation
import RealmSwift

/// A class responsible for managing interactions with the Realm database.
final class RealmManager {
    
    // MARK: - Internal interface
    
    /// Initializes a new instance of `RealmManager` with the specified Realm configuration.
    /// - Parameter configuration: The configuration to use when initializing the Realm instance. Defaults to `.defaultConfiguration`.
    init(configuration: Realm.Configuration = .defaultConfiguration) {
        do {
            self.realm = try Realm(configuration: configuration)
        } catch {
            print("Failed to initialize Realm: \(error.localizedDescription)")
            self.realm = nil
        }
    }
    
    /// Adds an object to the Realm database.
    /// - Parameter object: The object to be added to the database.
    func addObject(_ object: Object) {
        write {
            realm?.add(object)
        }
    }
    
    /// Retrieves all objects of the specified type from the Realm database.
    /// - Parameter type: The type of objects to fetch from the database.
    /// - Returns: An array of objects of the specified type, or an empty array if no objects are found or if Realm is not initialized.
    func fetchObjects<T: Object>(ofType type: T.Type) -> [T] {
        guard let result = realm?.objects(type) else {
            return []
        }
        return Array(result)
    }
    
    /// Deletes an object from the Realm database.
    /// - Parameter object: The object to be deleted from the database.
    func deleteObject(_ object: Object) {
        write {
            realm?.delete(object)
        }
    }
    
    // MARK: - Private interface
    
    private(set) var realm: Realm?
    
    /// Writes a block of code to the Realm database.
    /// - Parameter block: A closure containing the operations to be performed within the write transaction.
    private func write(_ block: () -> Void) {
        do {
            try realm?.write {
                block()
            }
        } catch {
            print("Failed to write to Realm: \(error)")
        }
    }
}
