import Combine
import Foundation

final class UserViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func createFolder(name: String) {
        user.folders.append(Folder(name: name))
    }
    
    func createSimpleNote(title: String, content: String) {
        if let index = user.generalFolderIndex {
            user.folders[index].notes.append(Note.makeSimple(title: title, content: content))
        }
    }
    
    func createFinanceTracker(title: String, startDate: Date, endDate: Date, currency: String) {
        if let index = user.generalFolderIndex {
            user.folders[index].notes.append(Note.makeFinanceTracker(title: title, startDate: startDate, endDate: endDate, currency: currency))
        }
    }
    
    func createHabitTracker(title: String, startDate: Date, endDate: Date, habits: [String]) {
        if let index = user.generalFolderIndex {
            user.folders[index].notes.append(Note.makeHabitTracker(title: title, startDate: startDate, endDate: endDate, habits: habits))
        }
    }
}
