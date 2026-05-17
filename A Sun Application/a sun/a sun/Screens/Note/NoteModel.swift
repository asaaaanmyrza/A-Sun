import Foundation

enum NoteType {
    case simpleNote(SimpleNote)
    case financeTracker(FinanceTracker)
    case habitTracker(HabitTracker)
}

struct Note: Identifiable {
    let id: UUID
    let createdAt: Date
    var type: NoteType
    var title: String
    
    init(title: String, type: NoteType) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.type = type
    }
}

struct SimpleNote {
    var content: String
}

struct FinanceTracker {
    var startDate: Date
    var endDate: Date
    var currency: String
    var operations: [Operation]
}

struct Operation: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var amount: Double
    
    enum OperationType {
        case spending
        case income
    }
    
    var type: OperationType
}

struct HabitTracker {
    var startDate: Date
    var endDate: Date
    var habits: [String]
}

extension Note { //Factory
    
    static func makeSimple(title: String, content: String) -> Note {
        let model = SimpleNote(content: content)
        return Note(title: title, type: .simpleNote(model))
    }

    static func makeFinanceTracker(
        title: String,
        startDate: Date,
        endDate: Date,
        currency: String,
    ) -> Note {
        let model = FinanceTracker(
            startDate: startDate,
            endDate: endDate,
            currency: currency,
            operations: []
        )
        return Note(title: title, type: .financeTracker(model))
    }
    
    static func makeHabitTracker(
        title: String,
        startDate: Date,
        endDate: Date,
        habits: [String]
    ) -> Note {
        let model = HabitTracker(startDate: startDate, endDate: endDate, habits: habits)
        return Note(title: title, type: .habitTracker(model))
    }
    
}

