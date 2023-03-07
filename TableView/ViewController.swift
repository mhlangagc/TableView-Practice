import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Step: 1 - Create TableView
    // Step 2: - Create Cells (Views of the Table)
    // Step 3: - Register Cells
    // Step 4: - Connect Cells to TableView
    
    // Step 1:
    lazy var slackTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped) // plain, grouped, insertGrouped
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableViewConstraints()
        registerCells()
    }
    
    func setupTableViewConstraints() {
        view.addSubview(slackTableView)
        
        slackTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        slackTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        slackTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        slackTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // Step 3: Register Cell
    func registerCells() {
        slackTableView.register(SlackTableViewCell.self,
                                forCellReuseIdentifier: "SlackTableViewCell")
    }
    
    // DataSource Classes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let slackCell = tableView.dequeueReusableCell(withIdentifier: "SlackTableViewCell",
                                                      for: indexPath) as! SlackTableViewCell
        return slackCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
    
}
