import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
		VStack {
			header
			form
			Spacer()
		}
    }

	var header: some View {
		HeaderView(
			title: "Register",
			subtitle: "Start organising todos",
			angle: -15,
			background: .orange
		)
	}

	var form: some View {
		Form {
			TextField("Full Name", text: $viewModel.name)
				.textFieldStyle(.automatic)
				.autocorrectionDisabled()

			TextField("Email Address", text: $viewModel.email)
				.textFieldStyle(.automatic)
				.textInputAutocapitalization(.never)
				.autocorrectionDisabled()

			SecureField("Password", text: $viewModel.password)
				.textFieldStyle(.automatic)

			TLButton(
				title: "Create Account",
				background: .green
			) {
				viewModel.register()
			}
		}
		.offset(y: -50)
	}
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
