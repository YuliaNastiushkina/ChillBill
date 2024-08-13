import Foundation
import RealmSwift

/// A singleton class responsible for managing interactions with the Realm database.
final class RealmManager {
    
    // MARK: - Internal interface
   
    /// The shared singleton instance of `RealmManager
    static let shared = RealmManager()
    
    // MARK: - Private interface
    private let realm: Realm
    
    /// This initializer is private to enforce the singleton pattern. 
    /// If the Realm instance cannot be initialized, the application will terminate with a fatal error.
    private init() {
        do {
            self.realm = try Realm()
        } catch let error as NSError {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
}
