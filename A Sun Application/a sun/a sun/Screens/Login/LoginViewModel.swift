import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var currentUser: User?
    @Published var error: String?
    
    private let repo: AuthRepositoryProtocol
    
    init(repo: AuthRepositoryProtocol) {
        self.repo = repo
    }
    
    func login() {
        if let user = repo.login(username: username, password: password) {
            currentUser = user
            error = nil
        } else {
            error = "Неверный логин или пароль"
        }
    }
}
