import Foundation

struct TaskList {
    static var list: [Task] = [
        Task(id: 0, title: "Swift 공식문서 읽기", isCompleted: false),
        Task(id: 1, title: "UIKit 공식문서 찾아보기", isCompleted: false),
    ]
    
    static func completeList() -> [Task] {
        return list.filter{ $0.isCompleted == true }
    }
    
    static func completeTask(task: Task, isCompleted: Bool) {
        for index in 0 ..< list.count {
            if list[index].id == task.id {
                list[index].isCompleted = isCompleted
            }
        }
    }
    static func deleteTask(task: Task) {
        list.removeAll(where: {$0.id == task.id})
    }
}
