import SwiftUI

struct LoginView: View {
    
    @State private var goNext = false
    
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(UITextContentType.username)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Login") {
                    viewModel.login()
                    goNext.toggle()
                }
                .navigationDestination(isPresented: $goNext) {
                    MainView(viewModel: UserViewModel(user: viewModel.currentUser!))
                }
                
                if let error = viewModel.error {
                    Text(error).foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(repo: MockAuthRepository()))
}
