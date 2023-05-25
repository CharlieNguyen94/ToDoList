import Foundation

struct ToDoListItem: Codable, Identifiable, Equatable {
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createdDate: TimeInterval
	var isDone: Bool

	mutating func setDone(_ state: Bool) {
		isDone = state
	}
}
