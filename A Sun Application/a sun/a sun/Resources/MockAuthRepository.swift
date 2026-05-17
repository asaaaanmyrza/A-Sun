import Foundation

final class MockAuthRepository: AuthRepositoryProtocol {
    
    private var users: [User] = {
        
        var user1 = User(
            username: "Асан",
            password: "Мырза"
        )
        
        var workFolder = Folder(name: "Work")
        workFolder.notes = [
            Note.makeSimple(title: "Meeting", content: "Discuss MVVM"),
            Note.makeFinanceTracker(
                title: "Budget",
                startDate: Date(),
                endDate: Date(),
                currency: "$"
            )
        ]
        
        var habitsFolder = Folder(name: "Habits")
        habitsFolder.notes = [
            Note.makeHabitTracker(
                title: "Daily Routine",
                startDate: Date(),
                endDate: Date(),
                habits: ["Run", "Read"]
            )
        ]
        
        user1.folders.append(workFolder)
        user1.folders.append(habitsFolder)

        var user2 = User(
            username: "Мирас",
            password: "Абв"
        )
        
        var personalFolder = Folder(name: "Personal")
        personalFolder.notes = [
            Note.makeSimple(title: "Diary", content: "Good day"),
        ]
        
        var financeFolder = Folder(name: "Finance")
        financeFolder.notes = [
            Note.makeFinanceTracker(
                title: "Expenses",
                startDate: Date(),
                endDate: Date(),
                currency: "€"
            )
        ]
        
        user2.folders.append(personalFolder)
        user2.folders.append(financeFolder)
        
        return [user1, user2]
    }()
    
    
    func login(username: String, password: String) -> User? {
        users.first {
            $0.username == username && $0.password == password
        }
    }
}

protocol AuthRepositoryProtocol {
    func login(username: String, password: String) -> User?
}

protocol NotesRepositoryProtocol {
    func getUser() -> User
    func updateUser(_ user: User)
}
