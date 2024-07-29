import Foundation

/// Dummy view model that provides data to display for a expenses list section.
final class DummySectionViewModel: Identifiable {
    
    /// The section unique identifier.
    var id: String { header }
    
    /// A text shown as a header of the section in the view.
    var header: String
    
    /// Dummy data that provides a list of expenses under the header of the section.
    var rows: [DummyExpenseViewModel]
    
    /// Initializes a new instance of the `DummySectionViewModel`
    /// - Parameters:
    ///   - header: A header text of the section.
    ///   - rows: A static list of expenses to show in the section.
    init(header: String, rows: [DummyExpenseViewModel]) {
        self.header = header
        self.rows = rows
    }
}
