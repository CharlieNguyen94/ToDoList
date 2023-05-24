import SwiftUI

struct RegisterView: View {
	@State var name = ""
	@State var email = ""
	@State var password = ""

    var body: some View {
		VStack {
			HeaderView(
				title: "Register",
				subtitle: "Start organizing todos",
				angle: -15,
				background: .orange
			)

			Form {
				TextField("Full Name", text: $name)
					.textFieldStyle(.automatic)
					.autocorrectionDisabled()

				TextField("Email Address", text: $email)
					.textFieldStyle(.automatic)
					.textInputAutocapitalization(.none)
					.autocorrectionDisabled()

				SecureField("Password", text: $password)
					.textFieldStyle(.automatic)

				TLButton(
					title: "Create Account",
					background: .green
				) {

				}
			}
			.offset(y: -50)

			Spacer()
		}
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
