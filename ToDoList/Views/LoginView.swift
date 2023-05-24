import SwiftUI

struct LoginView: View {

	@StateObject var viewModel = LoginViewViewModel()

    var body: some View {
		NavigationView {
			VStack {
				HeaderView(
					title: "To Do List",
					subtitle: "Get things done",
					angle: 15,
					background: .pink
				)

				Form {
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage)
							.foregroundColor(.red)
					}
					TextField("Email Address", text: $viewModel.email)
						.textFieldStyle(.automatic)
						.textInputAutocapitalization(.none)

					SecureField("Password", text: $viewModel.password)
						.textFieldStyle(.automatic)

					TLButton(
						title: "Log in",
						background: .blue
					) {
						viewModel.login()
					}
				}
				.offset(y: -50)

				VStack {
					Text("New around here?")
					NavigationLink(
						"Create An Account",
						destination: RegisterView()
					)
				}
				.padding(.bottom, 50)

				Spacer()

			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
