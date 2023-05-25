import Foundation

struct ToListItem: Codable, Identifiable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval
	var isDone: Bool

	mutating func setDone(_ state: Bool) {
		isDone = state
	}
}
