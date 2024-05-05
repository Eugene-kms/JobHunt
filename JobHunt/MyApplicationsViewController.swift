import UIKit

struct VacancyData {
    let image: String
    let title: String
    let company: String
    let category: String
}

class MyApplicationsViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var vacancyData: VacancyData!
    let vacancyCategories: [String] = ["Active", "Ejected"]
    var activeVacancies: [VacancyData] = []
    
    private var currentCategoryIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeVacancies = provideVacancies()
        
        configureTableView()
        configureSegmentedControl()
    }
    
    
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        loadSegments()
        
//        segmentedControl.addTarget(self, action: #selector(onSegmentControlIndexChanged), for: .valueChanged)
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func loadSegments() {
        for (index, category) in vacancyCategories.enumerated() {
            segmentedControl.insertSegment(withTitle: category, at: index, animated: false)
        }
    }
    
//    @objc private func onSegmentControlIndexChanged() {
//        didChangeSelectedIndex(segmentedControl.selectedSegmentIndex)
//        tableView.reloadData()
//    }
//    
//    func didChangeSelectedIndex(_ index: Int) {
//        currentCategoryIndex = index
//    }
    
    func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "VacancyCell", bundle: nil), forCellReuseIdentifier: "VacancyCell")
        tableView.rowHeight = 70
    }
    
    private func provideCategories() {
        
//        var categories: [String: [VacancyData]] = [:]
        
    }
    
    private func provideVacancies() -> [VacancyData] {
        let activeCategory = "Active"
        
        activeVacancies.append(VacancyData(
            image: "google",
            title: "UX Research",
            company: "Google LLC",
            category: activeCategory))
        
        activeVacancies.append(VacancyData(
            image: "microsoft",
            title: "Interaction Designer",
            company: "Microsoft Corporation",
            category: activeCategory))
        
        activeVacancies.append(VacancyData(
            image: "adobe",
            title: "Product Designer",
            company: "Adobe Inc.",
            category: activeCategory))
        
        return activeVacancies
    }
}

extension MyApplicationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return activeVacancies.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell", for: indexPath) as? VacancyCell {
            
            let vacancy = activeVacancies[indexPath.row]
            
            cell.configure(with: vacancy)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
