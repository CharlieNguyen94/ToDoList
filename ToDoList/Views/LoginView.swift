import SwiftUI

struct LoginView: View {

	@StateObject var viewModel = LoginViewViewModel()

    var body: some View {
		NavigationView {
			VStack {
				header
				form
				createAccountButton
				Spacer()
			}
		}
    }

	var header: some View {
		HeaderView(
			title: "To Do List",
			subtitle: "Get things done",
			angle: 15,
			background: .pink
		)
	}

	var form: some View {
		Form {
			if !viewModel.errorMessage.isEmpty {
				Text(viewModel.errorMessage)
					.foregroundColor(.red)
			}
			TextField("Email Address", text: $viewModel.email)
				.textFieldStyle(.automatic)
				.textInputAutocapitalization(.never)

			SecureField("Password", text: $viewModel.password)
				.textFieldStyle(.automatic)

			loginButton
		}
		.offset(y: -50)
	}

	var loginButton: some View {
		TLButton(
			title: "Log in",
			background: .blue
		) {
			viewModel.login()
		}
	}

	var createAccountButton: some View {
		VStack {
			Text("New around here?")
			NavigationLink(
				"Create An Account",
				destination: RegisterView()
			)
		}
		.padding(.bottom, 50)
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
