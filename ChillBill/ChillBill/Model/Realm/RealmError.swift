/// Representing of errors that can occur when working with the Realm database.
enum RealmError: Error {
    case initializationFailed(reason: String)
    case writeFailed(reason: String)
}
