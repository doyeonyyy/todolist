import UIKit

class TodoListViewController: UIViewController {
    
    var task: Task?
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let cell = sender as? TodoListTableViewCell else { return }
//        if segue.identifier == "detail" {
//            if let vc = segue.destination as? TodoDetailViewController {
//                vc.task = cell.task
//            }
//        }
//    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in textField.placeholder = "할 일을 입력해주세요"
        }
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let self else { return }
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                let newItem = Task(id: (TaskList.list.last?.id ?? -1) + 1,
                                   title: title,
                                   isCompleted: false)
                TaskList.list.append(newItem)
                self.tableView?.insertRows(at: [IndexPath(row:
                                                            TaskList.list.count-1, section: 0)], with: .automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return TaskList.list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt
                   indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListTableViewCell; cell.setTask(TaskList.list[indexPath.row])
        return cell
    }
    
//    💡 ⬇️ 에디팅 스타일이 delete이면 리스트에서 제거하는 함수 ⬇️
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                TaskList.list.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt
                   indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
